import React, { use, useEffect, useState } from "react";
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
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { styled } from "@mui/system";
import EnvioService from "src/service/enviosService";
import { useAuth } from "src/contexts/AuthContext";
import CircularProgress from "@mui/material/CircularProgress";


const LargeImageDialog = styled(DialogContent)({
  textAlign: "center",
});

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
  const authContext = useAuth();
  const enviosService = new EnvioService(authContext);
  const [showLargeImage, setShowLargeImage] = useState(false);
  const [tipoEnvio, setTipoEnvio] = useState("");
  const [imagen, setImagen] = useState(null);
  const [loadingImagen, setLoadingImagen] = useState(false);

  const getImagen = async () => {
    try {
      setLoadingImagen(true);
      const imagen = await enviosService.obtenerImagen(envio.numeroFactura);
      setImagen(imagen);
    } catch (error) {
      console.error("Error al obtener la imagen:", error);
    } finally {
      setLoadingImagen(false);
    }
  };

  const handleVerImagen = () => {
    handleShowLargeImage();
    getImagen();
  };

  const handleShowLargeImage = () => {
    setShowLargeImage(true);
  };

  const handleCloseLargeImage = () => {
    setShowLargeImage(false);
  };

  useEffect(() => {
    switch (envio.tipoEnvio) {
      case 1:
        setTipoEnvio("Web");
        break;
      case 2:
        setTipoEnvio("Salsep");
        break;
      case 3:
        setTipoEnvio("Empresa");
        break;
      default:
        break;
    }
    setImagen(null);
  }, [envio]);

  const handleDownloadImage = () => {
    const link = document.createElement("a");
    link.href = imagen;
    //setea el link.download para que el archivo se descargue con el nombre DEL NUMERO DE FACTURA .jpg
    link.download = envio.numeroFactura + ".jpg";
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  };

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
          <Box sx={{ display: "flex", flexDirection: "row", gap: 2 }}>
            <TextField
              margin="dense"
              id="numeroFactura"
              label="Numero Factura"
              type="text"
              fullWidth
              value={envio.numeroFactura}
              InputProps={{ readOnly: true }}
            />
            {/* Tipo de envio */}
            <TextField
              margin="dense"
              id="tipoEnvio"
              label="Tipo de Envío"
              type="text"
              fullWidth
              value={tipoEnvio}
              InputProps={{ readOnly: true }}
            />
          </Box>

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
                "&:hover": {
                  backgroundColor: "transparent",
                },
              }}
            >
              {envio.estadoActual}
            </Button>
          </Box>
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
          {/* Motivo */}
          {envio.descripcion && (
            <Box>
              <TextField
                id="motivo"
                label="Motivo"
                variant="outlined"
                fullWidth
                value={envio.descripcion}
                multiline
                rows={4}
                sx={{ mb: 3 }}
                InputProps={{ readOnly: true }}
              />
            </Box>
          )}
        </DialogContent>

        <DialogActions>
          <Button onClick={onClose}>Cerrar</Button>
          <Button onClick={handleVerImagen}>Ver Imagen</Button>
        </DialogActions>
      </Dialog>

      {/* Agrega un nuevo Dialog para la imagen en grande */}
      <Dialog open={showLargeImage} onClose={handleCloseLargeImage} maxWidth="md" fullWidth>
        <DialogTitle>Imagen en Grande</DialogTitle>
        <LargeImageDialog>
          {/* Condición para mostrar la imagen, spinner o un mensaje */}
          {loadingImagen ? (
            <Box sx={{ display: "flex", justifyContent: "center" }}>
              <CircularProgress />
            </Box>
          ) : imagen ? (
            <div>
              <img src={imagen} alt="Imagen en grande" style={{ maxWidth: "100%" }} />
              <Button
                variant="contained"
                color="primary"
                onClick={handleDownloadImage}
                style={{ marginTop: "10px" }}
              >
                Descargar Imagen
              </Button>
            </div>
          ) : (
            <p>No hay una foto cargada para este envío.</p>
          )}
        </LargeImageDialog>
        <DialogActions>
          <Button onClick={handleCloseLargeImage}>Cerrar</Button>
        </DialogActions>
      </Dialog>
    </ThemeProvider>
  );
};

export default ConsultarEnvioDialog;
