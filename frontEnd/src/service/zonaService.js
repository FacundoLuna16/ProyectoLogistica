// En un archivo llamado zoneService.js

const BASE_URL = 'http://localhost:8080/api/v1/zona';


export const zoneService = {
  getAll: async () => {
    try {
      const response = await fetch(BASE_URL);
      if (!response.ok) {
        throw new Error('Error al obtener las zonas');
      }
      return await response.json();
    } catch (error) {
      console.error('Error en zoneService.getAll:', error);
      throw error;
    }
  }
};