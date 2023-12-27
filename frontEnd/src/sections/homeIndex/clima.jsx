import React, { useState, useEffect } from 'react';
import { Box, Typography, Grid, Card, CardContent } from '@mui/material';
import { WbSunny, Cloud, Grain, AcUnit } from '@mui/icons-material';
import axios from 'axios';

const API_KEY = '17b5d8c5aefcb51d36f46e077ca75daa';

const WeatherWidget = () => {
  const [weatherData, setWeatherData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchWeather = async () => {
      try {
        const url = `https://api.openweathermap.org/data/2.5/weather?q=Neuqu%C3%A9n,AR&appid=${API_KEY}&units=metric`;
        const response = await axios.get(url);
        setWeatherData(response.data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchWeather();
  }, []);

  const renderWeatherIcon = (main) => {
    switch (main) {
      case 'Clear':
        return <WbSunny style={{ color: 'orange', fontSize: 40 }} />;
      case 'Clouds':
        return <Cloud style={{ color: 'gray', fontSize: 40 }} />;
      case 'Rain':
      case 'Drizzle':
        return <Grain style={{ color: 'blue', fontSize: 40 }} />;
      case 'Snow':
        return <AcUnit style={{ color: 'lightblue', fontSize: 40 }} />;
      default:
        return <Cloud style={{ color: 'gray', fontSize: 40 }} />;
    }
  };

  if (loading) return <Typography>Cargando...</Typography>;
  if (error) return <Typography>Error: {error}</Typography>;

  return (
    <Card>
      <CardContent>
        <Typography variant="h5" component="h2">Neuquén</Typography>
        <Grid container spacing={2} alignItems="center">
          <Grid item>
            {weatherData && renderWeatherIcon(weatherData.weather[0].main)}
          </Grid>
          <Grid item>
            <Typography variant="body1">{weatherData.weather[0].main}</Typography>
            <Typography variant="body2">Temperatura: {weatherData.main.temp}°C</Typography>
            <Typography variant="body2">Humedad: {weatherData.main.humidity}%</Typography>
            <Typography variant="body2">Viento: {weatherData.wind.speed} m/s</Typography>
          </Grid>
        </Grid>
      </CardContent>
    </Card>
  );
};

export default WeatherWidget;