import React, { useRef, useState } from "react";
import { useTheme } from "@mui/material/styles";
import { Paper, Button, Typography, Box, Grid, Container, useMediaQuery } from "@mui/material";
import Head from "next/head";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { DateCalendar } from "@mui/x-date-pickers/DateCalendar";
import CustomDataGridComponent, {
  getNroFacturasACerrar,
} from "src/sections/hojaDelDia/enviosXHoja-table";
import HojaDelDiaService from "src/service/hojaDelDiaService";
import { useAuth } from "src/contexts/AuthContext";
import IniciarEntregaDialog from "src/sections/hojaDelDia/iniciarEntrega";
import CerrarHoja from "src/sections/hojaDelDia/cerrarHoja";
import jsPDF from 'jspdf';
import 'jspdf-autotable';

const HojaDelDia = () => {
  const authContext = useAuth();
  const hojasService = new HojaDelDiaService(authContext);
  const [hojaSelecionada, setHojaSelecionada] = useState({});
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [hojasDelDia, setHojasDelDia] = useState([]);
  const [dialogIniciarEntregaOpen, setDialogIniciarEntregaOpen] = useState(false);
  const [dialogCerrarHojaOpen, setDialogCerrarHojaOpen] = useState(false);
  const [enviosSeleccionados, setEnviosSeleccionados] = useState([]);
  const [fechaSeleccionada,setFechaSeleccionada] = useState({});

  //Estilos
  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs"));
  const isSmall = useMediaQuery(theme.breakpoints.down("sm"));

  const handleEnviosSeleccionadosChange = (selectedEnvios) => {
    setEnviosSeleccionados(selectedEnvios);
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
    getByFechaReparto(date);
    setFechaSeleccionada(date);
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
      //alert("Se esta por cerrar la hoja" + hojaSelecionada.idHojaDelDia);
      // muestra por json los envios seleccionados
      await hojasService.cerrarHojaDelDia(hojaSelecionada.idHojaDelDia, enviosSeleccionados);
      alert("Se cerro la hoja");
      getByFechaReparto(fechaSeleccionada);
    } catch (error) {
      alert(error.response.data.message);
    }
  };

  const handleIniciarEntrega = () => {
    // Lógica para el botón Iniciar Entrega
    setDialogIniciarEntregaOpen(true);
  };

  const iniciarEntrega = async (idRepartidor,patenteCamion) => {
    try {
      //alert("Se esta por iniciar la hoja" + hojaSelecionada.idHojaDelDia + ", Repartidor: " + idRepartidor + "Camion: " + patenteCamion);
      await hojasService.iniciarEntrega(hojaSelecionada.idHojaDelDia,idRepartidor,patenteCamion);
      alert("Se inicio la entrega");
      getByFechaReparto(fechaSeleccionada);

    } catch (error) {
      alert(error.data);
    }
  };
  const handleImprimir = () => {
    generarPDF(hojaSelecionada);
  };


  function cargarLogo() {
    return new Promise((resolve, reject) => {
      var img = new Image();
      img.src = '/assets/logos21logistica.png';
      img.onload = () => resolve(img);
      img.onerror = reject;
    });
  }
  
  async function generarPDF(hojaSeleccionada) {
    alert(JSON.stringify(hojaSeleccionada));
    const pdf = new jsPDF({
      orientation: 'landscape',
    });
  
    try {
      const img = await cargarLogo();
      pdf.addImage(img, 'PNG', 20, 10, 50, 20);
  
      pdf.setFontSize(16);
      pdf.text('Hoja Del día', 80, 20);
      pdf.text(`Fecha Reparto: ${hojaSeleccionada.fechaReparto}`, 20, 40);
      pdf.text(`Repartidor: ${hojaSeleccionada.repartidor}`, 20, 50);
  
      // Modificar aquí para manejar el caso de no envíos
      let zonaTexto = hojaSeleccionada.envios.length > 0 ? hojaSeleccionada.envios[0].zona : 'No hay envíos';
      pdf.text(`Zona: ${zonaTexto}`, 20, 60);
  
      pdf.text(`Camion: ${hojaSeleccionada.camion}`, 100, 40);
  
      const columnas = ['     ', 'Factura', 'Direccion Entrega', 'Entre Calle', 'Telefono 1', 'Telefono 2', 'Cliente', 'Firma'];
      let filas = [];
  
      // Verificar si hay envíos
      if (hojaSeleccionada.envios.length > 0) {
        filas = hojaSeleccionada.envios.map(envio => [
          '[ ]',
          envio.numeroFactura,
          envio.direccionEnvio,
          envio.entreCalles,
          envio.cliente.numeroTelefono,
          envio.cliente.numeroAltTelefono,
          `${envio.cliente.nombre} ${envio.cliente.apellido} ${envio.cliente.numeroDocumento}`,
          '          '
        ]);
      } else {
        // Fila predeterminada cuando no hay envíos
        filas.push(['', 'No hay envíos', '', '', '', '', '', '']);
      }
  
      const rowHeight = 15;
  
      pdf.autoTable({
        head: [columnas],
        body: filas,
        startY: 70,
        rowPageBreak: 'avoid',
        didDrawPage: function(data) {
          let str = 'Página ' + pdf.internal.getNumberOfPages();
          pdf.text(str, data.settings.margin.left, pdf.internal.pageSize.height - 10);
        },
        styles: {
          rowHeight: rowHeight,
          fontSize: 12,
          cellWidth: 'wrap',
        },
        columnStyles: {
          2: { cellWidth: 'auto' },
        },
      });
  
      pdf.text('Firma: ........................', 20, pdf.internal.pageSize.height - 30);
  
      window.open(pdf.output('bloburl'), '_blank');
    } catch (error) {
      console.error('Error al generar el PDF:', error);
    }
  }
  

  return (
    <>
      <Head>
        <title>Hoja del Día | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
      <Container maxWidth={false}>
        <Grid container spacing={5} direction={isXSmall ? "column" : "row"}>
          {/* Calendario arriba */}
          <Grid item xs={12} lg={2} sx={{ paddingRight: isXSmall ? "0" : "300px" }}>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DateCalendar onChange={handleDateChange} />
            </LocalizationProvider>
          </Grid>
            {/* Contenido principal (Hoja del día) */}
          <Grid item xs={12} lg={9}>
            <Typography variant="h3">Hoja del día</Typography>
              <Box sx={{ mb: 2, display: 'flex', flexDirection: 'row', justifyContent: 'space-between' }}>
                <Typography variant="h6" gutterBottom>
                  Fecha de reparto: {hojaSelecionada.fechaReparto}
                </Typography>
                <Typography variant="h6" gutterBottom>
                  Estado: {hojaSelecionada.estadoHojaDelDia}
                </Typography>
                {/* <Typography variant="h6" gutterBottom>
                  Observaciones: {hojaSelecionada.observaciones}
                </Typography> */}
              </Box>
              <Paper sx={{ width: "100%", overflowX: "auto", maxHeight: "60vh", mb: 4 }}>
                {hojaSelecionada && hojaSelecionada.envios && (
                  <CustomDataGridComponent
                    envios={hojaSelecionada.envios}
                    onEnviosSeleccionadosChange={handleEnviosSeleccionadosChange}
                    apiRef={apiRef}
                    sx={{
                      "& .MuiDataGrid-root": {
                        maxHeight: "60vh", // Ajusta este valor según sea necesario
                      },
                    }}
                  />
                )}
              </Paper>
              <Box sx={{ mt: 3, display: "flex", justifyContent: "flex-end", flexWrap: "wrap" }}>
                <Button
                  variant="contained"
                  color="primary"
                  onClick={handleImprimir}
                  //Desabilitado si no hay una hoja del dia seleccionada
                  disabled={!hojaSelecionada.idHojaDelDia}
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
