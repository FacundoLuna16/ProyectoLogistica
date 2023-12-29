import React, { useCallback, useEffect, useMemo, useState } from "react";
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
import PrintExportSelectedRows from "src/sections/hojaDelDia/enviosXHoja-table";
import HojaDelDiaService from "src/service/hojaDelDiaService";
import { useAuth } from "src/contexts/AuthContext";
import { set } from "nprogress";

const HojaDelDia = () => {
  const authContext = useAuth();
  const hojasService = new HojaDelDiaService(authContext);
  const [hojaSelecionada, setHojaSelecionada] = useState({});
  const [selectedDate, setSelectedDate] = useState(new Date());
  const [hojasDelDia, setHojasDelDia] = useState([]);

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
  }

  const handleDateChange = (date) => {
    //formatea la fecha a yyyy-mm-dd
    //setSelectedDate(date.toISOString().split("T")[0]);

    //buscar la hoja del dia con la fecha seleccionada y valida que si de un arreglo vacio 
    getByFechaReparto(date);
  };
  return (
    <>
      <Head>
        <title>Envíos | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
        <Grid container spacing={0}>
          <Grid item xs={3}>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DateCalendar  onChange={handleDateChange} />
            </LocalizationProvider>
          </Grid>
          <Grid item xs={9}>
            <Box>
              <Typography variant="h4" sx={{ mb: 2 }}>
                Hoja del día
              </Typography>
            </Box>
            {hojaSelecionada && hojaSelecionada.envios && (
              <PrintExportSelectedRows envios={hojaSelecionada.envios} />
            )}
            <Box sx={{ mt: 3, display: "flex", justifyContent: "flex-end" }}>
              <Button variant="contained" color="primary" sx={{ mr: 2 }}>
                Imprimir
              </Button>
              <Button variant="contained" color="primary" sx={{ mr: 2 }}>
                Cerrar Hoja
              </Button>
              <Button variant="contained" color="primary" sx={{ mr: 2 }}>
                Iniciar Entrega
              </Button>
            </Box>
          </Grid>
        </Grid>
      </Box>
    </>
  );
};

HojaDelDia.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default HojaDelDia;
