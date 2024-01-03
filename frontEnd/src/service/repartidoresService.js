import axios from "axios";

class RepartidoresService {
  constructor(authContext) {
    this.authContext = authContext;
    this.API_URL = "http://localhost:8080" + "/api/v1/repartidores";
  }

  getAll = async () => {
    try {
      const response = await axios.get(this.API_URL, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      // Error handling
      throw error;
    }
  };

  getById = async (repartidorId) => {
    try {
      const response = await axios.get(`${this.API_URL}/${repartidorId}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      // Error handling
      throw error;
    }
  };

  create = async (repartidor) => {
    try {
      const response = await axios.post(this.API_URL, repartidor, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      // Error handling
      throw error;
    }
  };

  update = async (repartidorId, repartidorData) => {
    try {
      const response = await axios.put(`${this.API_URL}/${repartidorId}`, repartidorData, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      // Error handling
      throw error;
    }
  };

  remove = async (repartidorId) => {
    try {
      await axios.delete(`${this.API_URL}/${repartidorId}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
    } catch (error) {
      // Error handling
      throw error;
    }
  };
}

export default RepartidoresService;
