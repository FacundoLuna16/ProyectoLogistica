import React, { useState, useEffect } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { Typography, Paper } from '@mui/material';
import { getCantidadEnviosPorZona } from 'src/service/reportesService';

const EstadisticasEnviosPorZona = () => {
  const [datosEnvios, setDatosEnvios] = useState([]);

  useEffect(() => {
    const cargarDatos = async () => {
      try {
        // Realiza las solicitudes de forma simultánea y espera a todas
        const resultados = await Promise.all([
          getCantidadEnviosPorZona(1),
          getCantidadEnviosPorZona(2),
          getCantidadEnviosPorZona(3),
          getCantidadEnviosPorZona(4)
        ]);

        // Transforma los resultados en el formato deseado para el gráfico
        const nuevosDatos = resultados.map((cantidad, index) => ({
          zona: `Zona ${index + 1}`,
          envios: cantidad
        }));

        setDatosEnvios(nuevosDatos);
      } catch (error) {
        console.error('Error al cargar datos:', error);
      }
    };

    cargarDatos();
  }, []);

  return (
    <Paper style={{ padding: '20px', margin: '20px' }}>
      <Typography variant="h5" gutterBottom>
        Estadísticas de Envíos por Zona
      </Typography>
      <ResponsiveContainer width="100%" height={300}>
        <BarChart
          data={datosEnvios}
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

export { EstadisticasEnviosPorZona };
