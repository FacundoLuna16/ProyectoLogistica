import React from 'react';
import { Dialog, DialogActions, DialogTitle, DialogContent, DialogContentText,List, Button, ListItem, ListItemText } from '@mui/material';


const CerrarHoja = ({ cerrarHoja, open, onClose, enviosSeleccionados }) => {
    
    return (
            <Dialog open={open} onClose={onClose} sx={{ '& .MuiDialog-paper': { minWidth: '400px' } }}>
        <DialogTitle>Cerrar Hoja</DialogTitle>
        <DialogContent>
          <DialogContentText>
            ¿Estás seguro de que deseas cerrar la hoja con los siguientes envíos seleccionados?
            <List>
              {enviosSeleccionados.map((envioId, index) => (
                <ListItem key={index} sx={{ padding: '4px 0' }}>
                  <ListItemText primary={`Envío ID: ${envioId}`} sx={{ margin: 0 }} />
                </ListItem>
              ))}
            </List>
          </DialogContentText>
        </DialogContent>
        <DialogActions>
          <Button onClick={onClose} color="secondary">
            Cancelar
          </Button>
          <Button onClick={cerrarHoja} color="primary">
            Confirmar
          </Button>
        </DialogActions>
      </Dialog>
    );
  };

  export default CerrarHoja;