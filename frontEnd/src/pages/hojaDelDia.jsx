import React, { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useTheme } from "@mui/material/styles";
import {
  Paper,
  Button,
  Typography,
  Box,
  Grid,
  Container,
  useMediaQuery
} from "@mui/material";
import Head from "next/head";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { DateCalendar } from "@mui/x-date-pickers/DateCalendar";
import CustomDataGridComponent,{getNroFacturasACerrar} from "src/sections/hojaDelDia/enviosXHoja-table";
import HojaDelDiaService from "src/service/hojaDelDiaService";
import { useAuth } from "src/contexts/AuthContext";
import { set } from "nprogress";
import IniciarEntregaDialog from "src/sections/hojaDelDia/iniciarEntrega";
import CerrarHoja from "src/sections/hojaDelDia/cerrarHoja";


const HojaDelDia = () => {
  const authContext = useAuth();
  const hojasService = new HojaDelDiaService(authContext);
  const [hojaSelecionada, setHojaSelecionada] = useState({});
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [hojasDelDia, setHojasDelDia] = useState([]);
  const [dialogIniciarEntregaOpen, setDialogIniciarEntregaOpen] = useState(false);
  const [dialogCerrarHojaOpen, setDialogCerrarHojaOpen] = useState(false);
  const [enviosSeleccionados, setEnviosSeleccionados] = useState([]);
  const [nroDeFacturasACerrar, setNroDeFacturasACerrar] = useState([]);

  //Estilos
  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down('xs'));
  const isSmall = useMediaQuery(theme.breakpoints.down('sm'));

  const handleEnviosSeleccionadosChange = (selectedEnvios) => {
    setEnviosSeleccionados(selectedEnvios);
  };
  

  const getAllHojasDelDia = async () => {
    
    try {
      const data = await hojasService.getAll();
      setHojasDelDia(data);
      //alert de data pasado a json
      setHojaSelecionada(data[1]);
      // alert(JSON.stringify(data[1]));
    } catch (error) {
      console.log(error);
    }
  };

  const getByFechaReparto = async (fechaReparto) => {
    try {
      const data = await hojasService.getByFechaReparto(fechaReparto.toISOString().split("T")[0]);
      setHojaSelecionada(data);
    } catch (error) {
      //si hay un error 400 setea la hoja del dia como vacia
      setHojaSelecionada({});
    }
  };

  const handleDateChange = (date) => {
    //formatea la fecha a yyyy-mm-dd
    //setSelectedDate(date.toISOString().split("T")[0]);

    //buscar la hoja del dia con la fecha seleccionada y valida que si de un arreglo vacio
    getByFechaReparto(date);
  };

  const handleImprimir = () => {
    // Lógica para el botón Imprimir
    // ...
  };

  const apiRef = useRef(null);

  const [dataGridApiRef, setDataGridApiRef] = useState(null);

const handleCerrarHoja = () => {
  if (dataGridApiRef && dataGridApiRef.current) {
    getNroFacturasACerrar({ apiRef: dataGridApiRef.current });
  }
  setDialogCerrarHojaOpen(true);
};


  const cerrarHoja = async () => {
    try {
      alert("Se esta por cerrar la hoja" + hojaSelecionada.idHojaDelDia)
      await hojasService.cerrarHojaDelDia(hojaSelecionada.idHojaDelDia, nroDeFacturasACerrar);
      alert("Se cerro la hoja");
    } catch (error) {
      alert(error.response.data.message);
    }
  }


  const handleIniciarEntrega = () => {
    // Lógica para el botón Iniciar Entrega
    setDialogIniciarEntregaOpen(true);
    
  };

  const iniciarEntrega = async () => { 
    try {
      alert("Se esta por iniciar la hoja" + hojaSelecionada.idHojaDelDia)
      await hojasService.iniciarEntrega(hojaSelecionada.idHojaDelDia);
      alert("Se inicio la entrega");
    } catch (error) {
      alert(error.response.data.message);
    }
  }

  return (
    <>
      <Head>
        <title>Hoja del Día | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
        <Container maxWidth={false}>
          <Grid container spacing={3}>
            <Grid item xs={12} lg={4}>
              <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DateCalendar onChange={handleDateChange} />
              </LocalizationProvider>
            </Grid>
            <Grid item xs={12} lg={8}>
              <Typography variant="h3">
                Hoja del día
              </Typography>
              <Box sx={{ mb: 2 }}>
                <Typography variant="h6" gutterBottom>
                  Fecha de reparto: {hojaSelecionada.fechaReparto}
                </Typography>
                <Typography variant="h6" gutterBottom>
                  Estado: {hojaSelecionada.estadoHojaDelDia}
                </Typography>
                <Typography variant="h6" gutterBottom>
                  Observaciones: {hojaSelecionada.observaciones}
                </Typography>
              </Box>
              <Paper sx={{ width: '100%', overflowX: 'auto', maxHeight: '60vh', mb: 4 }}>
                {hojaSelecionada && hojaSelecionada.envios && (
                  <CustomDataGridComponent
                    envios={hojaSelecionada.envios}
                    onEnviosSeleccionadosChange={handleEnviosSeleccionadosChange}
                    apiRef={apiRef}
                    sx={{
                      '& .MuiDataGrid-root': {
                        maxHeight: '60vh', // Ajusta este valor según sea necesario
                      },
                    }}
                  />
                )}
              </Paper>
              <Box sx={{ mt: 3, display: 'flex', justifyContent: 'flex-end', flexWrap: 'wrap' }}>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleImprimir}
                  disabled={hojaSelecionada.estadoHojaDelDia !== "EnPreparacion"}
                  sx={{ mb: 2, mr: 2 }}
                >
                  Imprimir
                </Button>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleCerrarHoja}
                  disabled={hojaSelecionada.estadoHojaDelDia !== "DeCamino"}
                  sx={{ mb: 2, mr: 2 }}
                >
                  Cerrar Hoja
                </Button>
                {/* ... otros botones que puedas tener */}
                <CerrarHoja 
                  open={dialogCerrarHojaOpen}
                  onClose={() => setDialogCerrarHojaOpen(false)}
                  enviosSeleccionados={enviosSeleccionados}
                  cerrarHoja={cerrarHoja}
                />
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleIniciarEntrega}
                  disabled={hojaSelecionada.estadoHojaDelDia !== "EnPreparacion"}
                  sx={{ mb: 2, mr: 2 }}
                >
                  Iniciar Entrega
                </Button>
                <IniciarEntregaDialog
                  open={dialogIniciarEntregaOpen}
                  onClose={() => setDialogIniciarEntregaOpen(false)}
                  iniciar={iniciarEntrega}
                />
              </Box>
            </Grid>
          </Grid>
        </Container>
      </Box>
      {/* ... cualquier otro componente o retorno que necesites aquí */}
    </>
  );
};

HojaDelDia.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default HojaDelDia;
