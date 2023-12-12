
// ConsultarCamionDialog.jsx
import React from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';

const ConsultarCamionDialog = ({ open, onClose, camion }) => {
  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Detalle del Camión</DialogTitle>
      <DialogContent>
        <TextField
          margin="dense"
          id="patente"
          label="Patente del Camión"
          type="text"
          fullWidth
          value={camion.patente}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="modelo"
          label="Modelo del Camión"
          type="text"
          fullWidth
          value={camion.modelo}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="color"
          label="Color del Camión"
          type="text"
          fullWidth
          value={camion.color}
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

export default ConsultarCamionDialog;