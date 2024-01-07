import { useCallback, useEffect, useMemo, useState } from "react";
import Head from "next/head";

import { Box, Button, Container, Stack, Typography } from "@mui/material";
import { useSelection } from "src/hooks/use-selection";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { CamionTable } from "src/sections/camiones/camiones-table";  // Reemplazar con el nombre correcto
import { applyPagination } from "src/utils/apply-pagination";
import { ArrowPathIcon, TruckIcon, UserCircleIcon } from "@heroicons/react/24/outline";  // Reemplazar con el icono correcto para camiones
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";
import CamionesService from "../service/camionesService";  // Reemplazar con el servicio correcto
import AgregarCamionDialog from "src/sections/camiones/altaCamiones";
import ConsultarCamionDialog from "src/sections/camiones/verCamion";
import ModificarCamionDialog from "src/sections/camiones/modificarCamion";
import TextField from "@mui/material/TextField";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";

import { useAuth } from "src/contexts/AuthContext";

const Camiones = () => {
  const authContext = useAuth();
  const camionesService = new CamionesService(authContext);
  const [camiones, setCamiones] = useState([]);
  const [camionesFiltrados, setCamionesFiltrados] = useState([]); // Nuevo estado para los camiones filtrados


  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [filtroTexto, setFiltroTexto] = useState('');
  const [filtroAtributo, setFiltroAtributo] = useState('patente');

  const handleFiltrar = () => {
    // Aplicar el filtro sobre la copia del arreglo original
    const camionesFiltrados = camiones.filter((camion) => {
      const valorAtributo = camion[filtroAtributo].toLowerCase();
      return valorAtributo.includes(filtroTexto.toLowerCase());
    });
  
    setCamionesFiltrados(camionesFiltrados);
    setCamionSeleccionado({});
  };

  useEffect(() => {
    handleFiltrar();
  }, [filtroTexto, filtroAtributo]);

  const fetchCamiones = async () => {
    try {
      const data = await camionesService.getAll();
      setCamiones(data);
      setCamionesFiltrados(data);
    } catch (error) {
      console.error("Error al obtener camiones:", error);
    }
  };

  useEffect(() => {
    fetchCamiones();
  }, []);

  const paginatedCamiones = useMemo(() => {
    return applyPagination(camionesFiltrados, page, rowsPerPage);
  }, [camionesFiltrados, page, rowsPerPage]);

  const camionesPatentes = useMemo(() => {
    return paginatedCamiones.map((camion) => camion.patente);
  }, [paginatedCamiones]);

  const camionesSelection = useSelection(camionesPatentes);

  const handlePageChange = useCallback((event, value) => {
    setPage(value);
  }, []);

  const handleRowsPerPageChange = useCallback((event) => {
    setRowsPerPage(event.target.value);
  }, []);

  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs"));

  const [dialogOpen, setDialogOpen] = useState(false);

  const handleDialogClose = () => {
    setDialogOpen(false);
  };

  const handleCamionAdded = (camion) => {
    setCamiones([...camiones, camion]);
  };

  const [dialogConsultaOpen, setDialogConsultaOpen] = useState(false);
  
  const [camionSeleccionado, setCamionSeleccionado] = useState({
    patente: "",
    modelo: "",
    color: "",
    marca: "",
  });

  const handleOnClickConSeleccionado = (patente,funcion) => {
    let camionDetalle = {};
    
    if (patente) {
      camionDetalle = camiones.find((camion) => camion.patente === patente) || {};
      setCamionSeleccionado(camionDetalle);
      //alert("Camion seleccionado: " + camionDetalle.patente + " " + camionDetalle.modelo + " " + camionDetalle.color);
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
    }else{
      alert("Debe seleccionar un camion");
    }
  };


  const [dialogModificacionOpen, setDialogModificacionOpen] = useState(false);

  return (
    <>
      <Head>
        <title>Camiones | Sistema de Gestión de Envíos</title>
      </Head>
      <Box
        component="main"
        sx={{
          flexGrow: 1,
          py: 8,
        }}
      >
        <Container maxWidth="xl">
          <Stack spacing={3}>
            <Stack
              direction={isXSmall ? "column" : "row"}
              justifyContent="space-between"
              spacing={isXSmall ? 2 : 4}
              alignItems="center"
            >
              <Typography variant="h4" sx={{ mb: isXSmall ? 2 : 0 }}>
                Camiones
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
                  <MenuItem value="patente">Patente</MenuItem>
                  <MenuItem value="modelo">Modelo</MenuItem>
                  <MenuItem value="color">Color</MenuItem>
                  <MenuItem value="descripcion">Descripción</MenuItem>
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
                <AgregarCamionDialog
                  open={dialogOpen}
                  onClose={handleDialogClose}
                  refrescar={fetchCamiones}
                />
                <Button
                  startIcon={<UserCircleIcon />}
                  variant="contained"
                  color="warning"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => handleOnClickConSeleccionado(camionSeleccionado.patente, "M")}
                  //onClick={() => setDialogModificacionOpen(true)}
                  disabled={!camionSeleccionado.patente}
                >
                  Modificar
                </Button>
                <ModificarCamionDialog
                  open={dialogModificacionOpen}
                  onClose={() => setDialogModificacionOpen(false)}
                  camion={camionSeleccionado}
                  refrescar={fetchCamiones}
                />
                <Button
                  startIcon={<ArrowPathIcon />}
                  variant="contained"
                  color="info"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => handleOnClickConSeleccionado(camionSeleccionado.patente, "C")}
                  disabled={!camionSeleccionado.patente}
                >
                  Ver
                </Button>
                <ConsultarCamionDialog
                  open={dialogConsultaOpen}
                  onClose={() => setDialogConsultaOpen(false)}
                  camion={camionSeleccionado}
                />
              </Stack>
            </Stack>
            <CamionTable
              count={camionesFiltrados.length}
              items={paginatedCamiones}
              onDeselectAll={camionesSelection.handleDeselectAll}
              onDeselectOne={camionesSelection.handleDeselectOne}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              onSelectAll={camionesSelection.handleSelectAll}
              onSelectOne={camionesSelection.handleSelectOne}
              page={page}
              rowsPerPage={rowsPerPage}
              selected={camionesSelection.selected}
              onCamionSelectedChange={setCamionSeleccionado}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Camiones.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Camiones;
