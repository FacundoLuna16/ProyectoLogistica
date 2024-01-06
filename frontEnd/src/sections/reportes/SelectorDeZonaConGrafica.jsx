import React, { useState, useEffect } from 'react';
import { Paper, Typography, Select, MenuItem, FormControl, InputLabel } from '@mui/material';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import ReportesServices from 'src/service/reportesService';
import { useAuth } from "src/contexts/AuthContext";

const SelectorDeZonaConGrafica = () => {
  const authContext = useAuth();
  const [selectedZone, setSelectedZone] = useState(1);
  const [datosGrafica, setDatosGrafica] = useState([]);
  const reportesService = new ReportesServices(authContext);

  useEffect(() => {
    const cargarDatos = async () => {
      try {
        const nombresEstados = [1, 2, 3, 4]; // Asumiendo que estos son los ID de los estados
        const promesas = nombresEstados.map(idEstado =>
          reportesService.getCantidadEnviosPorEstadoYZona(idEstado, selectedZone)
        );

        const resultados = await Promise.all(promesas);

        const etiquetasEstados = ["Pendiente", "Entregado", "No entregado", "Rechazado"]; // Etiquetas para los estados
        const datosParaGrafica = resultados.map((cantidad, index) => ({
          estado: etiquetasEstados[index],
          cantidad
        }));

        setDatosGrafica(datosParaGrafica);
      } catch (error) {
        console.error('Error al cargar datos:', error);
      }
    };

    cargarDatos();
  }, [selectedZone, reportesService]);


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
