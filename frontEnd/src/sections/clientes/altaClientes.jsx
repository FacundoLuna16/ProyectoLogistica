// AgregarClienteDialog.jsx
import React, { useState } from 'react';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select, { SelectChangeEvent } from '@mui/material/Select';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import ClientesService from "src/service/clientesService";

const AgregarClienteDialog = ({ open, onClose, onClienteAdded }) => {
  /*  "idTipoDocumento": 3,
  "numeroDocumento": "string",
  "nombre": "string",
  "apellido": "string",
  "direccion": "string",
  "numeroTelefono": "string",
  "numeroTelefonoAlternativo": "string",
  "email": "string" */
  const [newCliente, setNewCliente] = useState({
    idtipoDocumento: 0,
    numeroDocumento: '',
    nombre: '',
    apellido: '',
    direccion: '',
    numeroTelefono: '',
    numeroTelefonoAlternativo: '',
    email: '',
  });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewCliente({ ...newCliente, [name]: value }); 
    //alert({ ...newCliente, [name]: value }[name])
  };

  const handleAgregar = async () => {
    try {
      const addedCliente = await ClientesService.create(newCliente);
      onClienteAdded(addedCliente);
      onClose();
      setNewCliente({});
    } catch (error) {
      console.error('Error al agregar cliente:', error.response.data);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Cliente</DialogTitle>
      <DialogContent>
        {/* Agrega aquí los campos necesarios para el cliente */}
        {/* Ejemplo: */}
        <FormControl sx={{ m: 1, minWidth: 120 }} size="medium">
          <InputLabel id="demo-simple-select-standard-label">TipoDocumento</InputLabel>
          <Select
            variant="standard"
            labelId="demo-select-medium-label"
            id="demo-select-medium"
            name='idtipoDocumento'
            value={newCliente.idtipoDocumento}
            label="tipoDocumento"
            onChange={(e) => handleInputChange(e)}
          >
            <MenuItem value="1">DNI</MenuItem>
            <MenuItem value="2">CUIT</MenuItem>
            <MenuItem value="3">CUIL</MenuItem>
          </Select>
        </FormControl>
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
