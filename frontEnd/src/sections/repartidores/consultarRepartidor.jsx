// ConsultarRepartidorDialog.jsx
import React from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';

const ConsultarRepartidorDialog = ({ open, onClose, repartidor }) => {
  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Detalle del Repartidor</DialogTitle>
      <DialogContent>
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre del Repartidor"
          type="text"
          fullWidth
          value={repartidor.nombre}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido del Repartidor"
          type="text"
          fullWidth
          value={repartidor.apellido}
          InputProps={{ readOnly: true }}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cerrar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ConsultarRepartidorDialog;
