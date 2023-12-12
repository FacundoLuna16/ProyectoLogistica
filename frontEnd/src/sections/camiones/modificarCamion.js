// ModificarClienteDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import ClientesService from "src/service/clientesService";

const ModificarClienteDialog = ({ open, onClose }) => {
  const [id, setId] = useState(0);
  const [nombre, setNombre] = useState('');
  // Agregar más estados según sea necesario

  const buscarClientePorId = async () => {
    try {
      const cliente = await ClientesService.getById(id);
      setNombre(cliente.nombre);
      // Actualizar otros estados según sea necesario
    } catch (error) {
      console.error('Error al buscar cliente:', error);
    }
  };

  const handleModificar = async () => {
    try {
      await ClientesService.update(id, { nombre /*, otros atributos */ });
      onClose();
    } catch (error) {
      console.error('Error al modificar cliente:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Cliente</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="id"
          label="ID del Cliente"
          type="text"
          fullWidth
          value={id}
          onChange={(e) => setId(e.target.value)}
        />
        <Button onClick={buscarClientePorId} disabled={!id}>
          Cargar Cliente
        </Button>
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre del Cliente"
          type="text"
          fullWidth
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
        />
        {/* Agregar más campos según sea necesario */}
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleModificar} color="primary" disabled={!nombre}>
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarClienteDialog;
