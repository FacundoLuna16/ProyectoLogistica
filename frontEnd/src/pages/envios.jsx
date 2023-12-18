import React, { useCallback, useEffect, useMemo, useState } from "react";
import { applyPagination } from "src/utils/apply-pagination";
import { 
  Box, 
  Container, 
  Typography, 
  TextField, 
  Grid, 
  Select, 
  MenuItem, 
  FormControl, 
  InputLabel, 
  Paper, 
  Button, 
  Stack 
} from "@mui/material";
import { ArrowPathIcon, TruckIcon, UserCircleIcon } from "@heroicons/react/24/outline";
import useMediaQuery from "@mui/material/useMediaQuery";
import enviosService from "src/service/enviosService";
import { useSelection } from "src/hooks/use-selection";
import { useTheme } from "@mui/material/styles";
//import EnviosTable from "src/sections/envios/table-envios";
import { EnviosTable } from "src/sections/envios/table-envios";
import Head from "next/head";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";


const Envios = () => {
  const [envios, setEnvios] = useState([]);
  const [enviosFiltrados, setEnviosFiltrados] = useState([]); // Nuevo estado para los clientes filtrados
  const [envioSeleccionado, setEnvioSeleccionado] = useState({}); // Nuevo estado para el cliente seleccionado

  const [page, setPage] = useState(0);

  const [rowsPerPage, setRowsPerPage] = useState(10);

  const [filtroTexto, setFiltroTexto] = useState("");

  const [filtroAtributo, setFiltroAtributo] = useState("Numero Factura");

  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs"));

  const [dialogOpen, setDialogOpen] = useState(false);

  const handleDialogClose = () => {
    setDialogOpen(false);
  };

  const envioSelection = useSelection();

  const handlePageChange = useCallback((event, value) => {
    setPage(value);
  }, []);

  const handleRowsPerPageChange = useCallback((event) => {
    setRowsPerPage(event.target.value);
  }, []);


  const fetchEnvios = async () => {
    try {
      const data = await enviosService.getAll();
      setEnvios(data);
      setEnviosFiltrados(data);
    } catch (error) {
      console.error("Error al obtener clientes:", error);
    }
  };

  useEffect(() => {
    fetchEnvios();
  }, []);

  const paginatedEnvios = useMemo(() => {
    return applyPagination(enviosFiltrados, page, rowsPerPage);
  }, [enviosFiltrados, page, rowsPerPage]);

  const numerosFactura = useMemo(() => {
    return envios.map((envio) => envio.numeroFactura);
  }, [envios]);


  
  return (
    <>
      <Head>
        <title>Envíos | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
        <Container maxWidth="xl">
          <Stack spacing={3}>
            <Stack
              direction={isXSmall ? "column" : "row"}
              justifyContent="space-between"
              spacing={isXSmall ? 2 : 4}
              alignItems="center"
            >
              <Typography variant="h4" sx={{ mb: isXSmall ? 2 : 0 }}>
                Envios
              </Typography>
              <Stack direction={isXSmall ? "column" : "row"} spacing={2} alignItems="center">
                <TextField
                  label="Filtrar"
                  size="medium"
                  value={filtroTexto}
                  variant="standard"
                  //onChange={(e) => setFiltroTexto(e.target.value)}
                />
                <Select
                  value={filtroAtributo}
                  //onChange={(e) => setFiltroAtributo(e.target.value)}
                  variant="outlined"
                  size="small"
                >
                  <MenuItem value="numeroDocumento">Numero Factura</MenuItem>
                </Select>
              </Stack>
              <Stack direction={isXSmall ? "column" : "row"} spacing={2} alignItems="center">
                <Button
                  startIcon={<TruckIcon />}
                  variant="contained"
                  color="success"
                  //onClick={() => setDialogOpen(true)}
                >
                  Agregar
                </Button>
                {/* <AgregarClienteDialog
                  open={dialogOpen}
                  onClose={handleDialogClose}
                  onClienteAdded={fetchClientes}
                /> */}
                <Button
                  startIcon={<UserCircleIcon />}
                  variant="contained"
                  color="warning"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  //onClick={() => handleOnClickConSeleccionado(clienteSeleccionado.idCliente, "M")}
                  //onClick={() => setDialogModificacionOpen(true)}
                >
                  Modificar
                </Button>
                {/* <ModificarClienteDialog
                  open={dialogModificacionOpen}
                  onClose={() => setDialogModificacionOpen(false)}
                  cliente={clienteSeleccionado}
                  refrescar={fetchClientes}
                /> */}
                <Button
                  startIcon={<ArrowPathIcon />}
                  variant="contained"
                  color="info"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  //onClick={() => handleOnClickConSeleccionado(clienteSeleccionado.idCliente, "C")}
                >
                  Ver
                </Button>
                {/* <ConsultarClienteDialog
                  open={dialogConsultaOpen}
                  onClose={() => setDialogConsultaOpen(false)}
                  cliente={clienteSeleccionado}
                /> */}
              </Stack>
            </Stack>
            <EnviosTable
              rows={enviosFiltrados}
              count={enviosFiltrados.length}
              onEnvioSelected={setEnvioSeleccionado}
              onDeselectAll={envioSelection.handleDeselectAll}
              onDeselectOne={envioSelection.handleDeselectOne}
              onSelectAll={envioSelection.handleSelectAll}
              onSelectOne={envioSelection.handleSelectOne}
              selected={envioSelection.selected}
              // onPageChange={handlePageChange}
              // onRowsPerPageChange={handleRowsPerPageChange}
              // page={page}
              // rowsPerPage={rowsPerPage}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Envios.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Envios;
