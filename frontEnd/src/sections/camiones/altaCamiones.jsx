// AgregarCamionDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import CamionesService from "src/service/camionesService";
import { useAuth } from "src/contexts/AuthContext";


const AgregarCamionDialog = ({ open, onClose, refrescar }) => {
  const authContext = useAuth();
  const camionesService = new CamionesService(authContext);
  const [newCamion, setNewCamion] = useState({
    patente: '',
    modelo: '',
    color: '',
    descripcion: '',
  });

  const areAllFieldsFilled = () => {
    // Verifica que todos los campos requeridos estén completos
    return newCamion.patente && newCamion.modelo && newCamion.color && newCamion.descripcion;
  };

  const handleCancelar = () => {
    onClose();
    setNewCamion({ patente: '', modelo: '', color: '',descripcion: ''}); // Resetea los campos
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewCamion({ ...newCamion, [name]: value });
  };

  const handleAgregar = async () => {
    try {
      if (areAllFieldsFilled()) {
        const agregado = await camionesService.create(newCamion);
        alert('Camion agregado correctamente');
        onClose();
        setNewCamion({});
        refrescar();
      } else {
        alert('Completa todos los campos requeridos antes de agregar el camión.');
      }
    } catch (error) {
      alert(error.response.data);
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
          required  
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
          required  
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
          required  
        />
        <TextField
          margin="dense"
          id="descripcion"
          label="Descripcion"
          type="text"
          fullWidth
          name="descripcion"
          value={newCamion.descripcion}
          onChange={handleInputChange}
          required 
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={handleCancelar} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleAgregar} color="primary" disabled={!areAllFieldsFilled()}>
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarCamionDialog;
