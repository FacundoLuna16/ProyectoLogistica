import PropTypes from "prop-types";
import { format } from "date-fns";
import {
  Box,
  Card,
  Checkbox,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TablePagination,
  TableRow,
  Paper,
  TableContainer,
  Typography,
} from "@mui/material";
import { Scrollbar } from "src/components/scrollbar";
import { createTheme, ThemeProvider } from "@mui/material/styles";
import { useEffect, useState } from "react";

export const CustomersTable = (props) => {
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
    onRepartidorSelectedChange,
  } = props;

  const [repartidorSelected, setRepartidorSelected] = useState({
    idRepartidor: "",
    nombre: "",
    apellido: "",
  });


  useEffect(() => {
    // Informar al componente padre sobre el cambio del repartidor seleccionado
    onRepartidorSelectedChange(repartidorSelected);
  }, [repartidorSelected, onRepartidorSelectedChange]);

  const selectedSome = selected.length > 0 && selected.length < items.length;
  const selectedAll = items.length > 0 && selected.length === items.length;

  const theme = createTheme({
    components: {
      MuiTableCell: {
        styleOverrides: {
          root: {
            fontSize: "19px", // Ajusta el tamaño de la fuente según sea necesario
          },
        },
      },
    },
  });

  const handleCheckboxChange = (event, idRepartidor) => {
    const { checked } = event.target;

    if (checked) {
      onDeselectAll?.();
      onSelectOne?.(idRepartidor);
    } else {
      onDeselectOne?.(idRepartidor);
    }
    // Actualizar el repartidor seleccionado
    const selectedRepartidor = items.find((repartidor) => repartidor.idRepartidor === idRepartidor);
    setRepartidorSelected(checked ? selectedRepartidor : {});
  };

  return (
    <Card>
      <Scrollbar>
        <Box sx={{ minWidth: 800 }}>
          <Paper sx={{ minWidth: 200 }}>
            <TableContainer sx={{ maxHeight: 600 }}>
              <ThemeProvider theme={theme}>
                <Table>
                  <TableHead>
                    <TableRow>
                      <TableCell></TableCell>
                      <TableCell>ID Repartidor</TableCell>
                      <TableCell>Nombre</TableCell>
                      <TableCell>Apellido</TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {items.map((customer) => {
                      const isSelected = selected.includes(customer.idRepartidor);

                      return (
                        <TableRow hover key={customer.idRepartidor} selected={isSelected}>
                          <TableCell padding="checkbox">
                            <Checkbox
                              checked={isSelected}
                              onChange={(event) => handleCheckboxChange(event, customer.idRepartidor)}
                            />
                          </TableCell>
                          <TableCell>{customer.idRepartidor}</TableCell>
                          <TableCell>{customer.nombre}</TableCell>
                          <TableCell>{customer.apellido}</TableCell>
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

CustomersTable.propTypes = {
  count: PropTypes.number,
  items: PropTypes.array,
  onDeselectAll: PropTypes.func,
  onDeselectOne: PropTypes.func,
  onPageChange: PropTypes.func,
  onRowsPerPageChange: PropTypes.func,
  onSelectAll: PropTypes.func,
  onSelectOne: PropTypes.func,
  page: PropTypes.number,
  rowsPerPage: PropTypes.number,
  selected: PropTypes.array,
};
