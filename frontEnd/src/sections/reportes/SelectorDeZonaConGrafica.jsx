import React, { useState, useEffect } from 'react';
import { Paper, Typography, Select, MenuItem, FormControl, InputLabel } from '@mui/material';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import { getCantidadEnviosPorEstadoYZona } from 'src/service/reportesService';

const SelectorDeZonaConGrafica = () => {
  const [selectedZone, setSelectedZone] = useState(1);
  const [datosGrafica, setDatosGrafica] = useState([]);

  useEffect(() => {
    const cargarDatos = async () => {
      try {
        const resultados = await Promise.all([
          getCantidadEnviosPorEstadoYZona(1, selectedZone),
          getCantidadEnviosPorEstadoYZona(2, selectedZone),
          getCantidadEnviosPorEstadoYZona(3, selectedZone),
          getCantidadEnviosPorEstadoYZona(4, selectedZone)
        ]);

        const nombresEstados = ["Pendiente", "Entregado", "No entregado", "Rechazado"];
        const datosParaGrafica = resultados.map((cantidad, index) => ({
          estado: nombresEstados[index],
          cantidad
        }));

        setDatosGrafica(datosParaGrafica);
      } catch (error) {
        console.error('Error al cargar datos:', error);
      }
    };

    cargarDatos();
  }, [selectedZone]);


  return (
    <Paper sx={{ p: 2, mb: 4 }}>
      <FormControl fullWidth>
        <InputLabel>Zona</InputLabel>
        <Select
          value={selectedZone}
          onChange={(e) => setSelectedZone(e.target.value)}
          label="Zona"
        >
          <MenuItem value={1}>Zona 1</MenuItem>
          <MenuItem value={2}>Zona 2</MenuItem>
          <MenuItem value={3}>Zona 3</MenuItem>
          <MenuItem value={4}>Zona 4</MenuItem>
        </Select>
      </FormControl>
      <Typography variant="h6" gutterBottom sx={{ mt: 2 }}>
        Estados de los envios por zona
      </Typography>
      <ResponsiveContainer width="100%" height={300}>
        <BarChart data={datosGrafica}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="estado" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="cantidad" fill="#8884d8" />
        </BarChart>
      </ResponsiveContainer>
    </Paper>
  );
};

export default SelectorDeZonaConGrafica;
