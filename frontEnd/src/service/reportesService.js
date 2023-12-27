import axios from 'axios';

const API_URL = 'http://localhost:8080/api/v1/envios/cantidadEnviosPorZona';

/**
 * Obtiene la cantidad de envíos por una zona específica.
 * @param {number} idZona El ID de la zona.
 * @returns {Promise<number>} La cantidad de envíos para la zona especificada.
 */
async function getCantidadEnviosPorZona(idZona) {
    try {
      const response = await fetch(`${API_URL}?idZona=${idZona}`);
      if (!response.ok) {
        throw new Error(`Error: ${response.status}`);
      }
      const cantidadEnvios = await response.json();
      return cantidadEnvios;

    } catch (error) {
      console.error('Error al obtener la cantidad de envíos por zona:', error);
      throw error;
    }
  }

  async function getCantidadEnviosPorEstadoYZona(idEstado, idZona) {
    try {
      const response = await axios.get(`${API_URL}?idEstado=${idEstado}&idZona=${idZona}`);
      return response.data; // Asume que el servidor devuelve directamente la cantidad
    } catch (error) {
      console.error('Error al obtener la cantidad de envíos:', error);
      throw error;
    }
  }

  export { getCantidadEnviosPorZona ,getCantidadEnviosPorEstadoYZona };
