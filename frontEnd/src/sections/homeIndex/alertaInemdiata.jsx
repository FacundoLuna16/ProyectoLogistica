import { Card, CardContent, Typography, List, ListItem, ListItemText } from '@mui/material';

const ImmediateAlerts = () => {
  // Aquí podrías incluir la lógica para recuperar y mostrar las alertas

  return (
    <Card>
      <CardContent>
        <Typography gutterBottom variant="h4">
          Alertas Inmediatas
        </Typography>
        <List>
          {/* Generar ListItem para cada alerta */}
        </List>
      </CardContent>
    </Card>
  );
};

export default ImmediateAlerts;
