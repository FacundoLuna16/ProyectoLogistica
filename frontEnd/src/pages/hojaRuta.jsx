import React from 'react';
import {
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Button,
  Typography,
  Box
} from '@mui/material';
import { Layout as DashboardLayout } from 'src/layouts/dashboard/layout';


const HojaRuta = () => {
  
  const quitarDePendientes = (envioId) => {

  };

  return (
    <Box sx={{ m: 4 }}>
      <Typography variant="h4" sx={{ mb: 4 }}>
        Hoja de ruta

      </Typography>
    </Box>
  );
};

HojaRuta.getLayout = (page) => <DashboardLayout>{page}</DashboardLayout>;

export default HojaRuta;

