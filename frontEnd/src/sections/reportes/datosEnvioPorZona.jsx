import React, { useState, useEffect } from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { Typography, Paper } from '@mui/material';
import ReportesServices from 'src/service/reportesService';
import {useAuth} from 'src/contexts/AuthContext'; // Asegúrate de importar correctamente useAuth

const EstadisticasEnviosPorZona = () => {
  const authContext = useAuth();
  const reportesService = new ReportesServices(authContext);
  const [datosEnvios, setDatosEnvios] = useState([]);

  useEffect(() => {
    const cargarDatos = async () => {
      try {
        const zonas = [1, 2, 3, 4]; // Asumiendo que estas son las zonas
        const promesas = zonas.map(zona =>
          reportesService.getCantidadEnviosPorZona(zona)
        );

        const resultados = await Promise.all(promesas);

        const nuevosDatos = zonas.map((zona, index) => ({
          zona: `Zona ${zona}`,
          envios: resultados[index]
        }));

        setDatosEnvios(nuevosDatos);
      } catch (error) {
        console.error('Error al cargar datos:', error);
      }
    };

    cargarDatos();
  }, [reportesService]);

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
