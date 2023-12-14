// AgregarRepartidorDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import repartidoresService from "src/service/repartidoresService";

const AgregarRepartidorDialog = ({ open, onClose, onRepartidorAdded }) => {
  const [newRepartidor, setNewRepartidor] = useState({
    nombre: '',
    apellido: '',
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewRepartidor({ ...newRepartidor, [name]: value });
  };

  const handleAgregar = async () => {
    try {
      const agregado = await repartidoresService.create(newRepartidor);
      onRepartidorAdded(agregado);
      onClose(); // Cierra el modal
      setNewRepartidor({ nombre: '', apellido: '' }); // Resetea los campos
    } catch (error) {
      console.error('Error al agregar repartidor:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Repartidor</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="nombre"
          label="Nombre del Repartidor"
          type="text"
          fullWidth
          name="nombre"
          value={newRepartidor.nombre}
          onChange={handleInputChange}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido del Repartidor"
          type="text"
          fullWidth
          name="apellido"
          value={newRepartidor.apellido}
          onChange={handleInputChange}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleAgregar} color="primary">
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarRepartidorDialog;
