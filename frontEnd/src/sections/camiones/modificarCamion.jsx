// ModificarClienteDialog.jsx
import React, { useState, useEffect} from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import ClientesService from "src/service/clientesService";
import { ca, de } from 'date-fns/locale';

const ModificarCamionDialog = ({ open, onClose, camion }) => {
  const [patente, setPatente] = useState('');
  const [modelo, setModelo] = useState('');
  const [color, setColor] = useState('');
  const [descripcion, setDescripcion] = useState('');

  useEffect(() => {
    // Sincronizar los estados locales con las propiedades de camion cuando este cambie
    setPatente(camion.patente || '');
    setModelo(camion.modelo || '');
    setColor(camion.color || '');
    setDescripcion(camion.descripcion || '');
  }, [camion]);

  const handleModificar = async () => {
    try {
      await ClientesService.update(/* Agrega aquí los parámetros necesarios */);
      onClose();
    } catch (error) {
      console.error('Error al modificar cliente:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Camion</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="patente"
          label="Patente"
          
          type="text"
          fullWidth
          value={patente}
          onChange={(e) => setPatente(e.target.value)}
        />
        <TextField
          margin="dense"
          id="modelo"
          label="Modelo"
          type="text"
          fullWidth
          value={modelo}
          onChange={(e) => setModelo(e.target.value)}
        />
        <TextField 
          margin="dense"
          id="color"
          label="Color"
          type="text"
          fullWidth
          value={color}
          onChange={(e) => setColor(e.target.value)}
        />
        <TextField 
          margin="dense"
          id="descripcion"
          label="Descripcion"
          type="text"
          fullWidth
          value={descripcion}
          onChange={(e) => setDescripcion(e.target.value)}
        />
        {/* Agregar más campos según sea necesario */}
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleModificar} color="primary">
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarCamionDialog;
