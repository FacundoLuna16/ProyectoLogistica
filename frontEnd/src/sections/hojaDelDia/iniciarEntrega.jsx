import React, { useState, useEffect } from "react";
import { Dialog, Typography, DialogContent, DialogTitle, DialogActions, Button, Box, FormControl, InputLabel, Select, MenuItem, CircularProgress } from "@mui/material";
import CamionesService from "src/service/camionesService";
import RepartidoresService from "src/service/repartidoresService";
import { useAuth } from "src/contexts/AuthContext";

const IniciarEntregaDialog = ({ open, onClose, iniciar }) => {
    const [repartidores, setRepartidores] = useState([]); // Estado para los repartidores
    const [camiones, setCamiones] = useState([]); // Estado para los camiones
    const [repartidorSeleccionado, setRepartidorSeleccionado] = useState("");
    const [camionSeleccionado, setCamionSeleccionado] = useState("");
    const [loading, setLoading] = useState(true);

    const authContext = useAuth();
    const camionService = new CamionesService(authContext);
    const repartidorService = new RepartidoresService(authContext);
    
    const fetchCamiones = async () => {
        try {
            const data = await camionService.getAll();
            setCamiones(data);
        } catch(error) {
            console.error("Error al obtener camones", error);
            return [];
        }
    };

    const fetchRepartidores = async () => {
        try {
            const data = await repartidorService.getAll();
            setRepartidores(data);
        } catch(error) {
            console.error("Error al obtener repartidores", error);
        }
    };

    const handleClose = () => {
        // Limpiar los campos y luego llamar a onClose
        setRepartidorSeleccionado("");
        setCamionSeleccionado("");
        onClose();
    };

    const handleIniciarEntrega = () => {
        // Aquí puedes pasar el repartidor y camión seleccionado a la función iniciar
        iniciar(repartidorSeleccionado, camionSeleccionado);
        handleClose();
    };

    useEffect(() => {
        const fetchData = async () => {
          setLoading(true); // Inicia la carga
    
          // Espera a que fetchClientes complete y obtiene la data
            
            await fetchCamiones();
            await fetchRepartidores();

          setLoading(false); // Finaliza la carga
        };
        fetchData(); // Llama a la función interna
      }, [open]);

    if (loading) {
        return (
          <Dialog open={open} onClose={handleClose}>
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
        <Dialog open={open} onClose={handleClose} fullWidth>
            <DialogTitle>Iniciar Entrega</DialogTitle>
            <DialogContent>
                <Box display="flex" flexDirection="column" gap={2}>

                    <FormControl fullWidth>
                        <InputLabel id="repartidor-label">Repartidor</InputLabel>
                        <Select
                            labelId="repartidor-label"
                            id="repartidor"
                            value={repartidorSeleccionado}
                            label="Repartidor"
                            onChange={(e) => setRepartidorSeleccionado(e.target.value)}
                        >
                            {repartidores.map((repartidor) => (
                                <MenuItem key={repartidor.idRepartidor} value={repartidor.idRepartidor}>
                                    {repartidor.nombre} {repartidor.apellido}
                                </MenuItem>
                            ))}
                        </Select>
                    </FormControl>

                    <FormControl fullWidth>
                        <InputLabel id="camion-label">Camión</InputLabel>
                        <Select
                            labelId="camion-label"
                            id="camion"
                            value={camionSeleccionado}
                            label="Camión"
                            onChange={(e) => setCamionSeleccionado(e.target.value)}
                        >
                            {camiones.map((camion) => (
                                <MenuItem key={camion.patente} value={camion.patente}>
                                    {camion.patente}
                                </MenuItem>
                            ))}
                        </Select>
                    </FormControl>

                </Box>
                <Typography variant="h6" sx={{ mt: 2 }}>
                    ¿Está seguro que desea iniciar la entrega?
                </Typography>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Cancelar</Button>
                <Button 
                  onClick={handleIniciarEntrega} 
                  variant="contained" 
                  color="primary"
                  disabled={!repartidorSeleccionado || !camionSeleccionado} // Deshabilitar si no hay selección
                >
                  Iniciar
                </Button>
            </DialogActions>
        </Dialog>
    );
}

export default IniciarEntregaDialog;
