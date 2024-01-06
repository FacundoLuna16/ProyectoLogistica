import React, { useState } from 'react';
import {
  Dialog,
  DialogActions,
  DialogTitle,
  DialogContent,
  DialogContentText,
  List,
  Button,
  ListItem,
  ListItemText,
  Checkbox,
} from '@mui/material';

const CerrarHoja = ({ cerrarHoja, open, onClose, enviosSeleccionados }) => {
  const [noEntregadoChecked, setNoEntregadoChecked] = useState(false);

  const handleConfirmar = () => {
    if (noEntregadoChecked) {
      cerrarHoja();
    }
    onClose();
  };

  const handleChangeCheckbox = () => {
    setNoEntregadoChecked(!noEntregadoChecked);
  };

  return (
    <Dialog open={open} onClose={onClose} sx={{ '& .MuiDialog-paper': { minWidth: '400px' } }}>
      <DialogTitle>Cerrar Hoja</DialogTitle>
      <DialogContent>
        <DialogContentText>
          {enviosSeleccionados.length > 0 ? (
            <>
              ¿Estás seguro de que deseas cerrar la hoja con los siguientes envíos seleccionados?
              <List>
                {enviosSeleccionados.map((envioId, index) => (
                  <ListItem key={index} sx={{ padding: '4px 0' }}>
                    <ListItemText primary={`Envío ID: ${envioId}`} sx={{ margin: 0 }} />
                  </ListItem>
                ))}
              </List>
            </>
          ) : (
            <>
              <Checkbox
                checked={noEntregadoChecked}
                onChange={handleChangeCheckbox}
                color="primary"
              />
              No se ha entregado ningún pedido.
            </>
          )}
        </DialogContentText>
      </DialogContent>
      <DialogActions>
        <Button onClick={onClose} color="secondary">
          Cancelar
        </Button>
        <Button
          onClick={handleConfirmar}
          color="primary"
          disabled={!noEntregadoChecked && enviosSeleccionados.length === 0}
        >
          Confirmar
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default CerrarHoja;
