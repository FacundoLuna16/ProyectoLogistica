import React, { useState, useEffect, useRef } from "react";
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
import EnvioService from "src/service/enviosService";
import { useAuth } from "src/contexts/AuthContext";
import CloudUploadIcon from "@mui/icons-material/CloudUpload";
import { styled } from "@mui/material/styles";
import { StandaloneSearchBox, LoadScript } from "@react-google-maps/api";

const VisuallyHiddenInput = styled("input")({
  clip: "rect(0 0 0 0)",
  clipPath: "inset(50%)",
  height: 1,
  overflow: "hidden",
  position: "absolute",
  bottom: 0,
  left: 0,
  whiteSpace: "nowrap",
  width: 1,
}).withComponent("input"); // Agrega esta línea para permitir la propagación del evento onChange

// ...

const ModificarEnvioDialog = ({ open, onClose, envio, refrescar }) => {
  const authContext = useAuth();
  const enviosService = new EnvioService(authContext);
  const [numeroFactura, setNumeroFactura] = useState("");
  const [cliente, setCliente] = useState({});
  const [idZona, setIdZona] = useState(0);
  //const [detalleEnvio, setDetalleEnvio] = useState([]);
  const [direccionEnvio, setDireccionEnvio] = useState("");
  const [entreCalles, setEntreCalles] = useState("");
  //const [cambiosEstado, setCambiosEstado] = useState([]);
  //const [estadoActual, setEstadoActual] = useState("");
  const [ultimosDigitosTarjeta, setUltimosDigitosTarjeta] = useState("");
  const [imagen, setImagen] = useState(null);
  const [isImagenSelected, setIsImagenSelected] = useState(false);


  const [isFormValid, setIsFormValid] = useState(false);
  const [initialValues, setInitialValues] = useState({});
  const [isFormModified, setIsFormModified] = useState(false);

  const [validation, setValidation] = useState({
    direccionEnvio: true,
  });

  const inputRef = useRef(null);

  const handlePlaceChanged = () => {
    const place = inputRef.current.getPlaces()[0];
    if (place && place.formatted_address) {
      setDireccionEnvio(place.formatted_address);
      setValidation(prevState => ({ ...prevState, direccionEnvio: true }));
    }
  };

  useEffect(() => {
    const requiredFields = ["direccionEnvio"];

    const areRequiredFieldsComplete = requiredFields.every((field) => !!field);

    const isValidForm = Object.values(validation).every((isValid) => isValid);

    setIsFormValid(areRequiredFieldsComplete && isValidForm);
  }, [envio, validation]);

  const handleInputChange = (e) => {
    const { id, value } = e.target;

    // Limitar la longitud del valor a 4 caracteres solo para el campo de tarjeta
    const truncatedValue = id === "ultimosDigitosTarjeta" ? value.slice(0, 4) : value;

    // Verificar si el valor actual es diferente al valor inicial
    const isFieldModified = truncatedValue !== initialValues[id];

    // Actualizar el estado de modificación
    setIsFormModified(isFieldModified || isFormModified);

    let isValid = true;

    switch (id) {
      case "direccionEnvio":
        isValid = truncatedValue.length > 0;
        break;
      // case "entreCalles":
      //   isValid = truncatedValue.length > 0;
      //   break;
      case "ultimosDigitosTarjeta":
        // Verificar que contiene exactamente 4 números
        isValid = /^(?:\d{4})?$/.test(truncatedValue);
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
    setInitialValues({
      numeroFactura: envio.numeroFactura || "",
      cliente: envio.cliente || {},
      idZona: envio.zona || "",
      //detalleEnvio: envio.detalleEnvio || [],
      direccionEnvio: envio.direccionEnvio || "",
      entreCalles: envio.entreCalles || "",
      //cambiosEstado: envio.cambiosEstado || [],
      //estadoActual: envio.estadoActual || "",
      ultimosDigitosTarjeta: envio.ultimosDigitosTarjeta || "",
    });
    setNumeroFactura(envio.numeroFactura || "");
    setCliente(envio.cliente || {});
    setIdZona(envio.zona || "");
    //setDetalleEnvio(envio.detalleEnvio || []);
    setDireccionEnvio(envio.direccionEnvio || "");
    setEntreCalles(envio.entreCalles || "");
    //setCambiosEstado(envio.cambiosEstado || []);
    //setEstadoActual(envio.estadoActual || "");
    setUltimosDigitosTarjeta(envio.ultimosDigitosTarjeta || "");

    setIsFormModified(false);
    setIsImagenSelected(false);
    setImagen(null);
  }, [envio, onClose]);

  const handleCancelar = () => {
    onClose();
  };

  const handleModificar = async () => {
    try {
      const datosNuevos = {
        idCliente: cliente.idCliente,
        idZona,
        direccionEnvio,
        entreCalles,
        ultimosDigitosTarjeta,
      };
      await enviosService.update(numeroFactura, datosNuevos);
      // mostrar el body de
      alert("Envio modificado con exito");

      refrescar();
      onClose();
    } catch (error) {
      alert(error.response.data);
    }
  };

  const handleUpload = async () => {
    try {
      if (imagen) {
        const response = await enviosService.subirImagen(numeroFactura, imagen);
        // mostrar el cuerpo de éxito
        alert("Imagen subida con éxito");
        alert(response)
        onClose();
      } else {
        alert("Selecciona una imagen antes de subirla.");
      }
    } catch (error) {
      alert(error.response.data);
    }
  }
  return (
    <Dialog open={open} onClose={onClose} maxWidth="md" fullWidth>
      <DialogTitle>Modificar Envio</DialogTitle>
      <DialogContent sx={{ height: "100%", display: "flex", flexDirection: "column" }}>
                <style jsx global>{`
        .pac-container {
          z-index: 1500 !important;
        }
      `}</style>
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
            label="Nombre"
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
        <StandaloneSearchBox onLoad={ref => {inputRef.current = ref}} onPlacesChanged={handlePlaceChanged}>
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
        </StandaloneSearchBox>
        <TextField
          margin="dense"
          id="entreCalles"
          label="Entre calles"
          type="text"
          fullWidth
          value={entreCalles}
          onChange={handleInputChange}
        />
        <TextField
          margin="dense"
          id="ultimosDigitosTarjeta"
          label="Ultimos digitos tarjeta"
          type="text"
          fullWidth
          value={ultimosDigitosTarjeta}
          onChange={handleInputChange}
          //error={!validation.ultimosDigitosTarjeta}
        />
        <Typography variant="subtitle1" gutterBottom>
          Imagen para registro de no entrega
        </Typography>
        <Box display="flex" alignItems="center" justifyContent="space-between">
        <Button component="label" variant="contained" startIcon={<CloudUploadIcon />}>
          Upload file
          <VisuallyHiddenInput
            type="file"
            onChange={(e) => {
              setImagen(e.target.files[0]);
              //mostrar el nombre del archivo
              alert(e.target.files[0].name);
              setIsImagenSelected(true);
            }}
          />
        </Button>
        <Typography variant="subtitle1" gutterBottom>
          {imagen?.name}
        </Typography>
        <Button
          variant="contained"
          onClick={handleUpload}
          disabled={!isImagenSelected}
        >
          Subir Imagen
        </Button>
        </Box>
        {/* Puedes seguir agregando más campos de esta manera */}
      </DialogContent>
      <DialogActions>
        <Button onClick={handleCancelar}>Cancelar</Button>
        <Button onClick={handleModificar} color="primary" disabled={!isFormModified}>
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarEnvioDialog;