// ClienteAgregarDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button, FormControl, InputLabel, Select, MenuItem } from '@mui/material';
import clientesService from "src/service/clientesService"; // Asegúrate de que esta ruta sea correcta

const ClienteAgregarDialog = ({ open, onClose, onClienteAdded }) => {
  const [cliente, setCliente] = useState({
    tipoDoc: '',
    nroDoc: '',
    nombre: '',
    apellido: '',
    direccion: '',
    nroTelefono: '',
    nroTelefonoAlternativo: '',
    mail: ''
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCliente(prev => ({ ...prev, [name]: value }));
  };

  const handleAgregarCliente = async () => {
    try {
      const response = await clientesService.create(cliente);
      onClienteAdded(response);
      onClose(); // Cierra el modal después de agregar el cliente
    } catch (error) {
      console.error('Error al agregar cliente:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Cliente</DialogTitle>
      <DialogContent>
        {/* Tipo de Documento */}
        <FormControl fullWidth margin="dense">
          <InputLabel id="tipo-doc-label">Tipo de Documento</InputLabel>
          <Select
            labelId="tipo-doc-label"
            id="tipoDoc"
            name="tipoDoc"
            value={cliente.tipoDoc}
            label="Tipo de Documento"
            onChange={handleInputChange}
          >
            {/* Aquí deberías añadir los MenuItem para cada tipo de documento */}
            <MenuItem value="DNI">DNI</MenuItem>
            <MenuItem value="PASAPORTE">Pasaporte</MenuItem>
            {/* ...otros tipos de documentos */}
          </Select>
        </FormControl>

        {/* Número de Documento */}
        <TextField
          margin="dense"
          id="nroDoc"
          name="nroDoc"
          label="Número de Documento"
          type="text"
          fullWidth
          value={cliente.nroDoc}
          onChange={handleInputChange}
        />

        {/* Nombre */}
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

        {/* Apellido */}
        <TextField
          margin="dense"
          id="apellido"
          name="apellido"
          label="Apellido"
          type="text"
          fullWidth
          value={cliente.apellido}
          onChange={handleInputChange}
        />

        {/* Dirección */}
        <TextField
          margin="dense"
          id="direccion"
          name="direccion"
          label="Dirección"
          type="text"
          fullWidth
          value={cliente.direccion}
          onChange={handleInputChange}
        />

        {/* Número de Teléfono */}
        <TextField
          margin="dense"
          id="nroTelefono"
          name="nroTelefono"
          label="Número de Teléfono"
          type="text"
          fullWidth
          value={cliente.nroTelefono}
          onChange={handleInputChange}
        />

        {/* Número de Teléfono Alternativo */}
        <TextField
          margin="dense"
          id="nroTelefonoAlternativo"
          name="nroTelefonoAlternativo"
          label="Número de Teléfono Alternativo"
          type="text"
          fullWidth
          value={cliente.nroTelefonoAlternativo}
          onChange={handleInputChange}
        />

        {/* Email */}
        <TextField
          margin="dense"
          id="mail"
          name="mail"
          label="Correo Electrónico"
          type="email"
          fullWidth
          value={cliente.mail}
          onChange={handleInputChange}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleAgregarCliente} color="primary">
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ClienteAgregarDialog;
