import React, { useCallback, useEffect, useMemo, useRef, useState } from "react";
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Button,
  Typography,
  Box,
  Grid,
  Container,
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


  const handleEnviosSeleccionadosChange = (enviosSeleccionados) => {
    setEnviosSeleccionados(enviosSeleccionados);
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
  //cuando renderiza el componente hace una peticion para buscar todas las hojas del dia
  // useEffect(() => {
  //   //Hacer peticion para buscar todas las hojas del dia
  //   getAllHojasDelDia();

  //   //setear el estado de hojas del dia
  // }, []);

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

  const handleCerrarHoja = () => {
    
    getNroFacturasACerrar({apiRef: useRef(null)});
    //busca los envios marcados en la tabla
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
        <title>Envíos | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
        <Container maxWidth="xxl">
          <Grid container spacing={1}>
            <Grid item xs={12} md={3} style={{ flex: 1 }}>
              <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DateCalendar onChange={handleDateChange} />
              </LocalizationProvider>
            </Grid>
            <Grid item xs={12} md={9} style={{ flex: 1, my: 4 }}>
              <Typography variant="h4">Hoja del día</Typography>
              <Box
                sx={{
                  display: "flex",
                  flexDirection: { xs: "column", md: "row" },
                  gap: { xs: 2, md: 5 }, // Espaciado entre detalles en pantallas pequeñas y grandes
                  mb: 2, // Margen inferior general
                }}
              >
                <Typography variant="h6">
                  Fecha de reparto: {hojaSelecionada.fechaReparto}
                </Typography>
                <Typography variant="h6">Estado: {hojaSelecionada.estadoHojaDelDia}</Typography>
                <Typography variant="h6">Observaciones: {hojaSelecionada.observaciones}</Typography>
              </Box>
              {hojaSelecionada && hojaSelecionada.envios && (
                <CustomDataGridComponent 
                envios={hojaSelecionada.envios} 
                onEnviosSeleccionadosChange={handleEnviosSeleccionadosChange}
                />
              )}
              <Box sx={{ mt: 3, display: "flex", justifyContent: "flex-end" }}>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleImprimir}
                  disabled={hojaSelecionada.estadoHojaDelDia !== "EnPreparacion"}
                  sx={{ mr: 2 }}
                >
                  Imprimir
                </Button>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleCerrarHoja}
                  disabled={hojaSelecionada.estadoHojaDelDia !== "DeCamino"}
                  sx={{ mr: 2 }}
                >
                  Cerrar Hoja
                </Button>
                <CerrarHoja
                  open={dialogCerrarHojaOpen}
                  onClose={ () => setDialogCerrarHojaOpen(false)}
                  enviosSeleccionados={enviosSeleccionados}
                  cerrarHoja={cerrarHoja}
                />

                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleIniciarEntrega}
                  disabled={hojaSelecionada.estadoHojaDelDia !== "EnPreparacion"}
                  sx={{ mr: 2 }}
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
    </>
  );
};

HojaDelDia.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default HojaDelDia;
