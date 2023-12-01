import { useCallback, useMemo, useState } from "react";
import Head from "next/head";
import { subDays, subHours } from "date-fns";
import PlusIcon from "@heroicons/react/24/solid/PlusIcon";
import { Box, Button, Container, Stack, Typography } from "@mui/material";
import { useSelection } from "src/hooks/use-selection";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { CustomersTable } from "src/sections/repartidores/repartidores-table";
import { applyPagination } from "src/utils/apply-pagination";
import { TrashIcon } from "@heroicons/react/24/outline";
import { ArrowPathIcon } from "@heroicons/react/24/outline";
import { UserCircleIcon } from "@heroicons/react/24/outline";
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";

// Funciones para generar IDs y nombres aleatorios
const generateId = () => Math.floor(Math.random() * 10000).toString();
const nombres = [
  "Marta",
  "Juan",
  "Pedro",
  "Laura",
  "José",
  "Ana",
  "Luis",
  "Sofía",
  "Carlos",
  "Lucía",
];
const apellidos = [
  "García",
  "Fernández",
  "González",
  "Rodríguez",
  "López",
  "Martínez",
  "Sánchez",
  "Pérez",
  "Martín",
  "Gómez",
];

const data = Array.from({ length: 10 }, () => ({
  idRepartidor: generateId(),
  nombre: nombres[Math.floor(Math.random() * nombres.length)],
  apellido: apellidos[Math.floor(Math.random() * apellidos.length)],
  createdAt: subDays(
    subHours(new Date(), Math.floor(Math.random() * 10)),
    Math.floor(Math.random() * 10)
  ).getTime(),
}));

const useCustomers = (page, rowsPerPage) => {
  return useMemo(() => {
    return applyPagination(data, page, rowsPerPage);
  }, [page, rowsPerPage]);
};

const useCustomerIds = (customers) => {
  return useMemo(() => {
    return customers.map((customer) => customer.id);
  }, [customers]);
};

const Repartidores = () => {
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(5);
  const customers = useCustomers(page, rowsPerPage);
  const customersIds = useCustomerIds(customers);
  const customersSelection = useSelection(customersIds);

  const handlePageChange = useCallback((event, value) => {
    setPage(value);
  }, []);

  const handleRowsPerPageChange = useCallback((event) => {
    setRowsPerPage(event.target.value);
  }, []);

  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down('xs')); // 'xs'

  return (
    <>
      <Head>
        <title>Repartidores | Sistema de Gestión de Envios</title>
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
                Repartidores
              </Typography>
              <Stack
                direction={isXSmall ? 'column' : 'row'}
                spacing={2}
                color = "success"
                alignItems="center"
              >
                <Button
                  startIcon={<PlusIcon />}
                  variant="contained"
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
              items={customers}
              onDeselectAll={customersSelection.handleDeselectAll}
              onDeselectOne={customersSelection.handleDeselectOne}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              onSelectAll={customersSelection.handleSelectAll}
              onSelectOne={customersSelection.handleSelectOne}
              page={page}
              rowsPerPage={rowsPerPage}
              selected={customersSelection.selected}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Repartidores.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Repartidores;
