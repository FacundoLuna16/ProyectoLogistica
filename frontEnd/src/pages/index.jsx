import Head from 'next/head';
import { Box, Container, Grid } from '@mui/material';
import { Layout as DashboardLayout } from 'src/layouts/dashboard/layout';
import QuickSummary from 'src/sections/homeIndex/estadisticaEnvios';
import ImmediateAlerts from 'src/sections/homeIndex/alertaInemdiata';
import QuickAccess from 'src/sections/homeIndex/accesosRapidos';
import WeatherStatus from 'src/sections/homeIndex/clima';
import ZoneOfTheDay from 'src/sections/homeIndex/zonaDelDia';

const getZoneByDay = () => {
  const dayOfWeek = new Date().getDay();
  const zoneMapping = { 2: 1, 3: 2, 4: 3, 5: 4 };
  return zoneMapping[dayOfWeek] || 'Hoy no se realizan entregas'; 
};

const Page = () => (
  <>
    <Head>
      <title>Inicio | Sistema de Gestión de Envíos</title>
    </Head>
    <Box component="main" sx={{ flexGrow: 1, py: 8 }}>
      <Container maxWidth="xl">
        <Grid container spacing={3}>
          {/* <Grid xs={12} md={6} lg={4} item>
            <QuickSummary />
          </Grid> */}
          {/* <Grid xs={12} md={6} lg={4} item>
            <ImmediateAlerts />
          </Grid> */}
          <Grid xs={12} md={6} lg={4} item>
            <QuickAccess />
          </Grid>
          <Grid xs={12} md={6} lg={4} item>
            <WeatherStatus />
          </Grid>
          <Grid xs={12} md={6} lg={4} item>
            <ZoneOfTheDay/>
          </Grid>
        </Grid>
      </Container>
    </Box>
  </>
);

Page.getLayout = (page) => (
  <DashboardLayout>
    {page}
  </DashboardLayout>
);

export default Page;