import React, { useState, useEffect } from 'react';
import { Card, CardContent, Typography } from '@mui/material';
import { zoneService } from 'src/service/zonaService';

const ZoneOfTheDay = () => {
  const [todasLasZonas, setTodasLasZonas] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await zoneService.getAll();
        setTodasLasZonas(response);
      } catch (error) {
        console.error('Error al obtener las zonas', error);
      }
    };

    fetchData();
  }, []);

  // Obtener el día actual
  const diaActual = new Date().toLocaleDateString('es-ES', { weekday: 'long' });
  const diaCapitalizado = diaActual.charAt(0).toUpperCase() + diaActual.slice(1);

  // Encontrar la zona para el día actual
  const zonaDelDia = todasLasZonas?.find(zona => zona.dia === diaCapitalizado);

  if (!todasLasZonas || !zonaDelDia) {
    return (
      <Card>
        <CardContent>
          <Typography gutterBottom variant="h4">
            Zona del Día
          </Typography>
          <Typography variant="body2">
            Cargando...
          </Typography>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardContent>
        <Typography gutterBottom variant="h4">
          Zona del Día - {zonaDelDia.dia}
        </Typography>
        <Typography variant="body2">
          Barrios:
        </Typography>
        <ul>
          {zonaDelDia.barrios.map((barrio, index) => (
            <li key={index}>{barrio.nombre}</li>
          ))}
        </ul>
      </CardContent>
    </Card>
  );
};

export default ZoneOfTheDay;