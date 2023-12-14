import { useCallback, useEffect, useMemo, useState } from "react";
import Head from "next/head";
import PlusIcon from "@heroicons/react/24/solid/PlusIcon";
import { Box, Button, Container, Stack, Typography } from "@mui/material";
import { useSelection } from "src/hooks/use-selection";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { ClientsTable } from "src/sections/clientes/clientes-table";
import { applyPagination } from "src/utils/apply-pagination";
import { ArrowPathIcon, UserCircleIcon } from "@heroicons/react/24/outline";
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";
import clientesService from "../service/clientesService";
import AgregarClienteDialog from "src/sections/clientes/altaClientes";
import ConsultarClienteDialog from "src/sections/clientes/verClientes";
import ModificarClienteDialog from "src/sections/clientes/modificarCliente";

const Clientes = () => {
  const [clientes, setClientes] = useState([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(5);

  useEffect(() => {
    const fetchClientes = async () => {
      try {
        const data = await clientesService.getAll();
        console.log(data);
        setClientes(data);
      } catch (error) {
        console.error("Error al obtener clientes:", error);
      }
    };

    fetchClientes();
  }, []);

  const paginatedClientes = useMemo(() => {
    return applyPagination(clientes, page, rowsPerPage);
  }, [clientes, page, rowsPerPage]);

  const clientesIds = useMemo(() => {
    return paginatedClientes.map((cliente) => cliente.iDCliente);
  }, [paginatedClientes]);

  const clientesSelection = useSelection(clientesIds);

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

  const handleClienteAdded = (cliente) => {
    setClientes([...clientes, cliente]);
  };

  const [dialogConsultaOpen, setDialogConsultaOpen] = useState(false);
  const [clienteSeleccionado, setClienteSeleccionado] = useState({
    iDCliente: 0,
    tipoDoc: "",
    nroDoc: "",
    nombre: "",
    apellido: "",
    direccion: "",
    nroTelefono: "",
    nroTelefonoAlternativo: "",
    mail: "",
  });

  const handleVerDetalle = (clienteId) => {
    const clienteDetalle = clientes.find((c) => c.iDCliente === clienteId) || {
      iDCliente: 0,
      tipoDoc: "",
      nroDoc: "",
      nombre: "",
      apellido: "",
      direccion: "",
      nroTelefono: "",
      nroTelefonoAlternativo: "",
      mail: "",
    };
    setClienteSeleccionado(clienteDetalle);
    setDialogConsultaOpen(true);
  };

  const [dialogModificacionOpen, setDialogModificacionOpen] = useState(false);

  return (
    <>
      <Head>
        <title>Clientes | Sistema de Gestión de Envios</title>
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
                <Button
                  startIcon={<PlusIcon />}
                  variant="contained"
                  color="success"
                  onClick={() => setDialogOpen(true)}
                >
                  Agregar
                </Button>
                <AgregarClienteDialog
                  open={dialogOpen}
                  onClose={handleDialogClose}
                  onClienteAdded={handleClienteAdded}
                />
                <Button
                  startIcon={<UserCircleIcon />}
                  variant="contained"
                  color="warning"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => setDialogModificacionOpen(true)}
                >
                  Modificar
                </Button>
                <ModificarClienteDialog
                  open={dialogModificacionOpen}
                  onClose={() => setDialogModificacionOpen(false)}
                />
                <Button
                  startIcon={<ArrowPathIcon />}
                  variant="contained"
                  color="info"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => handleVerDetalle(/* id del cliente seleccionado */)}
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
              count={clientes.length}
              items={paginatedClientes}
              onDeselectAll={clientesSelection.handleDeselectAll}
              onDeselectOne={clientesSelection.handleDeselectOne}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              onSelectAll={clientesSelection.handleSelectAll}
              onSelectOne={clientesSelection.handleSelectOne}
              page={page}
              rowsPerPage={rowsPerPage}
              selected={clientesSelection.selected}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Clientes.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Clientes;
