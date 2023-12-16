import React, { useState, useEffect} from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import clienteService from 'src/service/clientesService';
import InputLabel from '@mui/material/InputLabel';
import MenuItem from '@mui/material/MenuItem';
import FormControl from '@mui/material/FormControl';
import Select, { SelectChangeEvent } from '@mui/material/Select';



const ModificarClienteDialog = ({ open, onClose, cliente, refrescar}) => {
  const [idCliente, setIdCliente] = useState(''); 
  const [tipoDocumento, setTipoDocumento] = useState('');
  const [numeroDocumento, setNumeroDocumento] = useState('');
  const [nombre, setNombre] = useState('');
  const [apellido, setApellido] = useState('');
  const [direccion, setDireccion] = useState('');
  const [numeroTelefono, setNumeroTelefono] = useState('');
  const [numeroTelefonoAlternativo, setNumeroTelefonoAlternativo] = useState('');
  const [email, setEmail] = useState('');



  useEffect(() => {
    setIdCliente(cliente.idCliente || '');
    setTipoDocumento(cliente.tipoDocumento || '');
    setNumeroDocumento(cliente.numeroDocumento || '');
    setNombre(cliente.nombre || '');
    setApellido(cliente.apellido || '');
    setDireccion(cliente.direccion || '');
    setNumeroTelefono(cliente.numeroTelefono || '');
    setNumeroTelefonoAlternativo(cliente.numeroTelefonoAlternativo || '');
    setEmail(cliente.email || '');

  }, [cliente]);

  const handleCancelar = () => {
    onClose();

    // Restaurar los valores originales
    setIdCliente(cliente.idCliente || '');
    setTipoDocumento(cliente.tipoDocumento || '');
    setNumeroDocumento(cliente.numeroDocumento || '');
    setNombre(cliente.nombre || '');
    setApellido(cliente.apellido || '');
    setDireccion(cliente.direccion || '');
    setNumeroTelefono(cliente.numeroTelefono || '');
    setNumeroTelefonoAlternativo(cliente.numeroTelefonoAlternativo || '');
    setEmail(cliente.email || '');
  };

  const tipoDocumentoMapping = {
    'DNI': 1,
    'CUIT': 2,
    'CUIL': 3,
  };

  const handleModificar = async () => {
    try {
      tipoDocumentoParam = tipoDocumentoMapping[tipoDocumento.toUpperCase()]//pushea k
      const clienteActualizado = await clienteService.update(idCliente, {
        tipoDocumentoParam,
        numeroDocumento,
        nombre,
        apellido,
        direccion,
        numeroTelefono,
        numeroTelefonoAlternativo,
        email,
      }); 
      alert('Cliente modificado correctamente');
      onClose();
      refrescar();
    } catch (error) {
      alert(error.response.data);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Cliente</DialogTitle>
      <DialogContent>
        {/* <FormControl sx={{ m: 1, minWidth: 120 }} size="medium">
          <InputLabel id="demo-simple-select-standard-label">TipoDocumento</InputLabel>
          <Select
            variant="standard"
            labelId="demo-select-medium-label"
            id="demo-select-medium"
            value={tipoDocumento.toUpperCase()}
            label="tipoDocumento"
            onChange={(e) => setTipoDocumento(e.target.value)}
          >
            <MenuItem value="DNI">DNI</MenuItem>
            <MenuItem value="CUIT">CUIT</MenuItem>
            <MenuItem value="CUIL">CUIL</MenuItem>
          </Select>
        </FormControl> */}
        <TextField
          disabled
          margin="dense"
          id="tipoDocumento"
          label="tipoDocumento"
          type="text"
          fullWidth
          value={tipoDocumento.toUpperCase()}
          InputProps={{ readOnly: true }}
        />
        <TextField
          disabled
          margin="dense"
          id="numeroDocumento"
          label="nroDocumento"
          type="text"
          fullWidth
          value={numeroDocumento}
          InputProps={{ readOnly: true }}
        />
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre"
          type="text"
          fullWidth
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido"
          type="text"
          fullWidth
          value={apellido}
          onChange={(e) => setApellido(e.target.value)}
        />

        <TextField
          margin="dense"
          id="direccion"
          label="Direccion"
          type="text"
          fullWidth
          value={direccion}
          onChange={(e) => setDireccion(e.target.value)}
        />
        <TextField
          margin="dense"
          id="numeroTelefono"
          label="NumeroTelefono"
          type="text"
          fullWidth
          value={numeroTelefono}
          onChange={(e) => setNumeroTelefono(e.target.value)}
        />
        <TextField
          margin="dense"
          id="numeroTelefonoAlternativo"
          label="NumeroTelefonoAlternativo"
          type="text"
          fullWidth
          value={numeroTelefonoAlternativo}
          onChange={(e) => setNumeroTelefonoAlternativo(e.target.value)}
        />
        <TextField
          margin="dense"
          id="email"
          label="Email"
          type="text"
          fullWidth
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />
        

        {/* Agregar más campos según sea necesario */}
      </DialogContent>
      <DialogActions>
        <Button onClick={handleCancelar} color="primary">
          Cancelar
        </Button>
        <Button onClick={handleModificar} color="primary">
          Modificar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarClienteDialog;