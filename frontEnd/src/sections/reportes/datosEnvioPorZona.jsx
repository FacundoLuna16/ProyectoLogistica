// EstadisticasEnviosPorZona.js

import React from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { Typography, Paper } from '@mui/material';

// Datos simulados para las zonas y la cantidad de envíos
const datosEnviosPorZona = [
  { zona: 'Zona 1', envios: 200 },
  { zona: 'Zona 2', envios: 150 },
  { zona: 'Zona 3', envios: 10 },
  { zona: 'Zona 4', envios: 50 },
];

const EstadisticasEnviosPorZona = () => {
  return (
    <Paper style={{ padding: '20px', margin: '20px' }}>
      <Typography variant="h5" gutterBottom>
        Estadísticas de Envíos por Zona
      </Typography>
      <ResponsiveContainer width="100%" height={300}>
        <BarChart
          data={datosEnviosPorZona}
          margin={{ top: 20, right: 30, left: 20, bottom: 5 }}
        >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="zona" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="envios" fill="#8884d8" />
        </BarChart>
      </ResponsiveContainer>
    </Paper>
  );
};

export {EstadisticasEnviosPorZona};
