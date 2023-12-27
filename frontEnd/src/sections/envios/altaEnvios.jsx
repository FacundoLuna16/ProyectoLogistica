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
import AgregarClienteDialog from "src/sections/clientes/altaClientes";

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
    
    // Logica boton agregar cliente
    const [openAgregarCliente, setOpenAgregarCliente] = useState(false);


    const handleOpenAgregarCliente = () => {
      setOpenAgregarCliente(true);
    };
  
    const handleCloseAgregarCliente = () => {
      setOpenAgregarCliente(false);
    };
  
    const handleClienteAdded = () => {
      // Actualiza la lista de clientes
      fetchClientes();
      // Cierra el diálogo de agregar cliente
      handleCloseAgregarCliente();
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
      <DialogTitle>Agregar Envío</DialogTitle>
      <DialogContent sx={{ '& .MuiFormControl-root': { m: 1 }, '& .MuiTextField-root': { m: 1 }, overflowY: 'auto' }}>
        <Box sx={{ display: "flex", flexDirection: "column", gap: 2 }}>
          <TextField
            autoFocus
            id="numeroFactura"
            label="Nro Factura"
            type="text"
            fullWidth
            required
            name="numeroFactura"
            value={newEnvio.numeroFactura}
            onChange={handleChange}
            size="small"
          />
          <Typography variant="subtitle1" gutterBottom>Cliente</Typography>
          <Box display="flex" flexDirection={{ xs: 'column', sm: 'row' }} alignItems="center" gap={2}>
  <Box flex={1}>
    <FormControl fullWidth>
      <InputLabel id="tipoDocumento-label">TipoDocumento</InputLabel>
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
    <FormControl fullWidth>
      <InputLabel id="numeroDocumento-label">Numero Documento</InputLabel>
      <Select
        labelId="numeroDocumento-label"
        id="numeroDocumento"
        value={clienteSeleccionado}
        onChange={handleClienteSeleccionadoChange}
        size="small"
      >
        {clientesFiltrados.map((cliente) => (
          <MenuItem key={cliente.id} value={cliente}>
            {cliente.numeroDocumento}
          </MenuItem>
        ))}
      </Select>
    </FormControl>
  </Box>
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
          sx={{ whiteSpace: 'nowrap', width: '100%' }}
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
            >
              <MenuItem value={"1"}>1</MenuItem>
              <MenuItem value={"2"}>2</MenuItem>
              <MenuItem value={"3"}>3</MenuItem>
              <MenuItem value={"4"}>4</MenuItem>
            </Select>
          </FormControl>
          <Typography variant="subtitle1" gutterBottom>Detalles del Envío:</Typography>
          {newEnvio.detalleEnvio.map((detalle, index) => (
            <Box key={index} display="flex" alignItems="center" gap={1}>
              <TextField
                label={`Detalle ${index + 1}`}
                type="text"
                fullWidth
                value={detalle}
                onChange={(e) => handleDetalleEnvioChange(index, e.target.value)}
                size="small"
              />
              {index > 0 && (
                <IconButton onClick={() => eliminarDetalleEnvio(index)}>
                  <DeleteIcon />
                </IconButton>
              )}
            </Box>
          ))}
          <Button startIcon={<AddIcon />} onClick={agregarDetalleEnvio} size="small">
            Agregar Detalle
          </Button>
          <Box display="flex" flexDirection={{ xs: 'column', sm: 'row' }} gap={2}>
            <TextField
              label="Dirección de Envío"
              type="text"
              fullWidth
              required
              name="direccionEnvio"
              value={newEnvio.direccionEnvio}
              onChange={handleChange}
              size="small"
            />
            <TextField
              label="Entre Calles"
              type="text"
              fullWidth
              required
              name="entreCalles"
              value={newEnvio.entreCalles}
              onChange={handleChange}
              size="small"
            />
          </Box>
          <TextField
            label="Últimos Dígitos de la Tarjeta"
            type="text"
            fullWidth
            required
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
        <Button onClick={onClose} color="inherit">Cancelar</Button>
        <Button onClick={handleOnEnvioAdded} 
                color="primary" 
                variant="contained" 
                disabled={!esFormularioValido() || loading}
        >
          Agregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarEnvioDialog;
