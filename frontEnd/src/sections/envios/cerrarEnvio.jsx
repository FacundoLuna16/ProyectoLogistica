import React, { useEffect, useState } from "react";
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
import EnvioService from "src/service/enviosService";
import { useAuth } from "src/contexts/AuthContext";

const EntregaIndividualDialog = ({ open, onClose, envio, refrescar}) => {
  const authContext = useAuth();
  const enviosService = new EnvioService(authContext);
  const [motivo, setMotivo] = useState("");

  const handleCerrarEnvio =  async () => {
    try {
        //alert("Cerrando envio" + envio.numeroFactura + " con motivo: " + motivo);
        await enviosService.cerrarEnvio(envio.numeroFactura, motivo);
        refrescar();
        alert("Envio cerrado con exito");
        onClose();
    }
    catch (error) {
        alert(error.response.data);
    }
    };

    useEffect(() => {
        setMotivo("");
    }
    , [open]);

  return (
    <Dialog open={open} onClose={onClose} maxWidth="sm" fullWidth scroll="paper">
      <DialogTitle>
        <Typography variant="h4" sx={{ mb: 3 }}>
          Realizar entrega individual
        </Typography>
      </DialogTitle>
      <DialogContent>
        {/* Informacion del envio, numeroFactura */}
        <Box sx={{ mb: 3 }}>
          <Typography variant="h6" sx={{ mb: 2 }}>
            Informacion del Envio
          </Typography>
          <TableContainer>
            <Table>
              <TableBody>
                {/* mapea los atributos numeroFactura,Cliente(nombre apellido y numeroDocumento) , ESTADOACTUAL */}
                <TableRow>
                  <TableCell>
                    <Typography variant="subtitle1" gutterBottom>
                      Numero Factura
                    </Typography>
                  </TableCell>
                  <TableCell>
                    <Typography variant="body2" gutterBottom>
                      {envio.numeroFactura}
                    </Typography>
                  </TableCell>
                </TableRow>
                <TableRow>
                    <TableCell>
                        <Typography variant="subtitle1" gutterBottom>
                            Estado Actual
                        </Typography>
                    </TableCell>
                    <TableCell>
                        <Typography variant="body2" gutterBottom>
                            {envio.estadoActual}
                        </Typography>
                    </TableCell>
                </TableRow>


              </TableBody>
            </Table>
          </TableContainer>
        </Box>
        {/* Agrega un espacio para añadir un motivo en texto */}
        <Box>
          <TextField
            id="motivo"
            label="Motivo*"
            variant="outlined"
            fullWidth
            onLostPointerCapture={() => setMotivo("")}
            value={motivo}
            onChange={(e) => setMotivo(e.target.value)}
            multiline
            rows={4}
            sx={{ mb: 3 }}
          />
        </Box>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose}>Cerrar</Button>
        <Button
          variant="contained"
          onClick={handleCerrarEnvio}
          // desactiva el boton si no se ha ingresado un motivo
          disabled={!motivo}
        >
          Entregar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default EntregaIndividualDialog;
