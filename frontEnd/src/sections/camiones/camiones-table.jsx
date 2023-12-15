import PropTypes from 'prop-types';
import { useEffect, useState } from 'react';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import { format } from 'date-fns';
import {
  Box,
  Card,
  Checkbox,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableContainer,
  TablePagination,
  TableRow,
  Paper,
  Typography
} from '@mui/material';
import { Scrollbar } from 'src/components/scrollbar';

export const CamionTable = (props) => {
  const {
    count = 0,
    items = [],
    onDeselectAll,
    onDeselectOne,
    onPageChange = () => {},
    onRowsPerPageChange,
    onSelectOne,
    page = 0,
    rowsPerPage = 0,
    selected = [],
    onCamionSelectedChange
  } = props;

  const [camionSeleccionado, setCamionSeleccionado] = useState({
    patente: '',
    modelo: '',
    color: '',
    marca: '',
  });

  useEffect(() => {
    // Informar al componente padre sobre el cambio del camión seleccionado
    onCamionSelectedChange(camionSeleccionado);
  }, [camionSeleccionado, onCamionSelectedChange]);


  const handleCheckboxChange = (event, patente) => {
    const { checked } = event.target;

    if (checked) {
      onDeselectAll?.();
      onSelectOne?.(patente);
    } else {
      onDeselectOne?.(patente);
    }
    // Actualizar el camión seleccionado
    const selectedCamion = items.find((camion) => camion.patente === patente);
    setCamionSeleccionado(checked ? selectedCamion : {});
  };

  const theme = createTheme({
    components: {
      MuiTableCell: {
        styleOverrides: {
          root: {
            fontSize: '20px', // Ajusta el tamaño de la fuente según sea necesario
          },
        },
      },
    },
  });

  return (
    <Card>
      <Scrollbar>
        <Box sx={{ minWidth: 800 }}>
          <Paper sx={{ minWidth: 200 }}>
            <TableContainer sx={{ maxHeight: 600 }}>
            <ThemeProvider theme={theme}>
              <Table>
                <TableHead stickyHeader>
                  <TableRow>
                    <TableCell padding="checkbox">
                      {/* Eliminamos la opción de seleccionar/deseleccionar todos */}
                    </TableCell>
                    <TableCell>Patente</TableCell>
                    <TableCell>Modelo</TableCell>
                    <TableCell>Color</TableCell>
                    <TableCell>Descripcion</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {items.map((camion) => {
                    const isSelected = selected.includes(camion.patente);

                    return (
                      <TableRow
                        hover
                        key={camion.patente}
                        selected={isSelected}
                        //onClick={() => onSelectOne?.(camion.patente)}
                      >
                        <TableCell padding="checkbox">
                          <Checkbox
                            checked={isSelected}
                            onChange={(event) => handleCheckboxChange(event, camion.patente)}
                          />
                        </TableCell>
                        <TableCell>{camion.patente}</TableCell>
                        <TableCell>{camion.modelo}</TableCell>
                        <TableCell>{camion.color}</TableCell>
                        <TableCell>{camion.descripcion}</TableCell>
                      </TableRow>
                    );
                  })}
                </TableBody>
              </Table>
              </ThemeProvider>
            </TableContainer>
          </Paper>
        </Box>
      </Scrollbar>
      <TablePagination
        component="div"
        count={count}
        onPageChange={onPageChange}
        onRowsPerPageChange={onRowsPerPageChange}
        page={page}
        rowsPerPage={rowsPerPage}
        rowsPerPageOptions={[5, 10, 25]}
      />
    </Card>
  );
};

CamionTable.propTypes = {
  count: PropTypes.number,
  items: PropTypes.array,
  onDeselectAll: PropTypes.func,
  onDeselectOne: PropTypes.func,
  onPageChange: PropTypes.func,
  onRowsPerPageChange: PropTypes.func,
  onSelectOne: PropTypes.func,
  page: PropTypes.number,
  rowsPerPage: PropTypes.number,
  selected: PropTypes.array,
  onCamionSelectedChange: PropTypes.func
};
