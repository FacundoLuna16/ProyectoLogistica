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
import { Card, Scrollbar, TablePagination, Checkbox } from "@mui/material";

export const EnviosTable = (props) => {
  const {
    count = 0,
    onDeselectAll,
    onDeselectOne,
    onPageChange = () => {},
    onRowsPerPageChange,
    onSelectAll,
    onSelectOne,
    page = 0,
    rowsPerPage = 0,
    selected = [],
    rows = [],
    onEnvioSelected,
  } = props;

  const [envioSeleccionado, setEnvioSeleccionado] = useState({});

  useEffect(() => {
    // Informar al componente padre sobre el cambio del cliente seleccionado
    onEnvioSelected(envioSeleccionado);
  }, [envioSeleccionado, onEnvioSelected]);

  const handleCheckboxChange = (event, numeroFactura) => {
    const { checked } = event.target;

    if (checked) {
      onDeselectAll?.();
      onSelectOne?.(numeroFactura);
    } else {
      onDeselectOne?.(numeroFactura);
    }
    // Actualizar el cliente seleccionado
    const selectedEnvio = rows.find((item) => item.numeroFactura === numeroFactura);
    setEnvioSeleccionado(checked ? selectedEnvio : {});
  };

  function Row(props) {
    const { row } = props;
    const [open, setOpen] = React.useState(false);

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
              checked={false}
              onChange={(event) => handleCheckboxChange(event, row.numeroFactura)}
            />
          </TableCell>
          <TableCell component="th" scope="row">
            {row.numeroFactura}
          </TableCell>
          <TableCell align="right">{row.zona}</TableCell>
          <TableCell align="right">{row.cliente.nombre + " " + row.cliente.apellido}</TableCell>
          <TableCell align="right">{row.direccionEnvio}</TableCell>
          <TableCell align="right">{row.estadoActual}</TableCell>
        </TableRow>
        <TableRow>
          <TableCell style={{ paddingBottom: 0, paddingTop: 0 }} colSpan={6}>
            <Collapse in={open} timeout="auto" unmountOnExit>
              <Box sx={{ margin: 1 }}>
                <Typography variant="h6" gutterBottom component="div">
                  History
                </Typography>
                <Table size="small" aria-label="purchases">
                  <TableHead>
                    <TableRow>
                      <TableCell>Date</TableCell>
                      <TableCell>Customer</TableCell>
                      <TableCell align="right">Amount</TableCell>
                      <TableCell align="right">Total price ($)</TableCell>
                    </TableRow>
                  </TableHead>
                  <TableBody>
                    {/* {row.history.map((historyRow) => (
                    <TableRow key={historyRow.date}>
                      <TableCell component="th" scope="row">
                        {historyRow.date}
                      </TableCell>
                      <TableCell>{historyRow.customerId}</TableCell>
                      <TableCell align="right">{historyRow.amount}</TableCell>
                      <TableCell align="right">
                        {Math.round(historyRow.amount * row.price * 100) / 100}
                      </TableCell>
                    </TableRow>
                  ))} */}
                  </TableBody>
                </Table>
              </Box>
            </Collapse>
          </TableCell>
        </TableRow>
      </React.Fragment>
    );
  }

  //nuevas row props de envios
  Row.propTypes = {
    row: PropTypes.shape({
      numeroFactura: PropTypes.number.isRequired,
      zona: PropTypes.string.isRequired,
      cliente: PropTypes.shape({
        nombre: PropTypes.string.isRequired,
        apellido: PropTypes.string.isRequired,
      }),
      direccionEnvio: PropTypes.string.isRequired,
      estadoActual: PropTypes.string.isRequired,
    }).isRequired,
  };



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

                    <TableCell>Numero Factura</TableCell>
                    <TableCell align="right">Zona</TableCell>
                    <TableCell align="right">Cliente</TableCell>
                    <TableCell align="right">Direccion de Envio</TableCell>
                    <TableCell align="right">Estado Actual</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {rows.map((row) => (
                    <Row key={row.name} row={row} />
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
  onClienteSelected: PropTypes.func,
};
