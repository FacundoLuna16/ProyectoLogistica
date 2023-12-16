import PropTypes from "prop-types";
import { useEffect, useState } from "react";
import { createTheme, ThemeProvider } from "@mui/material/styles";

import { format } from "date-fns";
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
  Typography,
} from "@mui/material";
import { Scrollbar } from "src/components/scrollbar";

export const ClientsTable = (props) => {
  const {
    count = 0,
    items = [],
    onDeselectAll,
    onDeselectOne,
    onPageChange = () => {},
    onRowsPerPageChange,
    onSelectAll,
    onSelectOne,
    page = 0,
    rowsPerPage = 0,
    selected = [],
    onClientSelectedChange,
  } = props;

  const [clientSelected, setClientSelected] = useState({
    idCliente: "",
    tipoDocumento: "",
    numeroDocumento: "",
    nombre: "",
    apellido: "",
    direccion: "",
    numeroTelefono: "",
    numeroTelefonoAlternativo: "",
    email: "",
  });

  useEffect(() => {
    // Informar al componente padre sobre el cambio del cliente seleccionado
    onClientSelectedChange(clientSelected);
  }, [clientSelected, onClientSelectedChange]);

  const handleCheckboxChange = (event, idCliente) => {
    const { checked } = event.target;

    if (checked) {
      onDeselectAll?.();
      onSelectOne?.(idCliente);
    } else {
      onDeselectOne?.(idCliente);
    }
    // Actualizar el cliente seleccionado
    const selectedClient = items.find((client) => client.idCliente === idCliente);
    setClientSelected(checked ? selectedClient : {});
  };

  // const selectedSome = selected.length > 0 && selected.length < items.length;
  // const selectedAll = items.length > 0 && selected.length === items.length;

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
                      <TableCell>TipoDoc</TableCell>
                      <TableCell>NumeroDoc</TableCell>
                      <TableCell>Nombre</TableCell>
                      <TableCell>Apellido</TableCell>
                      <TableCell>Direccion</TableCell>
                      <TableCell>Telefono</TableCell>
                      {/* Columna eliminada: <TableCell>Email</TableCell> */}
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {items.map((client) => {
                      const isSelected = selected.includes(client.idCliente);

                      return (
                        <TableRow hover key={client.idCliente} selected={isSelected}>
                          <TableCell padding="checkbox">
                            <Checkbox
                              checked={isSelected}
                              onChange={(event) => handleCheckboxChange(event, client.idCliente)}
                            />
                          </TableCell>
                          <TableCell>{client.tipoDocumento}</TableCell>
                          <TableCell>{client.numeroDocumento}</TableCell>
                          <TableCell>{client.nombre}</TableCell>
                          <TableCell>{client.apellido}</TableCell>
                          <TableCell>{client.direccion}</TableCell>
                          <TableCell>{client.numeroTelefono}</TableCell>
                          {/* Columna eliminada: <TableCell>{client.email}</TableCell> */}
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

ClientsTable.propTypes = {
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
