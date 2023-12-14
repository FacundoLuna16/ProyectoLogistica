import React, { useState } from "react";
import {
  Box,
  Container,
  Grid,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  Paper,
  Button,
  Stack,
} from "@mui/material";
import { OverviewLatestOrders } from "src/sections/overview/overview-latest-orders";
import Head from "next/head";
import { Layout as DashboardLayout } from "src/layouts/dashboard/layout";
import { TrashIcon } from "@heroicons/react/24/outline";
import { ArrowPathIcon } from "@heroicons/react/24/outline";
import { UserCircleIcon } from "@heroicons/react/24/outline";
import { PlusIcon } from "@heroicons/react/24/outline";
import { useTheme } from "@mui/material/styles";
import useMediaQuery from "@mui/material/useMediaQuery";

const Envios = () => {
  const theme = useTheme();
  const isXSmall = useMediaQuery(theme.breakpoints.down("xs")); // 'xs'

  const [zonaSeleccionada, setZonaSeleccionada] = useState("");

  // Datos simulados para las zonas - Deberías obtener estos datos de tu backend
  const zonas = ["Zona 1", "Zona 2", "Zona 3"];

  // Simulación de cambio de zona
  const handleZonaChange = (event) => {
    setZonaSeleccionada(event.target.value);
    // Aquí también podrías hacer una llamada a tu API para obtener los envíos de la zona seleccionada
  };

  // Datos simulados de los envíos - Deberías obtener estos datos de tu backend
  const envios = [
    // ... tus envíos
  ];

  // Filtrar los envíos por la zona seleccionada
  const enviosFiltradosPorZona = envios.filter((envio) => envio.zona === zonaSeleccionada);

  return (
    <>
      <Head>
        <title>Envíos | Sistema de Gestión de Envíos</title>
      </Head>
      <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
      <Paper>
            <Grid container spacing={3} sx={{ mb: 4 }}>
              <Stack direction={isXSmall ? "column" : "row"} spacing={2} alignItems="center">
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
            </Grid>
          </Paper>
        <Container maxWidth="xl">
          <FormControl fullWidth sx={{ mb: 3 }}>
            <InputLabel>Zona</InputLabel>
            <Select value={zonaSeleccionada} label="Zona" onChange={handleZonaChange}>
              {zonas.map((zona) => (
                <MenuItem key={zona} value={zona}>
                  {zona}
                </MenuItem>
              ))}
            </Select>
          </FormControl>

          <Grid container spacing={3}>
            <Grid xs={12}>
              <OverviewLatestOrders orders={enviosFiltradosPorZona} sx={{ height: "100%" }} />
            </Grid>
          </Grid>
          
        </Container>
      </Box>
    </>
  );
};

Envios.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default Envios;
