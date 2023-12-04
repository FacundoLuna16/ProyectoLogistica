import { useCallback, useEffect, useMemo, useState } from "react";
import Head from "next/head";
import PlusIcon from "@heroicons/react/24/solid/PlusIcon";
import { Box, Button, Container, Stack, Typography } from "@mui/material";
import { useSelection } from "src/hooks/use-selection";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { CustomersTable } from "src/sections/repartidores/repartidores-table";
import { applyPagination } from "src/utils/apply-pagination";
import { ArrowPathIcon, UserCircleIcon } from "@heroicons/react/24/outline";
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";
import repartidoresService from "../service/repartidoresService";
import AgregarRepartidorDialog from "src/sections/repartidores/altaRepartidores";
import ConsultarRepartidorDialog from "src/sections/repartidores/consultarRepartidor";
import ModificarRepartidorDialog from "src/sections/repartidores/ModificarRepartidor";

const Repartidores = () => {
  const [repartidores, setRepartidores] = useState([]);
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(5);

  useEffect(() => {
    const fetchRepartidores = async () => {
      try {
        const data = await repartidoresService.getAll();
        setRepartidores(data);
      } catch (error) {
        console.error("Error al obtener repartidores:", error);
      }
    };

    fetchRepartidores();
  }, []);

  const paginatedRepartidores = useMemo(() => {
    return applyPagination(repartidores, page, rowsPerPage);
  }, [repartidores, page, rowsPerPage]);

  const repartidoresIds = useMemo(() => {
    return paginatedRepartidores.map((repartidor) => repartidor.idRepartidor);
  }, [paginatedRepartidores]);

  const repartidoresSelection = useSelection(repartidoresIds);

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

  const handleRepartidorAdded = (repartidor) => {
    setRepartidores([...repartidores, repartidor]);
  };

  const [dialogConsultaOpen, setDialogConsultaOpen] = useState(false);
  const [repartidorSeleccionado, setRepartidorSeleccionado] = useState({
    nombre: "",
    apellido: "",
  });

  // Función para abrir el diálogo de consulta con los detalles del repartidor seleccionado
  const handleVerDetalle = (repartidorId) => {
    const repartidorDetalle = repartidores.find((r) => r.idRepartidor === repartidorId) || {
      nombre: "",
      apellido: "",
    };
    setRepartidorSeleccionado(repartidorDetalle);
    setDialogConsultaOpen(true);
  };

  const [dialogModificacionOpen, setDialogModificacionOpen] = useState(false);

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
              direction={isXSmall ? "column" : "row"}
              justifyContent="space-between"
              spacing={isXSmall ? 2 : 4}
              alignItems="center"
            >
              <Typography variant="h4" sx={{ mb: isXSmall ? 2 : 0 }}>
                Repartidores
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
                <AgregarRepartidorDialog
                  open={dialogOpen}
                  onClose={handleDialogClose}
                  onRepartidorAdded={handleRepartidorAdded}
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
                <ModificarRepartidorDialog
                  open={dialogModificacionOpen}
                  onClose={() => setDialogModificacionOpen(false)}
                />
                <Button
                  startIcon={<ArrowPathIcon />}
                  variant="contained"
                  color="info"
                  sx={{ mb: isXSmall ? 1 : 0 }}
                  onClick={() => handleVerDetalle(/* id del repartidor seleccionado */)}
                >
                  Ver
                </Button>
                <ConsultarRepartidorDialog
                  open={dialogConsultaOpen}
                  onClose={() => setDialogConsultaOpen(false)}
                  repartidor={repartidorSeleccionado}
                />
              </Stack>
            </Stack>
            <CustomersTable
              count={repartidores.length}
              items={paginatedRepartidores}
              onDeselectAll={repartidoresSelection.handleDeselectAll}
              onDeselectOne={repartidoresSelection.handleDeselectOne}
              onPageChange={handlePageChange}
              onRowsPerPageChange={handleRowsPerPageChange}
              onSelectAll={repartidoresSelection.handleSelectAll}
              onSelectOne={repartidoresSelection.handleSelectOne}
              page={page}
              rowsPerPage={rowsPerPage}
              selected={repartidoresSelection.selected}
            />
          </Stack>
        </Container>
      </Box>
    </>
  );
};

Repartidores.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Repartidores;
