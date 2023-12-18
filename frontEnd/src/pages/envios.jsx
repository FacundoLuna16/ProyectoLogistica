
import { useCallback, useEffect, useMemo, useState } from "react";
import { ClientsTable } from "src/sections/clientes/clientes-table"; // Reemplazar con el nombre correcto
import { applyPagination } from "src/utils/apply-pagination";
import { ArrowPathIcon, TruckIcon, UserCircleIcon } from "@heroicons/react/24/outline"; // Reemplazar con el icono correcto para camiones
import useMediaQuery from "@mui/material/useMediaQuery";
import CollapsibleTable from "src/sections/envios/table-envios";
import enviosService from "src/service/enviosService";
import { useTheme } from "@mui/material/styles";
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
import Head from "next/head";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { TrashIcon } from "@heroicons/react/24/outline";


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
            <CollapsibleTable
            rows={enviosFiltrados}
            onClienteSelected={setEnvioSeleccionado}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Envios.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Envios;
