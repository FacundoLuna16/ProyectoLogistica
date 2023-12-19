import React, { useState, useEffect } from 'react';
import { Dialog,Typography,FormControl,InputLabel,MenuItem,Select, DialogContent, DialogTitle, TextField, DialogActions, Button, Box } from '@mui/material';

const ModificarEnvioDialog = ({ open, onClose, envio, refrescar }) => {
    const [numeroFactura, setNumeroFactura] = useState('');
    const [cliente, setCliente] = useState({});
    const [zona, setZona] = useState('');
    const [detalleEnvio, setDetalleEnvio] = useState([]);
    const [direccionEnvio, setDireccionEnvio] = useState('');
    const [entreCalles, setEntreCalles] = useState('');
    const [cambiosEstado, setCambiosEstado] = useState([]);
    const [estadoActual, setEstadoActual] = useState('');
    const [ultimosDigitosTarjeta, setUltimosDigitosTarjeta] = useState('');

    useEffect(() => {
        setNumeroFactura(envio.numeroFactura || '');
        setCliente(envio.cliente || {});
        setZona(envio.zona || '');
        setDetalleEnvio(envio.detalleEnvio || []);
        setDireccionEnvio(envio.direccionEnvio || '');
        setEntreCalles(envio.entreCalles || '');
        setCambiosEstado(envio.cambiosEstado || []);
        setEstadoActual(envio.estadoActual || '');
        setUltimosDigitosTarjeta(envio.ultimosDigitosTarjeta || '');
    }, [envio,onClose]);

    const handleCancelar = () => {
        onClose();
    };


    const handleModificar = async () => {
        try {

            await enviosService.update(numeroFactura,{
                idCliente : cliente.idCliente,
                zona,
                direccionEnvio,
                entreCalles,
                ultimosDigitosTarjeta,
            });
            alert("Envio modificado con exito");
            refrescar();
            onClose();
        } catch (error) {
            alert(error.response);
        }
    }
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
              id="demo-select-medium"
              value={zona}
              label="zona"
              onChange={(e) => setZona(e.target.value)}
            >
                //1 2 3 4
                <MenuItem value="1">1</MenuItem>
                <MenuItem value="2">2</MenuItem>
                <MenuItem value="3">3</MenuItem>
                <MenuItem value="4">4</MenuItem>
            </Select>
            </FormControl>
            <TextField
                margin="dense"
                id="direccionEnvio"
                label="Direccion de envio"
                type="text"
                fullWidth
                value={direccionEnvio}
                onChange={(e) => setDireccionEnvio(e.target.value)}
            />
            <TextField
                margin="dense"
                id="entreCalles"
                label="Entre calles"
                type="text"
                fullWidth
                value={entreCalles}
                onChange={(e) => setEntreCalles(e.target.value)}
            />
            <TextField
                margin="dense"
                id="ultimosDigitosTarjeta"
                label="Ultimos digitos tarjeta"
                type="text"
                fullWidth
                value={ultimosDigitosTarjeta}
                onChange={(e) => setUltimosDigitosTarjeta(e.target.value)}
            />

          {/* Puedes seguir agregando más campos de esta manera */}
        </DialogContent>
        <DialogActions>
          <Button onClick={handleCancelar}>Cancelar</Button>
          <Button onClick={handleModificar}>Modificar</Button>
        </DialogActions>
      </Dialog>
    );
};

export default ModificarEnvioDialog;
