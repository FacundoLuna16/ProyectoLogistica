import axios from "axios";


class ClientesService {
  
  constructor(authContext) {
    this.authContext = authContext;
    this.API_URL ="http://localhost:8080" + "/api/v1/clientes";
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

  getById = async (clienteId) => {
    try {
      const response = await axios.get(`${this.API_URL}/${clienteId}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  create = async (cliente) => {
    try {
      const response = await axios.post(this.API_URL, cliente, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  update = async (clienteId, clienteData) => {
    try {
      const response = await axios.put(`${this.API_URL}/${clienteId}`, clienteData, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  remove = async (clienteId) => {
    try {
      await axios.delete(`${this.API_URL}/${clienteId}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
    } catch (error) {
      throw error;
    }
  };
}
export default ClientesService;
