import React from 'react';
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
  Box
} from '@mui/material';
import { Layout as DashboardLayout } from 'src/layouts/dashboard/layout';
// Datos simulados para envíos pendientes
const enviosPendientes = [
  { id: 1, cliente: "Cliente 1", fechaEstimada: "2023-04-10", motivo: "No disponible" },
  { id: 2, cliente: "Cliente 2", fechaEstimada: "2023-04-11", motivo: "Dirección incorrecta" },
  // ... más envíos pendientes
];

const EnviosPendientes = () => {
  // Función para manejar la quita de un envío de la lista de pendientes
  const quitarDePendientes = (envioId) => {
    // Aquí llamarías a tu API para actualizar el estado del envío
    console.log(`Envío ${envioId} quitado de la lista de pendientes.`);
    // Debes manejar la actualización del estado o refrescar los datos de la lista aquí.
  };

  return (
    <Box sx={{ m: 4 }}>
      <Typography variant="h4" sx={{ mb: 4 }}>
        Envíos Pendientes
      </Typography>
      <TableContainer component={Paper}>
        <Table sx={{ minWidth: 650 }} aria-label="tabla de envíos pendientes">
          <TableHead>
            <TableRow>
              <TableCell>ID Envío</TableCell>
              <TableCell>Cliente</TableCell>
              <TableCell>Fecha Estimada</TableCell>
              <TableCell>Motivo</TableCell>
              <TableCell>Acciones</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {enviosPendientes.map((envio) => (
              <TableRow key={envio.id}>
                <TableCell>{envio.id}</TableCell>
                <TableCell>{envio.cliente}</TableCell>
                <TableCell>{envio.fechaEstimada}</TableCell>
                <TableCell>{envio.motivo}</TableCell>
                <TableCell>
                  <Button
                    variant="contained"
                    color="secondary"
                    onClick={() => quitarDePendientes(envio.id)}
                    sx={{ mr: 1 }}
                  >
                    Quitar de Pendientes
                  </Button>
                  <Button
                    variant="contained"
                    color="success"
                    onClick={() => console.log('Reprogramar envío', envio.id)}
                  >
                    Reprogramar a su zona de cobertura
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    </Box>
  );
};

EnviosPendientes.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default EnviosPendientes;

