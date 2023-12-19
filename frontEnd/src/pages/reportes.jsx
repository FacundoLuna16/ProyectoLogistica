import React from "react";
import {
  Paper,
  Box,
  Typography,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
} from "@mui/material";
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from "recharts";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { EstadisticasEnviosPorZona } from "src/sections/reportes/datosEnvioPorZona";
import SelectorDeZonaConGrafica from "src/sections/reportes/SelectorDeZonaConGrafica"

const Reportes = () => {
  return (
    <Box sx={{ m: 4 }}>
      <Typography variant="h4" sx={{ mb: 4 }}>
        Reportes y Estadísticas
      </Typography>
      <SelectorDeZonaConGrafica />
      <EstadisticasEnviosPorZona />
    </Box>
  );
};

Reportes.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Reportes;
