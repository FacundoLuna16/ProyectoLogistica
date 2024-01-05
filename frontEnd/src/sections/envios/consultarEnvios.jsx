import React from "react";
import {
  Dialog,
  Typography,
  Box,
  TableRow,
  TableContainer,
  TableCell,
  Table,
  TableBody,

  Accordion,
  AccordionSummary,
  AccordionDetails,
  FormControl,
  TableHead,
  DialogContent,
  DialogTitle,
  InputLabel,
  Select,
  MenuItem,
  TextField,
  DialogActions,
  Button,
} from "@mui/material";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import { Scrollbar } from "src/components/scrollbar";
import { createTheme, ThemeProvider } from '@mui/material/styles';

const theme = createTheme({
  typography: {
    fontSize: 13, // Tamaño de fuente general
  },
});


const getColorForEstado = (estado) => {
  switch (estado) {
    case "Pendiente":
      return "warning";
    case "EnCamino":
      return "info";
    default:
      return "success";
  }
};

const ConsultarEnvioDialog = ({ open, onClose, envio }) => {
  // Verifica si el envío es falsy (undefined o vacío)
  if (!envio || !envio.numeroFactura) {
    return null; // No renderizar el componente si el envío no está presente o es vacío
  }
  return (
    <ThemeProvider theme={theme}>
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
              value={envio.cliente.nombre + " " + envio.cliente.apellido}
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
            Dirección de Envio
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
          {/* Estado actual */}
          <Typography variant="subtitle1" gutterBottom>
            Estado Actual
          </Typography>
          <Box>
            <Button
              variant="contained"
              color={getColorForEstado(envio.estadoActual)}
              style={{
                width: "100%",
                textTransform: "none",
                boxShadow: "none",
                border: "none",
                cursor: "default",
                '&:hover': {
                  backgroundColor: "transparent",
                },
              }}
            >
              {envio.estadoActual}
            </Button>
            {/* <TextField
              margin="dense"
              id="estadoActual"
              color={getColorForEstado(envio.estadoActual)}
              label="Estado Actual"
              type="text"
              fullWidth
              value={envio.estadoActual}
              InputProps={{ readOnly: true }}
            /> */}
            {/* ULTIMOS DIGITOS */}
            {/* <TextField
              margin="dense"
              id="ultimosDigitos"
              label="Ultimos Digitos"
              type="text"
              fullWidth
              value={envio.ultimosDigitosTarjeta}
              InputProps={{ readOnly: true }}
            /> */}
          </Box>
          {/* <Scrollbar>
            <Box>
              <Typography variant="subtitle1" gutterBottom>
                Productos
              </Typography>
              <TableContainer sx={{ maxHeight: 150 }}>
                <Table>
                  <TableHead>
                    <TableRow>
                      <TableCell
                        align="center"
                        style={{ position: "sticky", top: 0, backgroundColor: "#fff", zIndex: 1 }}
                      >
                        Producto
                      </TableCell>
                      <TableCell
                        align="center"
                        style={{ position: "sticky", top: 0, backgroundColor: "#fff", zIndex: 1 }}
                      >
                        Cantidad
                      </TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {envio.detalleEnvio.map((detalle) => (
                      <TableRow key={detalle.id}>
                        <TableCell align="center">{detalle.nombre}</TableCell>
                        <TableCell align="center">{1}</TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </TableContainer>
            </Box>
          </Scrollbar> */}
          <Scrollbar>
            <Box>
              <Typography variant="subtitle1" gutterBottom>
                Historial del Envio
              </Typography>
              <TableContainer sx={{ maxHeight: 200 }}>
                <Table>
                  <TableHead>
                    <TableRow>
                      <TableCell align="center">Fecha Inicio</TableCell>
                      <TableCell align="center">Estado</TableCell>
                      <TableCell align="center">Fecha Fin</TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {envio.cambiosEstado.map((cambio) => (
                      <TableRow key={cambio.fechaInicio}>
                        <TableCell align="center">{cambio.fechaInicio}</TableCell>
                        <TableCell align="center">{cambio.estado}</TableCell>
                        <TableCell align="center">{cambio.fechaFin}</TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </TableContainer>
            </Box>
          </Scrollbar>
        </DialogContent>

        <DialogActions>
          <Button onClick={onClose}>Cerrar</Button>
        </DialogActions>
      </Dialog>
    </ThemeProvider>
  );
};

export default ConsultarEnvioDialog;
