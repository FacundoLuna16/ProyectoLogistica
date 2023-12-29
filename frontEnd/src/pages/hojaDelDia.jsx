import React from "react";
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

const HojaDelDia = () => {
  return (
    <>
      <Head>
        <title>Envíos | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
        <Grid container spacing={0}>
          <Grid item xs={3}>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
              <DateCalendar />
            </LocalizationProvider>
          </Grid>
          <Grid item xs={9}>
            <Box>
              <Typography variant="h4" sx={{ mb: 2 }}>
                Hoja del día
              </Typography>
            </Box>
            <PrintExportSelectedRows />
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
