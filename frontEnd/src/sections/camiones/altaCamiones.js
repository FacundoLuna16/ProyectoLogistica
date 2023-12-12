// AgregarCamionDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import CamionesService from "src/service/camionesService";

const AgregarCamionDialog = ({ open, onClose, onCamionAdded }) => {
  const [newCamion, setNewCamion] = useState({
    patente: '',
    modelo: '',
    color: '',
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewCamion({ ...newCamion, [name]: value });
  };

  const handleAgregar = async () => {
    try {
      const agregado = await CamionesService.create(newCamion);
      onCamionAdded(agregado);
      onClose(); // Cierra el modal
      setNewCamion({ patente: '', modelo: '', color: ''}); // Resetea los campos
    } catch (error) {
      console.error('Error al agregar camión:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Camión</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="patente"
          label="Patente del Camión"
          type="text"
          fullWidth
          name="patente"
          value={newCamion.patente}
          onChange={handleInputChange}
        />
        <TextField
          margin="dense"
          id="modelo"
          label="Modelo del Camión"
          type="text"
          fullWidth
          name="modelo"
          value={newCamion.modelo}
          onChange={handleInputChange}
        />
        <TextField
          margin="dense"
          id="color"
          label="Color del Camión"
          type="text"
          fullWidth
          name="color"
          value={newCamion.color}
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

export default AgregarCamionDialog;
