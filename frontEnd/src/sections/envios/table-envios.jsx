import React from "react";
import PropTypes from "prop-types";
import {
  Box,
  Card,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TablePagination,
  TableRow,
} from "@mui/material";
import { Scrollbar } from "src/components/scrollbar";

export const EnviosTable = (props) => {
  const {
    rows = [],
    count = 0,
    onPageChange,
    onRowsPerPageChange,
    page = 0,
    rowsPerPage = 0,
  } = props;

  return (
    <Card>
      <Scrollbar>
        <Box sx={{ minWidth: 800 }}>
          <TableContainer component={Paper}>
            <Table aria-label="collapsible table">
              <TableHead>
                <TableRow>
                  <TableCell align="center">Numero Factura</TableCell>
                  <TableCell align="center">Zona</TableCell>
                  <TableCell align="center">Cliente</TableCell>
                  <TableCell align="center">Direccion de Envio</TableCell>
                  <TableCell align="center">Estado Actual</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {rows.map((row) => (
                  <TableRow key={row.numeroFactura}>
                    <TableCell align="center">{row.numeroFactura}</TableCell>
                    <TableCell align="center">{row.zona}</TableCell>
                    <TableCell align="center">{row.cliente.nombre + " " + row.cliente.apellido}</TableCell>
                    <TableCell align="center">{row.direccionEnvio}</TableCell>
                    <TableCell align="center">{row.estadoActual}</TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </TableContainer>
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

EnviosTable.propTypes = {
  count: PropTypes.number,
  onPageChange: PropTypes.func,
  onRowsPerPageChange: PropTypes.func,
  page: PropTypes.number,
  rowsPerPage: PropTypes.number,
  rows: PropTypes.array,
  onEnvioSelected: PropTypes.func,
};
