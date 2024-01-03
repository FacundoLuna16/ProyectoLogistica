import axios from 'axios';

const API_URL = 'http://localhost:8080/api/v1/envios/cantidadEnviosPorZona';

// Asumiendo que tienes un contexto de autenticación similar al de tu clase RepartidoresService
class EnviosService {
  constructor(authContext) {
    this.authContext = authContext;
  }

  async getCantidadEnviosPorZona(idZona) {
    try {
      const response = await axios.get(`${API_URL}?idZona=${idZona}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      console.error('Error al obtener la cantidad de envíos por zona:', error);
      throw error;
    }
  }

  async getCantidadEnviosPorEstadoYZona(idEstado, idZona) {
    try {
      const response = await axios.get(`${API_URL}?idEstado=${idEstado}&idZona=${idZona}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      console.error('Error al obtener la cantidad de envíos por estado y zona:', error);
      throw error;
    }
  }
}

export default EnviosService;
