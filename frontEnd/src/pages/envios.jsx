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
  Stack,
} from "@mui/material";
import { ArrowPathIcon, TruckIcon, UserCircleIcon } from "@heroicons/react/24/outline";
import useMediaQuery from "@mui/material/useMediaQuery";
import EnvioService from "src/service/enviosService";
import { useSelection } from "src/hooks/use-selection";
import { useTheme } from "@mui/material/styles";
//import EnviosTable from "src/sections/envios/table-envios";
import { EnviosTable } from "src/sections/envios/table-envios";
import Head from "next/head";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import ModificarEnvioDialog from "src/sections/envios/modificarEnvios";
import AgregarEnvioDialog from "src/sections/envios/altaEnvios";
import ConsultarEnvioDialog from "src/sections/envios/consultarEnvios";
import { useAuth } from "src/contexts/AuthContext";

const Envios = () => {
  const authContext = useAuth();
  const enviosService = new EnvioService(authContext);
  const [envios, setEnvios] = useState([]);
  const [enviosFiltrados, setEnviosFiltrados] = useState([]); // Nuevo estado para los clientes filtrados
  const [envioSeleccionado, setEnvioSeleccionado] = useState({}); // Nuevo estado para el cliente seleccionado
  const [resetDialog, setResetDialog] = useState(false);

  const [page, setPage] = useState(0);

  const [rowsPerPage, setRowsPerPage] = useState(10);

  const [filtroTexto, setFiltroTexto] = useState("1");

  const [filtroAtributo, setFiltroAtributo] = useState("numeroFactura");

  const [filtroZonaEstado, setFiltroZonaEstado] = useState("1");

  const [tipoEntrada, setTipoEntrada] = useState("text");

  const [dialogConsultaOpen, setDialogConsultaOpen] = useState(false);
  const [dialogModificacionOpen, setDialogModificacionOpen] = useState(false);
  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs"));

  const [dialogOpen, setDialogOpen] = useState(false);


  const handleDialogClose = () => {
    setDialogOpen(false);
    setResetDialog(prev => !prev);
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
      const valorAtributo = String(envio[filtroAtributo]); // Convertir el valor del atributo a cadena

      const valorFiltro = String(filtroTexto); // Convertir el filtro a cadena

      //valida si los valores son iguales ignorando mayusculas y minusculas y sin son numeros que tambien los contemple
      return valorAtributo.toLowerCase().includes(valorFiltro.toLowerCase());
    });

    setEnviosFiltrados(enviosFiltrados);
    setEnvioSeleccionado({});
  };

  useEffect(() => {
    handleFiltrar();
  }, [filtroTexto, filtroAtributo]);

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

  const handleFiltroAtributoChange = (e) => {
    //limpia el filtro
    setFiltroTexto("");
    setFiltroAtributo(e.target.value);

    // Determinar el tipo de entrada según el valor del atributo
    if (e.target.value === "zona" || e.target.value === "estadoActual") {
      setTipoEntrada("select");
    } else {
      setTipoEntrada("text");
    }
  };

  const handleSelectChange = (e) => {
    // Actualizar el estado de filtroTexto al cambiar la opción en el Select
    setFiltroTexto(e.target.value);
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
                {tipoEntrada === "text" ? (
                  <TextField
                    label="Filtrar"
                    size="medium"
                    value={filtroTexto}
                    variant="standard"
                    onChange={(e) => setFiltroTexto(e.target.value)}
                  />
                ) : filtroAtributo === "zona" ? (
                  <Select
                    label="Filtrar"
                    value={filtroTexto}
                    onChange={handleSelectChange}
                    variant="outlined"
                    size="small"
                  >
                    <MenuItem value="1">1</MenuItem>
                    <MenuItem value="2">2</MenuItem>
                    <MenuItem value="3">3</MenuItem>
                    <MenuItem value="4">4</MenuItem>
                  </Select>
                ) : filtroAtributo === "estadoActual" ? (
                  <Select
                    label="Filtrar"
                    value={filtroTexto}
                    onChange={handleSelectChange}
                    variant="outlined"
                    size="small"
                  >
                    <MenuItem value="Pendiente">Pendiente</MenuItem>
                    <MenuItem value="EnCamino">En Camino</MenuItem>
                    <MenuItem value="Entregado">Entregado</MenuItem>
                    <MenuItem value="NoEntregado">No Entregado</MenuItem>
                  </Select>
                ) : (
                  <TextField
                    label="Filtrar"
                    size="medium"
                    value={filtroTexto}
                    variant="standard"
                    onChange={(e) => setFiltroTexto(e.target.value)}
                  />
                )}
                <Select
                  value={filtroAtributo}
                  onChange={handleFiltroAtributoChange}
                  variant="outlined"
                  size="small"
                >
                  <MenuItem value="numeroFactura">Numero Factura</MenuItem>
                  <MenuItem value="zona">Zona</MenuItem>
                  <MenuItem value="cliente.nombre">Cliente</MenuItem>
                  <MenuItem value="direccionEnvio">Direccion de Envio</MenuItem>
                  <MenuItem value="estadoActual">Estado Actual</MenuItem>
                </Select>
              </Stack>
              <Stack direction={isXSmall ? "column" : "row"} spacing={2} alignItems="center">
                <Button
                  startIcon={<TruckIcon />}
                  variant="contained"
                  color="success"
                  onClick={() => setDialogOpen(true)}
                >
                  Agregar
                </Button>
                <AgregarEnvioDialog
                    open={dialogOpen}
                    onClose={handleDialogClose}
                    onEnvioAdded={fetchEnvios}
                    reset={resetDialog}
                />
                <Button
                  startIcon={<UserCircleIcon />}
                  variant="contained"
                  color="warning"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => handleOnClickConSeleccionado("M")}
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
                  onClick={() => handleOnClickConSeleccionado("C")}
                  disabled={!envioSeleccionado.numeroFactura}
                >
                  Ver
                </Button>
                <ConsultarEnvioDialog
                  open={dialogConsultaOpen}
                  onClose={() => setDialogConsultaOpen(false)}
                  envio={envioSeleccionado}
                />
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
