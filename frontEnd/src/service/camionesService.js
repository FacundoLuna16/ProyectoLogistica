// camionesService.js
import axios from "axios";
import { useAuth } from "src/contexts/AuthContext";

class CamionesService {
  constructor(authContext) {
    this.authContext = authContext;
    this.API_URL = process.env.NEXT_PUBLIC_APP_API_URL + "/api/v1/camiones";
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
      throw error;
    }
  };

  getById = async (patente) => {
    try {
      const response = await axios.get(`${this.API_URL}/${patente}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  create = async (camion) => {
    try {
      const response = await axios.post(this.API_URL, camion, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  update = async (patente, camionData) => {
    try {
      const response = await axios.put(`${this.API_URL}/${patente}`, camionData, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  remove = async (patente) => {
    try {
      await axios.delete(`${this.API_URL}/${patente}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
    } catch (error) {
      throw error;
    }
  };
}

export default CamionesService;
