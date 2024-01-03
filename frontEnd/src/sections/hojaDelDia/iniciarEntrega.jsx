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

const IniciarEntregaDialog = ({ open, onClose, iniciar}) => {


    const handleIniciarEntrega = () => {
        iniciar();
        onClose();
    }
    return (
        <Dialog open={open} onClose={onClose} fullWidth>
            <DialogTitle>Iniciar Entrega</DialogTitle>
            <DialogContent>
                <Typography variant="h6">¿Esta seguro que desea iniciar la entrega?</Typography>
            </DialogContent>
            <DialogActions>
                <Button onClick={onClose}>Cancelar</Button>
                <Button onClick={handleIniciarEntrega} variant="contained" color="primary">Iniciar</Button>
            </DialogActions>
        </Dialog>
    );
}

export default IniciarEntregaDialog;

