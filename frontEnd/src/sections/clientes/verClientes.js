// ConsultarClienteDialog.jsx
import React from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';

const ConsultarClienteDialog = ({ open, onClose, cliente }) => {
  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Detalle del Cliente</DialogTitle>
      <DialogContent>
        <TextField
          margin="dense"
          id="tipoDoc"
          label="Tipo de Documento"
          type="text"
          fullWidth
          value={cliente.tipoDoc}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="nroDoc"
          label="Número de Documento"
          type="text"
          fullWidth
          value={cliente.nroDoc}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre"
          type="text"
          fullWidth
          value={cliente.nombre}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido"
          type="text"
          fullWidth
          value={cliente.apellido}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="direccion"
          label="Dirección"
          type="text"
          fullWidth
          value={cliente.direccion}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="nroTelefono"
          label="Número de Teléfono"
          type="text"
          fullWidth
          value={cliente.nroTelefono}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="nroTelefonoAlternativo"
          label="Número de Teléfono Alternativo"
          type="text"
          fullWidth
          value={cliente.nroTelefonoAlternativo}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="mail"
          label="Correo Electrónico"
          type="email"
          fullWidth
          value={cliente.mail}
          InputProps={{ readOnly: true }}
        />
        {/* Agrega aquí más campos para mostrar según sea necesario */}
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cerrar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ConsultarClienteDialog;
