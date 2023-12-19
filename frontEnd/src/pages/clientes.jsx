import { useCallback, useEffect, useMemo, useState } from "react";
import Head from "next/head";
import { Box, Button, Container, Stack, Typography } from "@mui/material";
import { useSelection } from "src/hooks/use-selection";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { ClientsTable } from "src/sections/clientes/clientes-table"; // Reemplazar con el nombre correcto
import { applyPagination } from "src/utils/apply-pagination";
import { ArrowPathIcon, TruckIcon, UserCircleIcon } from "@heroicons/react/24/outline"; // Reemplazar con el icono correcto para camiones
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";
import ClientesService from "../service/clientesService"; // Reemplazar con el servicio correcto
import AgregarClienteDialog from "src/sections/clientes/altaClientes";
import ConsultarClienteDialog from "src/sections/clientes/verClientes";
import ModificarClienteDialog from "src/sections/clientes/modificarCliente";
import TextField from "@mui/material/TextField";
import Select from "@mui/material/Select";
import MenuItem from "@mui/material/MenuItem";

const Clientes = () => {
  const [clientes, setClientes] = useState([]);
  const [clientesFiltrados, setClientesFiltrados] = useState([]); // Nuevo estado para los clientes filtrados

  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [filtroTexto, setFiltroTexto] = useState("");
  const [filtroAtributo, setFiltroAtributo] = useState("numeroDocumento");

  const handleFiltrar = () => {
    // Aplicar el filtro sobre la copia del arreglo original
    const clientesFiltrados = clientes.filter((cliente) => {
      const valorAtributo = cliente[filtroAtributo].toLowerCase();
      return valorAtributo.includes(filtroTexto.toLowerCase());
    });

    setClientesFiltrados(clientesFiltrados);
    setClienteSeleccionado({});
  };

  useEffect(() => {
    handleFiltrar();
  }, [filtroTexto, filtroAtributo]);

  const fetchClientes = async () => {
    try {
      const data = await ClientesService.getAll();
      setClientes(data);
      setClientesFiltrados(data);
    } catch (error) {
      console.error("Error al obtener clientes:", error);
    }
  };

  useEffect(() => {
    fetchClientes();
  }, []);

  const paginatedClientes = useMemo(() => {
    return applyPagination(clientesFiltrados, page, rowsPerPage);
  }, [clientesFiltrados, page, rowsPerPage]);

  const clientesIds = useMemo(() => {
    return paginatedClientes.map((cliente) => cliente.idCliente);
  }, [paginatedClientes]);

  const clienteSelection = useSelection(clientesIds);

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


  const [dialogConsultaOpen, setDialogConsultaOpen] = useState(false);

  const [clienteSeleccionado, setClienteSeleccionado] = useState({
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

  const handleOnClickConSeleccionado = ( funcion) => {

    if (clienteSeleccionado.idCliente) {
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
      alert("Debe seleccionar un cliente");
    }
  };

  const [dialogModificacionOpen, setDialogModificacionOpen] = useState(false);

  return (
    <>
      <Head>
        <title>Clientes | Sistema de Gestión de Envíos</title>
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
                Clientes
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
                  <MenuItem value="numeroDocumento">Numero Documento</MenuItem>
                  <MenuItem value="nombre">Nombre</MenuItem>
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
                <AgregarClienteDialog
                  open={dialogOpen}
                  onClose={handleDialogClose}
                  onClienteAdded={fetchClientes}
                />
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
                <ModificarClienteDialog
                  open={dialogModificacionOpen}
                  onClose={() => setDialogModificacionOpen(false)}
                  cliente={clienteSeleccionado}
                  refrescar={fetchClientes}
                />
                <Button
                  startIcon={<ArrowPathIcon />}
                  variant="contained"
                  color="info"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => handleOnClickConSeleccionado("C")}
                >
                  Ver
                </Button>
                <ConsultarClienteDialog
                  open={dialogConsultaOpen}
                  onClose={() => setDialogConsultaOpen(false)}
                  cliente={clienteSeleccionado}
                />
              </Stack>
            </Stack>
            <ClientsTable
              count={clientesFiltrados.length}
              items={paginatedClientes}
              onDeselectAll={clienteSelection.handleDeselectAll}
              onDeselectOne={clienteSelection.handleDeselectOne}
              onSelectAll={clienteSelection.handleSelectAll}
              onSelectOne={clienteSelection.handleSelectOne}
              selected={clienteSelection.selected}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              page={page}
              rowsPerPage={rowsPerPage}
              onClientSelectedChange={setClienteSeleccionado}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Clientes.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Clientes;


