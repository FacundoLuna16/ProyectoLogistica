import React, { useState, useEffect, useRef} from "react";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import TextField from "@mui/material/TextField";
import Grid from "@mui/material/Grid";
import {
  Dialog,
  DialogContent,
  DialogTitle,
  DialogActions,
  Button,
  CircularProgress,
  Checkbox,
} from "@mui/material";
import EnvioService from "src/service/enviosService";
import ClientesService from "src/service/clientesService";
import { useAuth } from "src/contexts/AuthContext";
import { Box } from "@mui/system";
import { Typography } from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import DeleteIcon from "@mui/icons-material/Delete";
import IconButton from "@mui/material/IconButton";
import AgregarClienteDialog from "src/sections/clientes/altaClientes";
import { isValid } from "date-fns";
import { is } from "date-fns/locale";
import CloudUploadIcon from "@mui/icons-material/CloudUpload";
import { styled } from "@mui/material/styles";
import Autocomplete from "@mui/material/Autocomplete";
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
});

const AgregarEnvioDialog = ({ open, onClose, onEnvioAdded }) => {
  const authContext = useAuth();
  const enviosService = new EnvioService(authContext);
  const clientesService = new ClientesService(authContext);
  const [tipoDocumento, setTipoDocumento] = useState('factura'); // Valores posibles: 'factura', 'remito'

  const [newEnvio, setNewEnvio] = useState({
    numeroFactura: "",
    idCliente: "",
    idZona: "",
    direccionEnvio: "",
    entreCalles: "",
    ultimosDigitosTarjeta: "",
    descripcion: "",
    tipoEnvio: "",
    envioExterno: false,
  });

  const [isFormValid, setIsFormValid] = useState(false);
  const [loading, setLoading] = useState(true);
  //almacena todos los clientes
  const [clientes, setClientes] = useState([]);
  const [clientesFiltrados, setClientesFiltrados] = useState([]); // Nuevo estado para los clientes filtrados
  const [tipoDocumentoFiltro, setTipoDocumentoFiltro] = useState("DNI");
  const [clienteSeleccionado, setClienteSeleccionado] = useState({
    idCliente: "",
    tipoDocumento: "",
    numeroDocumento: "",
    nombre: "",
    apellido: "",
  }); // Nuevo estado para el cliente seleccionado

  //Busca los clientes
  const fetchClientes = async () => {
    try {
      const data = await clientesService.getAll();
      setClientes(data);
      filtrarPorTipoDocumento(tipoDocumentoFiltro);
      return data; // Retorna la data en lugar de hacer setClientes
    } catch (error) {
      console.error("Error al obtener clientes:", error);
      return [];
    }
  };


  const inputRef = useRef(null);

  const handlePlaceChanged = () => {
    const place = inputRef.current.getPlaces()[0];
    if (place && place.formatted_address) {
      setNewEnvio({ ...newEnvio, direccionEnvio: place.formatted_address });
    }
  };
  const filtrarPorTipoDocumento = (tipoDocumento) => {
    const clientesFiltrados = clientes.filter((cliente) => {
      const valorAtributo = cliente.tipoDocumento.toLowerCase();
      const tipoDocumentoLowerCase = tipoDocumento.toLowerCase();
      return valorAtributo.includes(tipoDocumentoLowerCase);
    });
    setClientesFiltrados(clientesFiltrados);
    setClienteSeleccionado({
      idCliente: "",
      tipoDocumento: "",
      numeroDocumento: "",
      nombre: "",
      apellido: "",
    });
  };

  //Logica de zona
  const handleZonaChange = (event) => {
    setNewEnvio({ ...newEnvio, idZona: event.target.value });
  };

  // Esto sirve para los manejos de cambios globales
  const handleChange = (event) => {
    const { name, value } = event.target;
  
    if (name === "numeroFactura") {
      let formattedValue = value.replace(/[^A-Za-z0-9]/g, ""); // Elimina caracteres no alfanuméricos
  let isValidFormat = false;

  if (tipoDocumento === 'factura') {
    // Intenta aplicar formato A-1234-12345678
    if (formattedValue.length > 1 && /^[A-Za-z]\d{0,12}$/.test(formattedValue)) {
      // Si el primer carácter es una letra y los demás son dígitos (hasta 12 dígitos)
      formattedValue = formattedValue[0] + "-" + formattedValue.substring(1);
      if (formattedValue.length > 6) {
        // Agrega el segundo guión después del cuarto dígito
        formattedValue = formattedValue.substring(0, 6) + "-" + formattedValue.substring(6);
      }
      isValidFormat = /^[A-Za-z]-\d{4}-\d{8}$/.test(formattedValue); // Verifica el formato completo
    }
    } else if (tipoDocumento === 'remito') {
      // Validación estricta de 8 dígitos para remito
      isValidFormat = /^\d{8}$/.test(formattedValue);
    }

    setValidation((prevValidation) => ({
      ...prevValidation,
      [name]: isValidFormat,
    }));

    setNewEnvio((prevEnvio) => ({
      ...prevEnvio,
      [name]: formattedValue,
    }));
    } else {
      setNewEnvio((prevEnvio) => ({
        ...prevEnvio,
        [name]: value,
      }));
    }
  };

  const [validation, setValidation] = useState({
    numeroFactura: true,
    ultimosDigitosTarjeta: true,
  });

  useEffect(() => {
    const requiredFields = [
      "numeroFactura",
      "idCliente",
      "idZona",
      "direccionEnvio",
      "tipoEnvio",
    ];
    const areRequiredFieldsComplete = requiredFields.every((field) => !!newEnvio[field]);
    const isValidForm = Object.values(validation).every((isValid) => isValid);
    setIsFormValid(areRequiredFieldsComplete && isValidForm);
  }, [newEnvio, validation]);

  // Manejo de cambios de la tarjeta con 4 digitos
  const handleUltimosDigitosTarjetaChange = (event) => {
    const value = event.target.value;
    // Expresion regular para que sean 4 ni mas ni menos
    if (value === "" || (value.match(/^\d+$/) && value.length <= 4)) {
      setNewEnvio({ ...newEnvio, ultimosDigitosTarjeta: value });
    }
  };

  // Validar el campo de los últimos dígitos de la tarjeta
  const validarUltimosDigitosTarjeta = () => {
    return newEnvio.ultimosDigitosTarjeta.length === 4;
  };

  // const handleClienteSeleccionadoChange = (event) => {
  //   const cliente = event.target.value;
  //   setClienteSeleccionado(cliente);
  //   setNewEnvio({ ...newEnvio, idCliente: cliente.idCliente });
  // };

  const handleClienteSeleccionadoChange = (_, selectedOption) => {
    if (selectedOption) {
      setClienteSeleccionado(selectedOption);
      setNewEnvio({ ...newEnvio, idCliente: selectedOption.idCliente });
    } else {
      setClienteSeleccionado({
        idCliente: "",
        tipoDocumento: "",
        numeroDocumento: "",
        nombre: "",
        apellido: "",
      });
      setNewEnvio({ ...newEnvio, idCliente: "" });
    }
  };

  const filterClientes = (options, { inputValue }) => {
    const inputValueLowerCase = inputValue.trim().toLowerCase();
    return options.filter(
      (cliente) =>
        cliente.numeroDocumento.toLowerCase().startsWith(inputValueLowerCase) ||
        cliente.nombre.toLowerCase().includes(inputValueLowerCase) ||
        cliente.apellido.toLowerCase().includes(inputValueLowerCase)
    );
  };

  //const [tipoEnvio, setTipoEnvio] = useState("");
  const handleTipoEnvioChange = (event) => {
    const tipoEnvio = event.target.value;
    //setTipoEnvio(tipoEnvio);
    setNewEnvio({ ...newEnvio, tipoEnvio: tipoEnvio });
  };

  const handleOnEnvioAdded = async () => {
    if (isFormValid) {
      try {
        await enviosService.create(newEnvio);

        alert("Envío agregado exitosamente");
        onClose();
        onEnvioAdded();
      } catch (error) {
        // Mostrar el mensaje de error en un alert
        alert(error.response.data);
      }
    } else {
      alert("Por favor, completa todos los campos.");
    }
  };

  // Logica boton agregar cliente
  const [openAgregarCliente, setOpenAgregarCliente] = useState(false);

  const handleOpenAgregarCliente = () => {
    setOpenAgregarCliente(true);
  };
  const [recargarClientes, setRecargarClientes] = useState(false);

  const handleCloseAgregarCliente = () => {
    setOpenAgregarCliente(false);
    setRecargarClientes(!recargarClientes);
  };

  const handleClienteAdded = () => {
    const fetchData = async () => {
      setLoading(true); // Inicia la carga

      // Espera a que fetchClientes complete y obtiene la data
      const data = await fetchClientes();

      setClientes(data); // Actualiza la lista completa de clientes
      filtrarPorTipoDocumento(tipoDocumentoFiltro);

      setLoading(false); // Finaliza la carga
      setRecargarClientes(prev => !prev);
    };
    fetchData(); // Llama a la función interna
  };

  useEffect(() => {
    // Restablecer el estado cuando se cierre el diálogo
    if (open) {
      fetchClientes().then(() => {
        setTipoDocumentoFiltro("DNI");
        filtrarPorTipoDocumento("DNI");
      });
    }
    if (!open) {
      setNewEnvio({
        numeroFactura: "",
        idCliente: "",
        idZona: "",
        direccionEnvio: "",
        entreCalles: "",
        ultimosDigitosTarjeta: "",
        descripcion: "",
        tipoEnvio: "",
        envioExterno: false,
      });
    }
  }, [open]);


  useEffect(() => {
    const fetchData = async () => {
      setLoading(true); // Inicia la carga
      const data = await fetchClientes();
      setLoading(false);

    };
    fetchData(); // Llama a la función interna

  }, [recargarClientes]);

  // Mostrar la rueda de carga mientras se están recuperando los datos
  if (loading) {
    return (
      <Dialog open={open} onClose={onClose} >
        <DialogTitle>Cargando...</DialogTitle>
        <DialogContent>
          <Box sx={{ display: "flex", justifyContent: "center" }}>
            <CircularProgress />
          </Box>
        </DialogContent>
      </Dialog>
    );
  }

  return (
    <Dialog open={open} onClose={onClose} maxWidth="md" fullWidth zIndex="7">
      <DialogTitle>Agregar Envío</DialogTitle>
      <DialogContent
        sx={{
          "& .MuiFormControl-root": { m: 1 },
          "& .MuiTextField-root": { m: 1 },
          overflowY: "auto",
        }}
      >
        <style jsx global>{`
        .pac-container {
          z-index: 1500 !important;
        }
      `}</style>
        <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
          <Box
            size="small"
            display="flex"
            flexDirection={{ xs: "column", sm: "row" }}
            alignItems="center"
            gap={2}
          >
            <FormControl size="small" sx={{ width: "55%" }}>
            <InputLabel id="tipo-documento-label">Tipo Documento</InputLabel>
            <Select
              labelId="tipo-documento-label"
              id="tipo-documento-select"
              value={tipoDocumento}
              label="Tipo"
              onChange={(e) => setTipoDocumento(e.target.value)}
            >
              <MenuItem value="factura">Número de Factura</MenuItem>
              <MenuItem value="remito">Remito</MenuItem>
            </Select>
            </FormControl>
            <TextField
                autoFocus
                id="numeroFactura"
                label={tipoDocumento === 'factura' ? "Nro Factura" : "Nro Remito"}
                type="text"
                fullWidth
                required
                name="numeroFactura"
                error={!validation.numeroFactura}
                value={newEnvio.numeroFactura}
                onChange={handleChange}
                size="small"
                helperText={!validation.numeroFactura ? "Formato incorrecto" : ""}
                inputProps={{
                  maxLength: tipoDocumento === 'factura' ? 15 : 8
                }}
              />
            {/* Select para el tipo de envío */}
            <FormControl size="small" sx={{ width: "40%" }}>
              <InputLabel id="tipo-envio-label">Tipo de Envío*</InputLabel>
              <Select
                labelId="tipo-envio-label"
                id="tipo-envio-select"
                value={newEnvio.tipoEnvio}
                label="Tipo de Envío"
                onChange={handleTipoEnvioChange}
              >
                <MenuItem value="1">Envío Web</MenuItem>
                <MenuItem value="2">Salsep</MenuItem>
                <MenuItem value="3">Empresa</MenuItem>
              </Select>
            </FormControl>
            {/* Check box para saleccionar si es envio a Correo Particular o entrega de cliente true o false */}
            <Checkbox
              checked={newEnvio.envioExterno}
              onChange={(e) => {
                setNewEnvio({ ...newEnvio, envioExterno: e.target.checked });
              }}
              color="primary"
            />
            Envío a Correo Particular
          </Box>
          <Typography variant="subtitle1" gutterBottom>
            Cliente *
          </Typography>
          <Box
            display="flex"
            flexDirection={{ xs: "column", sm: "row" }}
            alignItems="center"
            gap={2}
          >
            <Box flex={1}>
              <FormControl fullWidth>
                <InputLabel id="numeroFactura-label">TipoDocumento</InputLabel>
                <Select
                  labelId="tipoDocumento-label"
                  id="tipoDocumento"
                  name="idTipoDocumento"
                  value={tipoDocumentoFiltro}
                  label="TipoDocumento"
                  onChange={(e) => {
                    setTipoDocumentoFiltro(e.target.value);
                    filtrarPorTipoDocumento(e.target.value);
                  }}
                  size="small"
                >
                  <MenuItem value={"DNI"}>DNI</MenuItem>
                  <MenuItem value={"CUIT"}>CUIT</MenuItem>
                  <MenuItem value={"CUIL"}>CUIL</MenuItem>
                </Select>
              </FormControl>
            </Box>
            <Box flex={2}>
              <Autocomplete
                options={clientesFiltrados
                  .slice()
                  .sort((a, b) => a.numeroDocumento - b.numeroDocumento)}
                getOptionLabel={(cliente) => cliente.numeroDocumento}
                value={clienteSeleccionado}
                onChange={handleClienteSeleccionadoChange}
                filterOptions={filterClientes} // Aplicar el nuevo filtro
                renderInput={(params) => (
                  <TextField {...params} label="Numero Documento" size="small" fullWidth />
                )}
              />
            </Box>
            {/* <Box flex={2}>
              <FormControl fullWidth>
                <InputLabel id="numeroDocumento-label">Numero Documento</InputLabel>
                <Select
                  labelId="numeroDocumento-label"
                  id="numeroDocumento"
                  value={clienteSeleccionado}
                  onChange={handleClienteSeleccionadoChange}
                  size="small"
                  style={{ width: "100%" }}
                  MenuProps={{
                    PaperProps: {
                      style: {
                        maxHeight: 200, // Ajusta la altura máxima del menú según tus necesidades
                      },
                    },
                  }}
                >
                  {clientesFiltrados
                    .slice()
                    .sort((a, b) => a.numeroDocumento - b.numeroDocumento)
                    .map((cliente) => (
                      <MenuItem key={cliente.id} value={cliente}>
                        {cliente.numeroDocumento}
                      </MenuItem>
                    ))}
                </Select>
              </FormControl>
            </Box> */}

            <Box flex={3}>
              <TextField
                id="nombre"
                label="Nombre"
                type="text"
                fullWidth
                name="nombre"
                value={clienteSeleccionado.nombre + " " + clienteSeleccionado.apellido}
                InputProps={{
                  readOnly: true,
                }}
                size="small"
              />
            </Box>
            <Box flex={1}>
              <Button
                variant="contained"
                color="info"
                onClick={handleOpenAgregarCliente}
                sx={{ whiteSpace: "nowrap", width: "100%" }}
              >
                Agregar Cliente
              </Button>
              <AgregarClienteDialog
                open={openAgregarCliente}
                onClose={handleCloseAgregarCliente}
                onClienteAdded={handleClienteAdded}

              />
            </Box>
          </Box>
          <FormControl fullWidth>
            <InputLabel id="zona-label">Zona</InputLabel>
            <Select
              labelId="zona-label"
              id="zona"
              value={newEnvio.idZona}
              label="Zona"
              onChange={handleZonaChange}
              size="small"
              MenuProps={{
                PaperProps: {
                  sx: {
                    ".MuiMenuItem-root": {
                      whiteSpace: "normal", // Permite que el texto se ajuste en varias líneas
                      wordWrap: "break-word", // Asegura que el texto se ajuste correctamente
                      maxWidth: "100%", // Limita el ancho de la lista
                    },
                  },
                },
              }}
            >
              <MenuItem value={"1"}>
                1(EZFUERZO, HIBEPA, CUENCA XV, GRAN NEUQUEN NORTE, GRAN NEUQUEN SUR, SAN LORENZO
                NORTE, SAN LORENZO SUR, VALNTINA NORTE URBANA, HUILLICHEZ, UNION DE MAYO, MELIPAL,
                GREGORIO ALVAREZ, EL PROGRESO, VILLA CEFERINO, BARDAS SOLEADAS, CUMELEN, ISLA
                MALVINAS, CIUDAD INDUSTRIAL, COLONIA NUEVA ESPERANZA, ALMA FUERTE, PARQUE
                INDUSTRIAL)
              </MenuItem>
              <MenuItem value={"2"}>
                2(TERRAZA DEL NEUQUEN, 14 DE OCUTBRE COPOL, RINCON DE EMILIO, ALTA BARDA, AREA
                CENTRO OESTE, RINCON DE EMILIO, ALTA BARDA, AREA CENTRO OESTE, AREA CENTRO ESTE,
                SANTA GENOVEVA, VILLA FARREL, PROVINCIAS UNIDAS, SAPERE, CENTENARIO, VISTA ALEGRE,
                CINCO SALTOS, BARDA DEL MEDIO, C.CORDERO)
              </MenuItem>
              <MenuItem value={"3"}>
                3(BOUQUET ROLDAN, MILITAR, VALENTINA SUR RURAL, BALSA LAS PERLAS, TERMINAL NEUQUEN,
                CANAL V, LA SIRENA, PLOTTIER, CHINA MUERTA, SENILLOSA)
              </MenuItem>
              <MenuItem value={"4"}>
                4(AREA CENTRO SUR, NUEVO, VILLA FLORENCIA, RIO GRANDE, DON BOSCO II, VILLA MARIA,
                BELGRANO, MARIANO MORENO, CONFLUENCIA URBANO, CONFLUENCIA RURAL, DON BOSCO III,
                LIMAY, CIPOLLETTI, FERNANDEZ ORO, ALLEN, ROCA, MAINQUE)
              </MenuItem>
            </Select>
          </FormControl>
          {/* Componente para subir arrastrando o algo un pdf */}
          <Typography variant="subtitle1" gutterBottom>
            Espacio para pdf *
          </Typography>
          <Button component="label" variant="contained" startIcon={<CloudUploadIcon />}>
            Upload file
            <VisuallyHiddenInput type="file" />
          </Button>
          <Grid container spacing={2}>
          <Grid item xs={12} sm={6}>
            <StandaloneSearchBox onLoad={ref => {inputRef.current = ref}} onPlacesChanged={handlePlaceChanged}>
            <TextField
              label="Dirección de Envío"
              type="text"
              fullWidth
              required
              name="direccionEnvio"
              value={newEnvio.direccionEnvio}
              onChange={handleChange}
              size="small"
              sx={70}
            />
            </StandaloneSearchBox>
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              label="Entre Calles"
              type="text"
              fullWidth
              name="entreCalles"
              value={newEnvio.entreCalles}
              onChange={handleChange}
              size="small"
            />
          </Grid>
        </Grid>
          <TextField
            label="Últimos Dígitos de la Tarjeta"
            type="text"
            fullWidth
            error={!validarUltimosDigitosTarjeta() && newEnvio.ultimosDigitosTarjeta.length > 0}
            helperText={!validarUltimosDigitosTarjeta() ? "Debe tener exactamente 4 dígitos" : ""}
            name="ultimosDigitosTarjeta"
            value={newEnvio.ultimosDigitosTarjeta}
            onChange={handleUltimosDigitosTarjetaChange}
            size="small"
          />
        </Box>
      </DialogContent>
      <DialogActions sx={{ justifyContent: "flex-end" }}>
        <Button onClick={onClose} color="inherit">
          Cancelar
        </Button>
        <Button
          onClick={handleOnEnvioAdded}
          color="primary"
          variant="contained"
          disabled={!isFormValid || loading}
        >
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarEnvioDialog;
