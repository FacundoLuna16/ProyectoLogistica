// AgregarClienteDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import ClientesService from "src/service/clientesService";

const AgregarClienteDialog = ({ open, onClose, onClienteAdded }) => {
  const [newCliente, setNewCliente] = useState({
    iDCliente: 0,
    tipoDoc: '',
    nroDoc: '',
    nombre: '',
    apellido: '',
    direccion: '',
    nroTelefono: '',
    nroTelefonoAlternativo: '',
    mail: '',
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewCliente({ ...newCliente, [name]: value });
  };

  const handleAgregar = async () => {
    try {
      const addedCliente = await ClientesService.create(newCliente);
      onClienteAdded(addedCliente);
      onClose();
      setNewCliente({
        iDCliente: 0,
        tipoDoc: '',
        nroDoc: '',
        nombre: '',
        apellido: '',
        direccion: '',
        nroTelefono: '',
        nroTelefonoAlternativo: '',
        mail: '',
      });
    } catch (error) {
      console.error('Error al agregar cliente:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Cliente</DialogTitle>
      <DialogContent>
        {/* Agrega aquí los campos necesarios para el cliente */}
        {/* Ejemplo: */}
        <TextField
          autoFocus
          margin="dense"
          id="nombre"
          label="Nombre del Cliente"
          type="text"
          fullWidth
          name="nombre"
          value={newCliente.nombre}
          onChange={handleInputChange}
        />
        {/* Agregar más campos según sea necesario */}
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

export default AgregarClienteDialog;
