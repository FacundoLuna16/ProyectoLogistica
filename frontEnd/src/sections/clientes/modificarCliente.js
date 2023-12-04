// ModificarClienteDialog.jsx
import React, { useState, useEffect } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import clientesService from "src/service/clientesService"; // Asegúrate de que esta ruta sea correcta

const ModificarClienteDialog = ({ open, onClose, clienteInicial, onClienteUpdated }) => {
  const [cliente, setCliente] = useState({
    idCliente: '',
    tipoDoc: '',
    nroDoc: '',
    nombre: '',
    apellido: '',
    direccion: '',
    nroTelefono: '',
    nroTelefonoAlternativo: '',
    mail: ''
  });

  useEffect(() => {
    if (clienteInicial && open) {
      setCliente(clienteInicial);
    }
  }, [clienteInicial, open]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCliente(prev => ({ ...prev, [name]: value }));
  };

  const handleModificarCliente = async () => {
    try {
      const response = await clientesService.update(cliente.idCliente, cliente);
      onClienteUpdated(response);
      onClose(); // Cierra el modal después de la actualización
    } catch (error) {
      console.error('Error al modificar cliente:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Cliente</DialogTitle>
      <DialogContent>
        {/* Aquí irían los mismos campos que en el diálogo de agregar, pero rellenados con los datos del cliente */}
        <TextField
          margin="dense"
          id="nombre"
          name="nombre"
          label="Nombre"
          type="text"
          fullWidth
          value={cliente.nombre}
          onChange={handleInputChange}
        />
        {/* ... otros campos ... */}
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleModificarCliente} color="primary">
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarClienteDialog;