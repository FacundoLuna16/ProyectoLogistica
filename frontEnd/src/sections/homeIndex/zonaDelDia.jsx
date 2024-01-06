import React, { useState, useEffect } from 'react';
import { Card, CardContent, Typography } from '@mui/material';
import ZoneService from 'src/service/zonaService';
import { useAuth } from "src/contexts/AuthContext";

const ZoneOfTheDay = () => {
  const authContext = useAuth();
  const [todasLasZonas, setTodasLasZonas] = useState([]);
  const [zonaDelDia, setZonaDelDia] = useState(null); // Estado para la zona del día
  const [isLoading, setIsLoading] = useState(true); // Estado para la carga
  const zonaService = new ZoneService(authContext);

  const fetchZonas = async () => {
    setIsLoading(true);
    try {
      const data = await zonaService.getAll();
      setTodasLasZonas(data);
    } catch (error) {
      console.error("Error al obtener Zonas:", error);
    }
    setIsLoading(false);
  };

  useEffect(() => {
    fetchZonas();
  }, []);

  useEffect(() => {
    if (todasLasZonas.length > 0) {
      const diaActual = new Date().toLocaleDateString('es-ES', { weekday: 'long' });
      const diaCapitalizado = diaActual.charAt(0).toUpperCase() + diaActual.slice(1).toLowerCase();
      const zonaEncontrada = todasLasZonas.find(zona => zona.dia === diaCapitalizado);
      setZonaDelDia(zonaEncontrada);
    }
  }, [todasLasZonas]); // Este useEffect depende de todasLasZonas

  if (isLoading) {
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
  
  if (!zonaDelDia) { // Verificar si zonaDelDia está definido antes de intentar renderizar
    return (
      <Card>
        <CardContent>
          <Typography gutterBottom variant="h4">
            Zona del Día
          </Typography>
          <Typography variant="body2">
            No se encontró la zona para el día actual.
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

export default ZoneOfTheDay;
