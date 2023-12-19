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
import ModificarEnvioDialog from "src/sections/envios/modificarEnvios";


const Envios = () => {
  const [envios, setEnvios] = useState([]);
  const [enviosFiltrados, setEnviosFiltrados] = useState([]); // Nuevo estado para los clientes filtrados
  const [envioSeleccionado, setEnvioSeleccionado] = useState({}); // Nuevo estado para el cliente seleccionado

  const [page, setPage] = useState(0);

  const [rowsPerPage, setRowsPerPage] = useState(10);

  const [filtroTexto, setFiltroTexto] = useState("");

  const [filtroAtributo, setFiltroAtributo] = useState("numeroFactura");

  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs"));

  const [dialogOpen, setDialogOpen] = useState(false);

  const handleDialogClose = () => {
    setDialogOpen(false);
  };

 

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
    return paginatedEnvios.map((envio) => envio.numeroFactura);
  }, [paginatedEnvios]);

  const envioSelection = useSelection(numerosFactura);

  const handleFiltrar = () => {
    // Aplicar el filtro sobre la copia del arreglo original
    const enviosFiltrados = envios.filter((envio) => {
      const valorAtributo = envio[filtroAtributo].toLowerCase();
      return valorAtributo.includes(filtroTexto.toLowerCase());
    });

    setEnviosFiltrados(enviosFiltrados);
    setEnvioSeleccionado({});
  }

  useEffect(() => {
    handleFiltrar();
  }
  , [filtroTexto, filtroAtributo]);

  const [dialogConsultaOpen, setDialogConsultaOpen] = useState(false);
  const [dialogModificacionOpen, setDialogModificacionOpen] = useState(false);
  
  const handleOnClickConSeleccionado = (funcion) => {
    if (envioSeleccionado.numeroFactura) {
      switch (funcion) {
        case "C":
          setDialogConsultaOpen(true);
          break;
        case "M":
          setDialogModificacionOpen(true);
          break;
        default:
          break;
      }
    } else {
      alert("Debe seleccionar un envio");
    }
  };


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
                  onChange={(e) => setFiltroTexto(e.target.value)}
                />
                <Select
                  value={filtroAtributo}
                  onChange={(e) => setFiltroAtributo(e.target.value)}
                  variant="outlined"
                  size="small"
                >
                  <MenuItem value="numeroFactura">Numero Factura</MenuItem>
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
                  onClick={() => handleOnClickConSeleccionado("M")}
                  //onClick={() => setDialogModificacionOpen(true)}
                >
                  Modificar
                </Button>
                <ModificarEnvioDialog
                  open={dialogModificacionOpen}
                  onClose={() => setDialogModificacionOpen(false)}
                  envio={envioSeleccionado}
                  refrescar={fetchEnvios}
                />
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
              rows={paginatedEnvios}
              count={enviosFiltrados.length}
              onEnvioSelected={setEnvioSeleccionado}
              onDeselectAll={envioSelection.handleDeselectAll}
              onDeselectOne={envioSelection.handleDeselectOne}
              onSelectAll={envioSelection.handleSelectAll}
              onSelectOne={envioSelection.handleSelectOne}
              selected={envioSelection.selected}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              page={page}
              rowsPerPage={rowsPerPage}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Envios.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Envios;
