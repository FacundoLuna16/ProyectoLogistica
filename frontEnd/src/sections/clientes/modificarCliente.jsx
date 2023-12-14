// ModificarClienteDialog.jsx
import React, { useState } from 'react';
import { Dialog, DialogContent, DialogTitle, TextField, DialogActions, Button } from '@mui/material';
import ClientesService from "src/service/clientesService";

const ModificarClienteDialog = ({ open, onClose }) => {
  const [id, setId] = useState('');
  const [tipoDoc, setTipoDoc] = useState('');
  const [nroDoc, setNroDoc] = useState('');
  const [nombre, setNombre] = useState('');
  const [apellido, setApellido] = useState('');
  const [direccion, setDireccion] = useState('');
  const [nroTelefono, setNroTelefono] = useState('');
  const [nroTelefonoAlternativo, setNroTelefonoAlternativo] = useState('');
  const [mail, setMail] = useState('');
  const [cargando, setCargando] = useState(false);

  const buscarClientePorId = async () => {
    setCargando(true);
    try {
      const cliente = await ClientesService.getById(id);
      setTipoDoc(cliente.tipoDoc);
      setNroDoc(cliente.nroDoc);
      setNombre(cliente.nombre);
      setApellido(cliente.apellido);
      setDireccion(cliente.direccion);
      setNroTelefono(cliente.nroTelefono);
      setNroTelefonoAlternativo(cliente.nroTelefonoAlternativo);
      setMail(cliente.mail);
    } catch (error) {
      console.error('Error al buscar cliente:', error);
    } finally {
      setCargando(false);
    }
  };

  const handleModificar = async () => {
    try {
      await ClientesService.update(id, {
        tipoDoc,
        nroDoc,
        nombre,
        apellido,
        direccion,
        nroTelefono,
        nroTelefonoAlternativo,
        mail
      });
      onClose(); // Cierra el modal después de la actualización
    } catch (error) {
      console.error('Error al modificar cliente:', error);
    }
  };

  return (
    <Dialog open={open} onClose={onClose}>
      <DialogTitle>Modificar Cliente</DialogTitle>
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="id"
          label="ID del Cliente"
          type="text"
          fullWidth
          value={id}
          onChange={(e) => setId(e.target.value)}
          disabled={cargando}
        />
        <Button onClick={buscarClientePorId} disabled={!id || cargando}>Cargar Cliente</Button>
        <TextField
          margin="dense"
          id="tipoDoc"
          label="Tipo de Documento"
          type="text"
          fullWidth
          value={tipoDoc}
          onChange={(e) => setTipoDoc(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="nroDoc"
          label="Número de Documento"
          type="text"
          fullWidth
          value={nroDoc}
          onChange={(e) => setNroDoc(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="nombre"
          label="Nombre"
          type="text"
          fullWidth
          value={nombre}
          onChange={(e) => setNombre(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="apellido"
          label="Apellido"
          type="text"
          fullWidth
          value={apellido}
          onChange={(e) => setApellido(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="direccion"
          label="Dirección"
          type="text"
          fullWidth
          value={direccion}
          onChange={(e) => setDireccion(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="nroTelefono"
          label="Número de Teléfono"
          type="text"
          fullWidth
          value={nroTelefono}
          onChange={(e) => setNroTelefono(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="nroTelefonoAlternativo"
          label="Número de Teléfono Alternativo"
          type="text"
          fullWidth
          value={nroTelefonoAlternativo}
          onChange={(e) => setNroTelefonoAlternativo(e.target.value)}
          disabled={!id || cargando}
        />
        <TextField
          margin="dense"
          id="mail"
          label="Correo Electrónico"
          type="email"
          fullWidth
          value={mail}
          onChange={(e) => setMail(e.target.value)}
          disabled={!id || cargando}
        />
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="primary">Cancelar</Button>
        <Button onClick={handleModificar} color="primary" disabled={!id || !tipoDoc || !nroDoc || !nombre || !apellido || !direccion || !nroTelefono || !mail || cargando}>Modificar</Button>
      </DialogActions>
    </Dialog>
  );
};

export default ModificarClienteDialog;
