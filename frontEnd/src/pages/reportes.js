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

// Datos simulados para el ejemplo
const data = [
  { nombre: "Enero", entregas: 4000, pendientes: 2400, retrasados: 240 },
  { nombre: "Febrero", entregas: 3000, pendientes: 1398, retrasados: 221 },
  { nombre: "Marzo", entregas: 2000, pendientes: 9800, retrasados: 229 },
  // ... más datos
];

const Reportes = () => {
  return (
    <Box sx={{ m: 4 }}>
      <Typography variant="h4" sx={{ mb: 4 }}>
        Reportes y Estadísticas
      </Typography>

      <Paper sx={{ p: 2, mb: 4 }}>
        <Typography variant="h6" gutterBottom>
          Estadísticas de Envíos
        </Typography>
        <BarChart width={600} height={300} data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="nombre" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="entregas" fill="#8884d8" />
          <Bar dataKey="pendientes" fill="#82ca9d" />
          <Bar dataKey="retrasados" fill="#ffc658" />
        </BarChart>
      </Paper>

      <EstadisticasEnviosPorZona />
    </Box>
  );
};

Reportes.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Reportes;
