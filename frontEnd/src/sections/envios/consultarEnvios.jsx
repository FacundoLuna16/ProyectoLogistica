import React from "react";
import propTypes from "prop-types";
import PropTypes from "prop-types";
import {
  Dialog,
  Typography,
  Box,
  TableRow,
  TableCell,
  Accordion,
    AccordionSummary,
    AccordionDetails,
    FormControl ,
  DialogContent,
  DialogTitle,
  InputLabel ,
  Select ,
  MenuItem ,
  TextField,
  DialogActions,
  Button,
} from "@mui/material";
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';

const ConsultarEnvioDialog = ({ open, onClose, envio }) => {
  // Verifica si el envío es falsy (undefined o vacío)
  if (!envio || !envio.numeroFactura) {
    return null; // No renderizar el componente si el envío no está presente o es vacío
  }
  return (
    <Dialog open={open} onClose={onClose} maxWidth="md" fullWidth>
      <DialogTitle>Datos del Envío</DialogTitle>
      <DialogContent>
        {/* Numero factura */}
        <TextField
          margin="dense"
          id="numeroFactura"
          label="Numero Factura"
          type="text"
          fullWidth
          value={envio.numeroFactura}
          InputProps={{ readOnly: true }}
        />
        {/* Cliente */}
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
            value={envio.cliente.nombre}
            InputProps={{ readOnly: true }}
          />
          <TextField
            margin="dense"
            id="tipoDocumento"
            label="Tipo Documento"
            type="text"
            fullWidth
            value={envio.cliente.tipoDocumento}
            InputProps={{ readOnly: true }}
          />
          <TextField
            margin="dense"
            id="numeroDocumento"
            label="Numero Documento"
            type="text"
            fullWidth
            value={envio.cliente.numeroDocumento}
            InputProps={{ readOnly: true }}
          />
        </Box>
        {/* Direccion, entreCalles y zona*/}
        <Typography variant="subtitle1" gutterBottom>
          Dirección
        </Typography>
        <Box display="flex" flexDirection="row" sx={{ mb: 2 }}>
          <TextField
            margin="dense"
            id="direccion"
            label="Dirección"
            type="text"
            fullWidth
            value={envio.direccionEnvio}
            InputProps={{ readOnly: true }}
          />
          <TextField
            margin="dense"
            id="entreCalles"
            label="Entre Calles"
            type="text"
            fullWidth
            value={envio.entreCalles}
            InputProps={{ readOnly: true }}
          />
          <TextField
            margin="dense"
            id="zona"
            label="Zona"
            type="text"
            fullWidth
            value={envio.zona}
            InputProps={{ readOnly: true }}
          />
        </Box>
        {/* Detalles pueden ser de cantidad variable, hacer un desplegable con map para manejar la cantidad necesaria*/}
        <Box display="flex" flexDirection="column" sx={{ mb: 2 }}>
          <Accordion>
            <AccordionSummary
            expandIcon={<ExpandMoreIcon />}
            >
              <Typography>Productos</Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Box display="flex" flexDirection="column" sx={{ mb: 2 }}>
                    {envio.detalleEnvio.map((detalle) => (
                        <Typography>{detalle.nombre}</Typography>
                    ))}
                </Box>

            </AccordionDetails>
          </Accordion>
        </Box>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose}>Cerrar</Button>
      </DialogActions>
    </Dialog>
  );
};

ConsultarEnvioDialog.propTypes = {
  envio: PropTypes.shape({
    numeroFactura: PropTypes.string.isRequired,
    cliente: PropTypes.shape({
      idCliente: PropTypes.number.isRequired,
      tipoDocumento: PropTypes.string.isRequired,
      numeroDocumento: PropTypes.string.isRequired,
      nombre: PropTypes.string.isRequired,
      apellido: PropTypes.string.isRequired,
    }).isRequired,
    zona: PropTypes.string.isRequired,
    detalleEnvio: PropTypes.arrayOf(
      PropTypes.shape({
        id: PropTypes.number.isRequired,
        nombre: PropTypes.string.isRequired,
      })
    ).isRequired,
    direccionEnvio: PropTypes.string.isRequired,
    entreCalles: PropTypes.string.isRequired,
    cambiosEstado: PropTypes.arrayOf(
      PropTypes.shape({
        estado: PropTypes.string.isRequired,
        fechaInicio: PropTypes.string.isRequired,
        fechaFin: PropTypes.string, // Puede ser nulo
      })
    ).isRequired,
    estadoActual: PropTypes.string.isRequired,
    ultimosDigitosTarjeta: PropTypes.string.isRequired,
  }).isRequired,
};
export default ConsultarEnvioDialog;
