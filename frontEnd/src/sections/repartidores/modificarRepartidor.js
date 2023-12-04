// ModificarRepartidorDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import repartidoresService from "src/service/repartidoresService";

const ModificarRepartidorDialog = ({ open, onClose }) => {
  const [id, setId] = useState('');
  const [nombre, setNombre] = useState('');
  const [apellido, setApellido] = useState('');
  const [cargando, setCargando] = useState(false);

  const buscarRepartidorPorId = async () => {
    setCargando(true);
    try {
      const repartidor = await repartidoresService.getById(id);
      setNombre(repartidor.nombre);
      setApellido(repartidor.apellido);
    } catch (error) {
      console.error('Error al buscar repartidor:', error);
    } finally {
      setCargando(false);
    }
  };

  const handleModificar = async () => {
    try {
      await repartidoresService.update(id, { nombre, apellido });
      onClose(); // Cierra el modal después de la actualización
    } catch (error) {
      console.error('Error al modificar repartidor:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Repartidor</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="id"
          label="ID del Repartidor"
          type="text"
          fullWidth
          value={id}
          onChange={(e) => setId(e.target.value)}
          disabled={cargando}
        />
        <Button onClick={buscarRepartidorPorId} disabled={!id || cargando}>Cargar Repartidor</Button>
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre del Repartidor"
          type="text"
          fullWidth
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido del Repartidor"
          type="text"
          fullWidth
          value={apellido}
          onChange={(e) => setApellido(e.target.value)}
          disabled={!id || cargando}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">Cancelar</Button>
        <Button onClick={handleModificar} color="primary" disabled={!nombre || !apellido || cargando}>Modificar</Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarRepartidorDialog;