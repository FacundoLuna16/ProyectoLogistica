import { useCallback, useMemo, useState } from "react";
import Head from "next/head";
import PlusIcon from "@heroicons/react/24/solid/PlusIcon";
import { Box, Button, Container, Stack, Typography } from "@mui/material";
import { useSelection } from "src/hooks/use-selection";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { CustomersTable } from "src/sections/clientes/clientes-table"; // Asumiendo que existe un componente similar para Clientes
import { applyPagination } from "src/utils/apply-pagination";
import { TrashIcon } from "@heroicons/react/24/outline";
import { ArrowPathIcon } from "@heroicons/react/24/outline";
import { UserCircleIcon } from "@heroicons/react/24/outline";
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";
import clientesService from "src/service/clientesService";

const data = clientesService.getAll();

const useClientes = (page, rowsPerPage) => {
  return useMemo(() => {
    return applyPagination(data, page, rowsPerPage);
  }, [page, rowsPerPage]);
};

const useClienteIds = (clientes) => {
  return useMemo(() => {
    return clientes.map((cliente) => cliente.idCliente);
  }, [clientes]);
};

const Clientes = () => {
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(5);
  const clientes = useClientes(page, rowsPerPage);
  const clienteIds = useClienteIds(clientes);
  const clienteSelection = useSelection(clienteIds);

  const handlePageChange = useCallback((event, value) => {
    setPage(value);
  }, []);

  const handleRowsPerPageChange = useCallback((event) => {
    setRowsPerPage(event.target.value);
  }, []);

  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs"));

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
              direction={isXSmall ? 'column' : 'row'}
              justifyContent="space-between"
              spacing={isXSmall ? 2 : 4}
              alignItems="center"
            >
              <Typography variant="h4" sx={{ mb: isXSmall ? 2 : 0 }}>
              Clientes
              </Typography>
              <Stack
                direction={isXSmall ? 'column' : 'row'}
                spacing={2}
                alignItems="center"
              >
                <Button
                  startIcon={<PlusIcon />}
                  variant="contained"
                  color="success"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                >
                  Agregar
                </Button>
                <Button
                  startIcon={<TrashIcon />}
                  variant="contained"
                  color="error"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                >
                  Eliminar
                </Button>
                <Button
                  startIcon={<UserCircleIcon />}
                  variant="contained"
                  color="warning"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                >
                  Modificar
                </Button>
                <Button
                  startIcon={<ArrowPathIcon />}
                  variant="contained"
                  color="info"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                >
                  Ver
                </Button>
              </Stack>
            </Stack>
            <CustomersTable
              count={data.length}
              items={clientes}
              onDeselectAll={clienteSelection.handleDeselectAll}
              onDeselectOne={clienteSelection.handleDeselectOne}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              onSelectAll={clienteSelection.handleSelectAll}
              onSelectOne={clienteSelection.handleSelectOne}
              page={page}
              rowsPerPage={rowsPerPage}
              selected={clienteSelection.selected}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Clientes.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Clientes;
