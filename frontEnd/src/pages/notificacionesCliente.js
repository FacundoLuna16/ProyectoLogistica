import React from 'react';
import { Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Paper, Button } from '@mui/material';
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
// Supongamos que esta es tu lista de clientes y envíos
const clientes = [
  { id: 1, nombre: "Cliente 1", telefono: "+123456789", envio: "Producto A" },
  { id: 2, nombre: "Cliente 2", telefono: "+987654321", envio: "Producto B" },
  // ...otros clientes
];

const notificacionesCliente = () => {
  
  const enviarWhatsApp = (telefono, mensaje) => {
    // Aquí codificarías el mensaje y abrirías la URL de WhatsApp
    const urlMensaje = `https://wa.me/${telefono}?text=${encodeURIComponent(mensaje)}`;
    window.open(urlMensaje, '_blank');
  };

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="tabla de notificaciones">
        <TableHead>
          <TableRow>
            <TableCell>ID Cliente</TableCell>
            <TableCell>Nombre</TableCell>
            <TableCell>Teléfono</TableCell>
            <TableCell>Envío</TableCell>
            <TableCell>Acción</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {clientes.map((cliente) => (
            <TableRow
              key={cliente.id}
              sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
            >
              <TableCell component="th" scope="row">
                {cliente.id}
              </TableCell>
              <TableCell>{cliente.nombre}</TableCell>
              <TableCell>{cliente.telefono}</TableCell>
              <TableCell>{cliente.envio}</TableCell>
              <TableCell>
                <Button
                  variant="contained"
                  onClick={() => enviarWhatsApp(cliente.telefono, `Hola ${cliente.nombre}, su pedido de ${cliente.envio} está en camino!`)}
                >
                  Notificar vía WhatsApp
                </Button>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

notificacionesCliente.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default notificacionesCliente;
