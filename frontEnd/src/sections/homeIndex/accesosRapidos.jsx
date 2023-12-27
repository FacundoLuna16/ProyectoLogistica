import { Card, CardContent, Typography, Button, Stack } from '@mui/material';
import Link from 'next/link';

const QuickAccess = () => {
  return (
    <Card>
      <CardContent>
        <Typography gutterBottom variant="h4">
          Accesos Directos
        </Typography>
        <Stack direction="column" spacing={2}>
          <Link href="/hojaRuta" passHref>
            <Button variant="contained" component="a" fullWidth>Hoja de Ruta</Button>
          </Link>
          <Link href="/envios" passHref>
            <Button variant="contained" component="a" fullWidth>Envíos</Button>
          </Link>
          <Link href="/clientes" passHref>
            <Button variant="contained" component="a" fullWidth>Clientes</Button>
          </Link>
          <Link href="/reportes" passHref>
            <Button variant="contained" component="a" fullWidth>Reportes y Estadisticas</Button>
          </Link>
        </Stack>
      </CardContent>
    </Card>
  );
};

export default QuickAccess;
