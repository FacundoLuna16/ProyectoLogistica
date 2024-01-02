import React, { useState, useEffect } from "react";
import {
  Dialog,
  Typography,
  FormControl,
  InputLabel,
  MenuItem,
  Select,
  DialogContent,
  DialogTitle,
  TextField,
  DialogActions,
  Button,
  Box,
} from "@mui/material";

const CerrarHoja = ({ open, onClose,enviosSeleccionados, cerrarHoja}) => {


    //Pregunta si esta seguro de cerrar la hoja del dia mostrando los envios seleccionados que son un arreglo de strins de los nroDeFactura

    const handleCerrar = () => {
        cerrarHoja();
        onClose();
    }


    return (
        <Dialog open={open} onClose={onClose} fullWidth>
            <DialogTitle>Cerrar Hoja del Dia</DialogTitle>
            <DialogContent>
                <Typography variant="h6">¿Esta seguro que desea cerrar la hoja del dia?</Typography>
                <Typography variant="h6">Envios seleccionados: {enviosSeleccionados}</Typography>
            </DialogContent>
            <DialogActions>
                <Button onClick={onClose}>Cancelar</Button>
                <Button onClick={handleCerrar} variant="contained" color="primary">Cerrar</Button>
            </DialogActions>
        </Dialog>
    );



}

export default CerrarHoja;

