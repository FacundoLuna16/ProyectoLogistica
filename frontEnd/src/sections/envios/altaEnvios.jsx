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
    detalleEnvio: [],
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

//   useEffect(() => {
//     alert(JSON.stringify(clienteSeleccionado, null, 2))

//   }
//     , [clienteSeleccionado]);

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
          value={""}
          onChange={""}
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
              //label="numeroDocumento"
              onChange={(e) => {
                setClienteSeleccionado(e.target.value);
              }}
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
      </DialogContent>

      <DialogActions>
        <Button onClick={onClose}>Cancelar</Button>
        <Button onClick={onEnvioAdded}>Agregar</Button>
      </DialogActions>
    </Dialog>
  );
};

export default AgregarEnvioDialog;
