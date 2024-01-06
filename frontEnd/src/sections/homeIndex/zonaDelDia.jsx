import React, { useState, useEffect } from 'react';
import { Card, CardContent, Typography } from '@mui/material';
import ZoneService from 'src/service/zonaService'; // Asegúrate de que esta ruta sea correcta
import { useAuth } from "src/contexts/AuthContext";

const ZoneOfTheDay = () => {
  const authContext = useAuth(); // Obtén tu contexto de autenticación
  const [todasLasZonas, setTodasLasZonas] = useState(null);
  const zonaService = new ZoneService(authContext)

  const fetchZonas = async () => {
    try{
      const data = await zonaService.getAll()
      setTodasLasZonas(data);
    } catch (error){
      console.error("Error al obtener Zonas:", error)
    }
  }

  useEffect (() => {
    fetchZonas();
  },[]);


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

export default ZoneOfTheDay;
