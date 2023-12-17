import React, { useState, useEffect } from 'react';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select from '@mui/material/Select';
import TextField from '@mui/material/TextField';
import { Dialog, DialogContent, DialogTitle, DialogActions, Button } from '@mui/material';
import ClientesService from "src/service/clientesService";

const AgregarClienteDialog = ({ open, onClose, onClienteAdded }) => {
  const [newCliente, setNewCliente] = useState({
    idTipoDocumento: 0,
    numeroDocumento: '',
    nombre: '',
    apellido: '',
    direccion: '',
    numeroTelefono: '',
    numeroTelefonoAlternativo: '',
    email: '',
  });

  const [tipoDocumentoSeleccionado, setTipoDocumentoSeleccionado] = useState(0);

  const [validation, setValidation] = useState({
    idTipoDocumento: true,
    numeroDocumento: true,
    nombre: true,
    apellido: true,
    direccion: true,
    numeroTelefono: true,
    numeroTelefonoAlternativo: true,
    email: true,
  });

  const [isFormValid, setIsFormValid] = useState(false);

  useEffect(() => {
    // Campos obligatorios
    const requiredFields = ['idTipoDocumento', 'numeroDocumento', 'nombre', 'apellido'];
    
    // Verificar si todos los campos obligatorios tienen un valor
    const areRequiredFieldsComplete = requiredFields.every((field) => !!newCliente[field]);

    // Verificar la validez de todos los campos
    const isValidForm = Object.values(validation).every((isValid) => isValid);

    // Habilitar el botón "Agregar" solo si todos los campos obligatorios están completos y el formulario es válido
    setIsFormValid(areRequiredFieldsComplete && isValidForm);
  }, [newCliente, validation]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
  
    let formattedValue = value;
  
    if (name.includes('numeroTelefono') || name.includes('numeroTelefonoAlternativo')) {
      // Si el campo es de teléfono, solo permitir números y agregar el prefijo "+"
      formattedValue = `+${value.replace(/\D/g, '')}`;
  
      // Limitar a una longitud razonable para un número de teléfono
      formattedValue = formattedValue.slice(0, 15); // Puedes ajustar este valor según tus necesidades
    } else if (name === 'numeroDocumento' && tipoDocumentoSeleccionado === 1) {
      // Si el tipo de documento es DNI, permitir solo dígitos y limitar a 8 caracteres
      formattedValue = value.replace(/\D/g, '').slice(0, 8);
    } else if (name === 'numeroDocumento' && (tipoDocumentoSeleccionado === 2 || tipoDocumentoSeleccionado === 3)) {
      // Si el tipo de documento es CUIT o CUIL, formatear con guiones
      formattedValue = value.replace(/\D/g, ''); // Eliminar caracteres no numéricos
  
      if (formattedValue.length > 2) {
        formattedValue = `${formattedValue.slice(0, 2)}-${formattedValue.slice(2)}`;
      }
      if (formattedValue.length > 11) {
        formattedValue = `${formattedValue.slice(0, 11)}-${formattedValue.slice(11)}`;
      }
  
      // Limitar a los primeros 13 caracteres (incluyendo los guiones)
      formattedValue = formattedValue.slice(0, 13);
    }
  
    const isValid = validateField(name, formattedValue);
    setValidation({ ...validation, [name]: isValid });
  
    setNewCliente({ ...newCliente, [name]: formattedValue });
  };
  
  
  
  
  
  

  const handleTipoDocumentoChange = (e) => {
    const tipoDocumento = e.target.value;
    setTipoDocumentoSeleccionado(tipoDocumento);

    let numeroDocumentoValidation = true;
    switch (tipoDocumento) {
      case 1: // DNI
        numeroDocumentoValidation = newCliente.numeroDocumento.length === 8;
        break;
      case 2: // CUIT
      case 3: // CUIL
        const cuitCuilRegex = /^\d{2}-\d{8}-\d{1}$/;
        numeroDocumentoValidation = cuitCuilRegex.test(newCliente.numeroDocumento);
        break;
      default:
        break;
    }

    setValidation({
      ...validation,
      idTipoDocumento: tipoDocumento !== 0, // Verifica que el tipo de documento no sea 0
      numeroDocumento: numeroDocumentoValidation,
    });

    setNewCliente({ ...newCliente, idTipoDocumento: tipoDocumento });
  };

  const validateField = (name, value) => {
    switch (name) {
      case 'numeroDocumento':
        if (tipoDocumentoSeleccionado === 1) { // DNI
          // Verificar que el valor tenga exactamente 8 dígitos
          return /^\d{8}$/.test(value);
        } else if (tipoDocumentoSeleccionado === 2 || tipoDocumentoSeleccionado === 3) { // CUIT o CUIL
          // Validación existente para CUIT o CUIL
          const cuitCuilRegex = /^\d{2}-\d{8}-\d{1}$/;
          return cuitCuilRegex.test(value);
        }
        return true;
      case 'email':
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(value);
      default:
        return true;
    }
  };
  

  const handleAgregar = async () => {
    if (isFormValid) {
      try {
        const addedCliente = await ClientesService.create(newCliente);
        onClienteAdded();
        alert('Cliente agregado correctamente');
        onClose();
        setNewCliente({
          idTipoDocumento: 0,
          numeroDocumento: '',
          nombre: '',
          apellido: '',
          direccion: '',
          numeroTelefono: '',
          numeroTelefonoAlternativo: '',
          email: '',
        });
      } catch (error) {
        alert(error.response.data);
      }
    } else {
      alert('Por favor, completa todos los campos correctamente.');
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Cliente</DialogTitle>
      <DialogContent>
        <FormControl sx={{ m: 1, minWidth: 120 }} size="medium">
          <InputLabel id="demo-simple-select-standard-label">TipoDocumento</InputLabel>
          <Select
            variant="standard"
            labelId="demo-select-medium-label"
            id="demo-select-medium"
            name='idTipoDocumento'
            value={newCliente.idTipoDocumento}
            label="tipoDocumento"
            onChange={(e) => {
              setTipoDocumentoSeleccionado(e.target.value);
              handleTipoDocumentoChange(e);
            }}
          >
            <MenuItem value={0}>Seleccionar</MenuItem>
            <MenuItem value={1}>DNI</MenuItem>
            <MenuItem value={2}>CUIT</MenuItem>
            <MenuItem value={3}>CUIL</MenuItem>
          </Select>
        </FormControl>
        <TextField
          autoFocus
          required
          margin="dense"
          id="numeroDocumento"
          label="Número de Documento"
          type="text"
          fullWidth
          name="numeroDocumento"
          value={newCliente.numeroDocumento}
          onChange={handleInputChange}
          error={!validation.numeroDocumento}
        />
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre"
          required
          type="text"
          fullWidth
          name="nombre"
          value={newCliente.nombre}
          onChange={handleInputChange}
          error={!validation.nombre}
        />
        <TextField
          required
          margin="dense"
          id="apellido"
          label="Apellido"
          type="text"
          fullWidth
          name="apellido"
          value={newCliente.apellido}
          onChange={handleInputChange}
          error={!validation.apellido}
        />
        <TextField
          margin="dense"
          id="direccion"
          label="Dirección"
          type="text"
          fullWidth
          name="direccion"
          value={newCliente.direccion}
          onChange={handleInputChange}
          error={!validation.direccion}
        />
        <TextField
          margin="dense"
          id="numeroTelefono"
          label="Número de Teléfono"
          type="text"
          fullWidth
          name="numeroTelefono"
          value={newCliente.numeroTelefono}
          onChange={handleInputChange}
          error={!validation.numeroTelefono}
        />
        <TextField
          margin="dense"
          id="numeroTelefonoAlternativo"
          label="Número de Teléfono Alternativo"
          type="text"
          fullWidth
          name="numeroTelefonoAlternativo"
          value={newCliente.numeroTelefonoAlternativo}
          onChange={handleInputChange}
          error={!validation.numeroTelefonoAlternativo}
        />
        <TextField
          margin="dense"
          id="email"
          label="Email"
          type="text"
          fullWidth
          name="email"
          value={newCliente.email}
          onChange={handleInputChange}
          error={!validation.email}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleAgregar} color="primary" disabled={!isFormValid}>
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarClienteDialog;
