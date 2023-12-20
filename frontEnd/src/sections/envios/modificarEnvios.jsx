import React, { useState, useEffect } from "react";
import {
  Dialog,
  Typography,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  DialogContent,
  DialogTitle,
  TextField,
  DialogActions,
  Button,
  Box,
} from "@mui/material";
import enviosService from "src/service/enviosService";

const ModificarEnvioDialog = ({ open, onClose, envio, refrescar }) => {
  const [numeroFactura, setNumeroFactura] = useState("");
  const [cliente, setCliente] = useState({});
  const [idZona, setIdZona] = useState(0);
  const [detalleEnvio, setDetalleEnvio] = useState([]);
  const [direccionEnvio, setDireccionEnvio] = useState("");
  const [entreCalles, setEntreCalles] = useState("");
  const [cambiosEstado, setCambiosEstado] = useState([]);
  const [estadoActual, setEstadoActual] = useState("");
  const [ultimosDigitosTarjeta, setUltimosDigitosTarjeta] = useState("");

  const [isFormValid, setIsFormValid] = useState(false);

  const [validation, setValidation] = useState({
    direccionEnvio: true,
    entreCalles: true,
    ultimosDigitosTarjeta: true,
  });

  useEffect(() => {
    const requiredFields = ["direccionEnvio", "entreCalles", "ultimosDigitosTarjeta"];

    const areRequiredFieldsComplete = requiredFields.every((field) => !!field);

    const isValidForm = Object.values(validation).every((isValid) => isValid);

    setIsFormValid(areRequiredFieldsComplete && isValidForm);
  }, [envio, validation]);

  const handleInputChange = (e) => {
    const { id, value } = e.target;
  
    // Limitar la longitud del valor a 4 caracteres solo para el campo de tarjeta
    const truncatedValue = id === "ultimosDigitosTarjeta" ? value.slice(0, 4) : value;
  
    let isValid = true;
  
    switch (id) {
      case "direccionEnvio":
        isValid = truncatedValue.length > 0;
        break;
      case "entreCalles":
        isValid = truncatedValue.length > 0;
        break;
      case "ultimosDigitosTarjeta":
        // Verificar que contiene exactamente 4 números
        isValid = /^\d{4}$/.test(truncatedValue);
        break;
      default:
        break;
    }
  
    setValidation((prevState) => ({
      ...prevState,
      [id]: isValid,
    }));
  
    switch (id) {
      case "direccionEnvio":
        setDireccionEnvio(truncatedValue);
        break;
      case "entreCalles":
        setEntreCalles(truncatedValue);
        break;
      case "ultimosDigitosTarjeta":
        // Eliminar caracteres no numéricos solo para el campo de tarjeta
        const numericValue = truncatedValue.replace(/\D/g, "");
        setUltimosDigitosTarjeta(numericValue);
        break;
      default:
        break;
    }
  };
  
  

  useEffect(() => {
    setNumeroFactura(envio.numeroFactura || "");
    setCliente(envio.cliente || {});
    setIdZona(envio.zona || "");
    setDetalleEnvio(envio.detalleEnvio || []);
    setDireccionEnvio(envio.direccionEnvio || "");
    setEntreCalles(envio.entreCalles || "");
    setCambiosEstado(envio.cambiosEstado || []);
    setEstadoActual(envio.estadoActual || "");
    setUltimosDigitosTarjeta(envio.ultimosDigitosTarjeta || "");

    //validar los campos iniciales

  }, [envio, onClose]);

  const handleCancelar = () => {
    onClose();
  };

  const handleModificar = async () => {
    try {

      //mostrar el body antes de hacer el update
      alert(
        JSON.stringify({
          idCliente: cliente.idCliente,
          zona: idZona,
          direccionEnvio,
          entreCalles,
          ultimosDigitosTarjeta,
        })
      )
      await enviosService.update(numeroFactura, {
        idCliente: cliente.idCliente,
        idZona,
        direccionEnvio,
        entreCalles,
        ultimosDigitosTarjeta,
      });
      // mostrar el body de 
      alert("Envio modificado con exito");

      refrescar();
      onClose();
    } catch (error) {
      alert(error.response.data);
    }
  };

  return (
    <Dialog open={open} onClose={onClose} maxWidth="md" fullWidth>
      <DialogTitle>Modificar Envio</DialogTitle>
      <DialogContent sx={{ height: "100%", display: "flex", flexDirection: "column" }}>
        <TextField
          margin="dense"
          id="numeroFactura"
          label="Numero Factura"
          type="text"
          fullWidth
          value={numeroFactura}
          InputProps={{ readOnly: true }}
          sx={{ mb: 2 }}
        />
        <Typography variant="subtitle1" gutterBottom>
          Cliente
        </Typography>
        <Box display="flex" flexDirection="row" sx={{ mb: 2 }}>
          <TextField
            margin="dense"
            id="clienteNombre"
            label="Nombre y apellido"
            type="text"
            fullWidth
            value={cliente.nombre + " " + cliente.apellido}
            InputProps={{ readOnly: true }}
          />
          <TextField
            margin="dense"
            id="tipoDocumento"
            label="Tipo Documento"
            type="text"
            fullWidth
            value={cliente.tipoDocumento}
            InputProps={{ readOnly: true }}
          />
          <TextField
            margin="dense"
            id="numeroDocumento"
            label="Numero Documento"
            type="text"
            fullWidth
            value={cliente.numeroDocumento}
            InputProps={{ readOnly: true }}
          />
        </Box>
        <FormControl sx={{ m: 1, minWidth: 120 }} size="medium">
          <InputLabel id="demo-simple-select-standard-label">Zona</InputLabel>
          <Select
            variant="standard"
            labelId="demo-select-medium-label"
            id="zona"
            value={idZona}
            label="Zona"
            onChange={(e) => setIdZona(e.target.value)}
          >
            <MenuItem value={1}>1</MenuItem>
            <MenuItem value={2}>2</MenuItem>
            <MenuItem value={3}>3</MenuItem>
            <MenuItem value={4}>4</MenuItem>
          </Select>
        </FormControl>
        <TextField
          required
          margin="dense"
          id="direccionEnvio"
          label="Direccion de envio"
          type="text"
          fullWidth
          value={direccionEnvio}
          //onChange use handleInputChange
          onChange={handleInputChange}
          error={!validation.direccionEnvio}
        />
        <TextField
          required
          margin="dense"
          id="entreCalles"
          label="Entre calles"
          type="text"
          fullWidth
          value={entreCalles}
          onChange={handleInputChange}
          error={!validation.entreCalles}
        />
        <TextField
          required
          margin="dense"
          id="ultimosDigitosTarjeta"
          label="Ultimos digitos tarjeta"
          type="text"
          fullWidth
          value={ultimosDigitosTarjeta}
          onChange={handleInputChange}
          error={!validation.ultimosDigitosTarjeta}
        />

        {/* Puedes seguir agregando más campos de esta manera */}
      </DialogContent>
      <DialogActions>
        <Button onClick={handleCancelar}>Cancelar</Button>
        <Button onClick={handleModificar} color="primary" disabled={!isFormValid}>
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarEnvioDialog;
