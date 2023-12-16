// AgregarRepartidorDialog.jsx
import React, { useState } from "react";
import {
  Dialog,
  DialogContent,
  DialogTitle,
  TextField,
  DialogActions,
  Button,
} from "@mui/material";
import repartidoresService from "src/service/repartidoresService";

const AgregarRepartidorDialog = ({ open, onClose, refrescar }) => {
  const [id, setId] = useState("");
  const [nombre, setNombre] = useState("");
  const [apellido, setApellido] = useState("");

  //validacion
  const [errorNombre, setErrorNombre] = useState(false);
  const [errorApellido, setErrorApellido] = useState(false);


  const handleCancelar = () => {
    setErrorNombre(false);
    setErrorApellido(false);
    onClose();
    setNombre("");
    setApellido("");
  };

  const areAllFieldsFilled = () => {
    // Verifica que todos los campos requeridos estén completos
    return nombre && apellido;
  };

  const handleAgregar = async () => {
    try {
      if (areAllFieldsFilled()) {
        await repartidoresService.create({
          nombre,
          apellido,
        });
        alert("Repartidor agregado correctamente");
        onClose();
        refrescar(); // Llama a la función refrescar después de agregar el repartidor
        setApellido("");
        setNombre("");
      }
    } catch (error) {
      alert(error.response.data);
    }
  };
  

  const handleNombreChange = (e) => {
    const nuevoNombre = e.target.value;
    //Validacion
    const esValido = nuevoNombre.trim() !== ""; //verifica que el nombre no esté vacío
    // Actualiza el estado de error según la validación
    setErrorNombre(!esValido);
    // Actualiza el estado del nombre
    setNombre(nuevoNombre);
  };

  const handleApellidoChange = (e) => {
    const nuevoApellido = e.target.value;
    // Realiza tu lógica de validación aquí
    const esValido = nuevoApellido.trim() !== "";
    // Actualiza el estado de error según la validación
    setErrorApellido(!esValido);
    // Actualiza el estado del apellido
    setApellido(nuevoApellido);
  };

  const isBotonAgregarClickeable = nombre.trim() !== '' && apellido.trim() !== '';

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Agregar Nuevo Repartidor</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="nombre"
          label="Nombre del Repartidor"
          type="text"
          fullWidth
          name="nombre"
          value={nombre}
          onChange={handleNombreChange}
          error={errorNombre}
          helperText={errorNombre && 'El nombre es requerido'}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido del Repartidor"
          type="text"
          fullWidth
          name="apellido"
          value={apellido}
          onChange={handleApellidoChange}
          error={errorApellido}
          helperText={errorApellido && 'El apellido es requerido'}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={handleCancelar} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleAgregar} color="primary" disabled={!isBotonAgregarClickeable}>
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarRepartidorDialog;
