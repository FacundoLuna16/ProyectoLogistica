import React, { useState, useEffect } from "react";
import InputLabel from "@mui/material/InputLabel";
import MenuItem from "@mui/material/MenuItem";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import TextField from "@mui/material/TextField";
import {
  Dialog,
  DialogContent,
  DialogTitle,
  DialogActions,
  Button,
  CircularProgress,
} from "@mui/material";
import EnvioService from "src/service/enviosService";
import ClientesService from "src/service/clientesService";
import { useAuth } from "src/contexts/AuthContext";
import { Box } from "@mui/system";
import { Typography } from "@mui/material";
import AddIcon from '@mui/icons-material/Add';
import DeleteIcon from '@mui/icons-material/Delete';
import IconButton from '@mui/material/IconButton';

const AgregarEnvioDialog = ({ open, onClose, onEnvioAdded }) => {
  const authContext = useAuth();
  const enviosService = new EnvioService(authContext);
  const clientesService = new ClientesService(authContext);

  const [newEnvio, setNewEnvio] = useState({
    numeroFactura: "",
    idCliente: "",
    idZona: "",
    direccionEnvio: "",
    entreCalles: "",
    ultimosDigitosTarjeta: "",
    detalleEnvio: [""],
  });

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
      return data; // Retorna la data en lugar de hacer setClientes
    } catch (error) {
      console.error("Error al obtener clientes:", error);
      return [];
    }
  };

  const filtrarPorTipoDocumento = (tipoDocumento) => {
    const clientesFiltrados = clientes.filter((cliente) => {
      const valorAtributo = cliente.tipoDocumento.toLowerCase();
      const tipoDocumentoLowerCase = tipoDocumento.toLowerCase();
      return valorAtributo.includes(tipoDocumentoLowerCase);
    });
    setClientesFiltrados(clientesFiltrados);
    setClienteSeleccionado({idCliente: "",
    tipoDocumento: "",
    numeroDocumento: "",
    nombre: "",
    apellido: "",});
  };

  //Logica de zona
  const handleZonaChange = (event) => {
    setNewEnvio({ ...newEnvio, idZona: event.target.value });
  };

  // Agregar un nuevo detalle de envío
  const agregarDetalleEnvio = () => {
    setNewEnvio({ ...newEnvio, detalleEnvio: [...newEnvio.detalleEnvio, ""] });
  };

  const eliminarDetalleEnvio = (index) => {
    const updatedDetalles = newEnvio.detalleEnvio.filter((_, i) => i !== index);
    setNewEnvio({ ...newEnvio, detalleEnvio: updatedDetalles });
  };

  // Manejar el cambio en los detalles de envío
  const handleDetalleEnvioChange = (index, value) => {
    const updatedDetalles = newEnvio.detalleEnvio.map((detalle, i) => {
      if (i === index) {
        return value;
      }
      return detalle;
    });
    setNewEnvio({ ...newEnvio, detalleEnvio: updatedDetalles });
  };

    // Esto sirve para los manejos de cambios globales
    const handleChange = (event) => {
      setNewEnvio({ ...newEnvio, [event.target.name]: event.target.value });
    };

      // Manejo de cambios de la tarjeta con 4 digitos
  const handleUltimosDigitosTarjetaChange = (event) => {
    const value = event.target.value;
    // Expresion regular para que sean 4 ni mas ni menos
    if (value === '' || (value.match(/^\d+$/) && value.length <= 4)) {
      setNewEnvio({ ...newEnvio, ultimosDigitosTarjeta: value });
    }
  };

    // Validar el campo de los últimos dígitos de la tarjeta
    const validarUltimosDigitosTarjeta = () => {
      return newEnvio.ultimosDigitosTarjeta.length === 4;
    };

    //vERIFICACION DEL FORMULARIO CARGADO COMPLETO VER POR LAS DUDAS QUE QUEDE BIEN
    const esFormularioValido = () => {
      return (
        newEnvio.numeroFactura.trim() &&
        newEnvio.idCliente &&
        newEnvio.idZona.trim() &&
        newEnvio.direccionEnvio.trim() &&
        newEnvio.entreCalles.trim() &&
        validarUltimosDigitosTarjeta() &&
        newEnvio.detalleEnvio.every(detalle => detalle.trim())
      );
    };
    

    const handleClienteSeleccionadoChange = (event) => {
      const cliente = event.target.value;
      setClienteSeleccionado(cliente);
      setNewEnvio({ ...newEnvio, idCliente: cliente.idCliente });
    };
    
  
    const handleOnEnvioAdded = async () => {
      if (esFormularioValido()) {
        try {
          // Construir el objeto envio de acuerdo con la estructura esperada por la API
          const envioParaEnviar = {
            ...newEnvio,
            idCliente: parseInt(newEnvio.idCliente),
            idZona: parseInt(newEnvio.idZona),
            detalleEnvio: newEnvio.detalleEnvio.map(nombre => ({ nombre })),
            ultimosDigitosTarjeta: newEnvio.ultimosDigitosTarjeta // Asumiendo que este campo es un string
          };
    
          await enviosService.create(envioParaEnviar);
          alert("Envío agregado exitosamente");
          onClose();
          if (typeof onEnvioAdded === 'function') {
            onEnvioAdded();
          }
        } catch (error) {
          // Mostrar el mensaje de error en un alert
          alert(error.message);
        }
      } else {
        alert("Por favor, completa todos los campos.");
      }
    };
    
    
    
    

//   useEffect(() => {
//     alert(JSON.stringify(clienteSeleccionado, null, 2))

//   }
//     , [clienteSeleccionado]);
useEffect(() => {
  // Restablecer el estado cuando se cierre el diálogo
  if (!open) {
    setNewEnvio({
      numeroFactura: "",
      idCliente: "",
      idZona: "",
      direccionEnvio: "",
      entreCalles: "",
      ultimosDigitosTarjeta: "",
      detalleEnvio: [""],
    });
  }
}, [open]);


  useEffect(() => {
    const fetchData = async () => {
      setLoading(true); // Inicia la carga
  
      // Espera a que fetchClientes complete y obtiene la data
      const data = await fetchClientes();
  
      setClientes(data); // Actualiza la lista completa de clientes
      filtrarPorTipoDocumento(tipoDocumentoFiltro, data); // Filtra con la data completa
  
      setLoading(false); // Finaliza la carga
    };
  
    fetchData(); // Llama a la función interna
  }, [open]);

  // Mostrar la rueda de carga mientras se están recuperando los datos
  if (loading) {
    return (
      <Dialog open={open} onClose={onClose}>
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
    <Dialog open={open} onClose={onClose} maxWidth="md" fullWidth>
      <DialogTitle>Agregar Envio</DialogTitle>
      {/** NRO FACTURA */}
      <DialogContent sx={{ height: "100%", display: "flex", flexDirection: "column" }}>
        <TextField
            autoFocus
            margin="dense"
            id="numeroFactura"
            label="Nro Factura"
            type="text"
            fullWidth
            required
            name="numeroFactura"
            value={newEnvio.numeroFactura}
            onChange={handleChange}
          />
        <Typography>Cliente</Typography>
        <Box display="flex" flexDirection="row" maxHeight={"70px"}>
          <FormControl sx={{ m: 1, minWidth: 150 }} size="medium">
            <InputLabel id="demo-simple-select-standard-label">TipoDocumento</InputLabel>
            <Select
              variant="standard"
              labelId="demo-select-medium-label"
              id="tipoDocumento"
              name="idTipoDocumento"
              value={tipoDocumentoFiltro}
              label="tipoDocumento"
              onChange={(e) => {
                setTipoDocumentoFiltro(e.target.value);
                filtrarPorTipoDocumento(e.target.value);
              }}
            >
              <MenuItem value={"DNI"}>DNI</MenuItem>
              <MenuItem value={"CUIT"}>CUIT</MenuItem>
              <MenuItem value={"CUIL"}>CUIL</MenuItem>
            </Select>
          </FormControl>
          <FormControl sx={{ m: 1, minWidth: 200 }} size="medium">
            <InputLabel id="demo-simple-select-standard-label">Numero Documento</InputLabel>
            <Select
              variant="standard"
              labelId="demo-select-medium-label"
              //id="numeroDocumento"
              value={clienteSeleccionado}
              onChange={handleClienteSeleccionadoChange}
            >
              {clientesFiltrados.map((cliente) => (
                <MenuItem key={cliente.id} value={cliente}>
                  {cliente.numeroDocumento}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
          {/** NOMBRE y apellido */}
          <TextField
            margin="dense"
            id="nombre"
            label="Nombre"
            type="text"
            fullWidth
            name="nombre"
            value={clienteSeleccionado.nombre + " " + clienteSeleccionado.apellido}
            onChange={""}
          />
          <Button variant="contained" color="info" onClick={() => {}}>
            Agregar Cliente
          </Button>
        </Box>
        {/* Seleccionar Zona */}
        <FormControl fullWidth margin="dense">
          <InputLabel id="zona-label">Zona</InputLabel>
          <Select
            labelId="zona-label"
            id="zona"
            value={newEnvio.idZona}
            label="Zona"
            onChange={handleZonaChange}
          >
            <MenuItem value={"1"}>1</MenuItem>
            <MenuItem value={"2"}>2</MenuItem>
            <MenuItem value={"3"}>3</MenuItem>
            <MenuItem value={"4"}>4</MenuItem>
          </Select>
        </FormControl>
        {/* Detalles de Envío */}
        <Typography marginY={2}>Detalles del Envío:</Typography>
        {newEnvio.detalleEnvio.map((detalle, index) => (
          <Box key={index} display="flex" alignItems="center">
            <TextField
              margin="dense"
              label={`Detalle ${index + 1}`}
              type="text"
              fullWidth
              value={detalle}
              onChange={(e) => handleDetalleEnvioChange(index, e.target.value)}
            />
            {index > 0 && (
              <IconButton onClick={() => eliminarDetalleEnvio(index)}>
                <DeleteIcon />
              </IconButton>
            )}
          </Box>
        ))}
        <Button startIcon={<AddIcon />} onClick={agregarDetalleEnvio}>
          Agregar Detalle
        </Button>
          {/* Dirección de Envío y Entre Calles */}
          <Box display="flex" flexDirection="row" alignItems="center" marginY={2}>
          <TextField
            margin="dense"
            label="Dirección de Envío"
            type="text"
            fullWidth
            required
            name="direccionEnvio"
            value={newEnvio.direccionEnvio}
            onChange={handleChange}
            sx={{ marginRight: 2 }}
          />
          <TextField
            margin="dense"
            label="Entre Calles"
            type="text"
            fullWidth
            required
            name="entreCalles"
            value={newEnvio.entreCalles}
            onChange={handleChange}
          />
        </Box>
        {/* Últimos Dígitos de la Tarjeta */}
        <TextField
          margin="dense"
          label="Últimos Dígitos de la Tarjeta"
          type="text"
          fullWidth
          required
          error={!validarUltimosDigitosTarjeta() && newEnvio.ultimosDigitosTarjeta.length > 0}
          helperText={!validarUltimosDigitosTarjeta() && newEnvio.ultimosDigitosTarjeta.length > 0 ? "Debe tener exactamente 4 dígitos" : ""}
          name="ultimosDigitosTarjeta"
          value={newEnvio.ultimosDigitosTarjeta}
          onChange={handleUltimosDigitosTarjetaChange}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose}>Cancelar</Button>
        <Button onClick={handleOnEnvioAdded} disabled={!esFormularioValido()}>Agregar</Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarEnvioDialog;
