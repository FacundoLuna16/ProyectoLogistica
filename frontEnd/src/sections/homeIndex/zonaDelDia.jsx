import { Card, CardContent, Typography } from '@mui/material';

const ZoneOfTheDay = ({ zone }) => {
  // La variable `zone` es pasada como prop al componente

  return (
    <Card>
      <CardContent>
        <Typography gutterBottom variant="h4">
          Zona del Día
        </Typography>
        <Typography variant="body2">
          {`Hoy es el turno de la zona ${zone}.`}
        </Typography>
      </CardContent>
    </Card>
  );
};

export default ZoneOfTheDay;
