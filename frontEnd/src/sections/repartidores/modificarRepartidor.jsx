// ModificarRepartidorDialog.jsx
import React, { useEffect, useState } from "react";
import {
  Dialog,
  DialogContent,
  DialogTitle,
  TextField,
  DialogActions,
  Button,
  Alert,
} from "@mui/material";
import RepartidoresService from "src/service/repartidoresService";
import { useAuth } from "src/contexts/AuthContext";

const ModificarRepartidorDialog = ({ open, onClose, repartidor, refrescar }) => {
  const authContext = useAuth();
  const repartidoresService = new RepartidoresService(authContext);
  
  const [id, setId] = useState("");
  const [nombre, setNombre] = useState("");
  const [apellido, setApellido] = useState("");

  // Validación
  const [error, setError] = useState(false);
  const [errorApellido, setErrorApellido] = useState(false);

  useEffect(() => {
    setId(repartidor.idRepartidor || "");
    setNombre(repartidor.nombre || "");
    setApellido(repartidor.apellido || "");
  }, [repartidor]);

  const handleCancelar = () => {
    onClose();
    // Restaurar los valores originales
    setId(repartidor.idRepartidor || "");
    setNombre(repartidor.nombre || "");
    setApellido(repartidor.apellido || "");
    setError(false);
    setErrorApellido(false);
  };

  const handleModificar = async () => {
    try {
      const repartidorActualizado = await repartidoresService.update(id, {
        nombre,
        apellido,
      });
      alert("Repartidor modificado con éxito");
      onClose(); // Cierra el modal después de la actualización
      refrescar(); // Actualiza la tabla de repartidores
    } catch (error) {
      alert(error.response.data);
    }
  };

  const handleNombreChange = (e) => {
    const nuevoNombre = e.target.value;
    //Validacion
    const esValido = nuevoNombre.trim() !== ""; //verifica que el nombre no esté vacío
    // Actualiza el estado de error según la validación
    setError(!esValido);
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

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Repartidor</DialogTitle>
      <DialogContent>
        <TextField
          disabled
          margin="dense"
          id="id"
          label="ID del Repartidor"
          type="text"
          fullWidth
          value={id}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre del Repartidor"
          type="text"
          fullWidth
          value={nombre}
          onChange={handleNombreChange}
          error={error}
          helperText={error ? "Este campo no puede estar vacío" : ""}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido del Repartidor"
          type="text"
          fullWidth
          value={apellido}
          onChange={handleApellidoChange}
          error={errorApellido}
          helperText={errorApellido ? "Este campo no puede estar vacío" : ""}
        /> 
      </DialogContent>
      <DialogActions>
        <Button onClick={handleCancelar} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleModificar} color="primary" disabled={!nombre && !apellido}>
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarRepartidorDialog;
