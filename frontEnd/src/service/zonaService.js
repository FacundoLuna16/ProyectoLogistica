// En un archivo llamado zoneService.js

const BASE_URL = 'http://localhost:8080/api/v1/zona';

class ZoneService {
  constructor(authContext) {
    this.authContext = authContext;
  }

  getAll = async () => {
    try {
      const response = await fetch(BASE_URL, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      if (!response.ok) {
        throw new Error('Error al obtener las zonas');
      }
      return await response.json();
    } catch (error) {
      console.error('Error en ZoneService.getAll:', error);
      throw error;
    }
  }
}

export default ZoneService;