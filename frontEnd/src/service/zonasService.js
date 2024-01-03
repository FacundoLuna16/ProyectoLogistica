// zoneService.js
import axios from 'axios';

const API_URL = 'http://localhost:8080/api/v1/zona';

const getAll = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data; // Suponiendo que la respuesta contiene los datos de las zonas
  } catch (error) {
    console.error('Error al obtener las zonas', error);
    throw error; // Puedes manejar el error según tus necesidades
  }
};

export const zoneService = {
  getAll,
};
