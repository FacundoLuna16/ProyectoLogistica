import React from "react";
import { useEffect, useState } from "react";
import PropTypes from "prop-types";
import Box from "@mui/material/Box";
import Collapse from "@mui/material/Collapse";
import IconButton from "@mui/material/IconButton";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Typography from "@mui/material/Typography";
import Paper from "@mui/material/Paper";
import KeyboardArrowDownIcon from "@mui/icons-material/KeyboardArrowDown";
import KeyboardArrowUpIcon from "@mui/icons-material/KeyboardArrowUp";
import { Card, TablePagination, Checkbox } from "@mui/material";
import { Scrollbar } from "src/components/scrollbar";

export const EnviosTable = (props) => {
  const {
    rows = [],
    count = 0,
    onEnvioSelected,
    onDeselectAll,
    onDeselectOne,
    onSelectAll,
    onSelectOne,
    selected = [],
    onPageChange,
    onRowsPerPageChange,
    page = 0,
    rowsPerPage = 0,
  } = props;

  const [envioSeleccionado, setEnvioSeleccionado] = useState({});

  useEffect(() => {
    // Informar al componente padre sobre el cambio del envío seleccionado
    onEnvioSelected(envioSeleccionado);
  }, [envioSeleccionado, onEnvioSelected]);


  const handleCheckboxChange = (event, numeroFactura) => {
    const { checked } = event.target;

    if (checked) {
      // Si se marca una fila, deseleccionar las demás
      onDeselectAll?.();
      onSelectOne?.(numeroFactura);

      setEnvioSeleccionado(rows.find((item) => item.numeroFactura === numeroFactura));
    } else {
      onDeselectOne?.(numeroFactura);
      setEnvioSeleccionado({});
    }
  };


  function Row(props) {
    const { row } = props;
    const [open, setOpen] = React.useState(false);
    const isSelected = selected.includes(row.numeroFactura);

    return (
      <React.Fragment>
        <TableRow sx={{ "& > *": { borderBottom: "unset" } }}>
          <TableCell>
            <IconButton aria-label="expand row" size="small" onClick={() => setOpen(!open)}>
              {open ? <KeyboardArrowUpIcon /> : <KeyboardArrowDownIcon />}
            </IconButton>
          </TableCell>
          <TableCell padding="checkbox">
            <Checkbox
              checked={isSelected}
              onChange={(event) => handleCheckboxChange(event, row.numeroFactura)}
            />
          </TableCell>
          <TableCell align="center" component="th" scope="row">{row.numeroFactura}</TableCell>
          <TableCell align="center">{row.zona}</TableCell>
          <TableCell align="center">{row.cliente.nombre + " " + row.cliente.apellido}</TableCell>
          <TableCell align="center">{row.direccionEnvio}</TableCell>
          <TableCell align="center">{row.estadoActual}</TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
            <Collapse in={open} timeout="auto" unmountOnExit>
              {/* <Box sx={{ margin: 1 }}>
                <Typography variant="h6" gutterBottom component="div">
                  Detalle de productos
                </Typography>
                <Table size="small" aria-label="purchases">
                  <TableHead>
                    <TableRow>
                      <TableCell>Producto</TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {row.detalleEnvio.map((detalle) => (
                    <TableRow key={detalle.id}>
                      <TableCell component="th" scope="row">
                        {detalle.nombre}
                      </TableCell>
                    </TableRow>
                  ))}
                  </TableBody>
                </Table>
              </Box> */}
            </Collapse>
          </TableCell>
        </TableRow>
      </React.Fragment>
    );
  }

  return (
    <Card>
      <Scrollbar>
        <Box sx={{ minWidth: 800 }}>
          <Paper sx={{ minWidth: 200 }}>
            <TableContainer component={Paper}>
              <Table aria-label="collapsible table">
                <TableHead>
                  <TableRow>
                    <TableCell />
                    <TableCell />

                    <TableCell align="center">Numero Factura</TableCell>
                    <TableCell align="center">Zona</TableCell>
                    <TableCell align="center">Cliente</TableCell>
                    <TableCell align="center">Direccion de Envio</TableCell>
                    <TableCell align="center">Estado Actual</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {rows.map((row) => (
                    <Row key={row.numeroFactura} row={row} />
                  ))}
                </TableBody>
              </Table>
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
EnviosTable.propTypes = {
  count: PropTypes.number,
  onDeselectAll: PropTypes.func,
  onDeselectOne: PropTypes.func,
  onPageChange: PropTypes.func,
  onRowsPerPageChange: PropTypes.func,
  onSelectAll: PropTypes.func,
  onSelectOne: PropTypes.func,
  page: PropTypes.number,
  rowsPerPage: PropTypes.number,
  selected: PropTypes.array,
  rows: PropTypes.array,
  onEnvioSelected: PropTypes.func,
};