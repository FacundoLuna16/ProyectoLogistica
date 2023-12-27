import axios from "axios";

class EnvioService {
  constructor(authContext) {
    this.authContext = authContext;
    this.API_URL = "http://localhost:8080/api/v1/envios";
  }

  getAll = async () => {
    try {
      const response = await axios.get(this.API_URL, {
        // headers: {
        //   Authorization: `Bearer ${this.authContext.token}`,
        // },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  getById = async (numeroFactura) => {
    try {
      const response = await axios.get(`${this.API_URL}/${numeroFactura}`, {
        // headers: {
        //   Authorization: `Bearer ${this.authContext.token}`,
        // },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  create = async (envio) => {
    try {
      const response = await axios.post(this.API_URL, envio);
      return response.data;
    } catch (error) {
      // Revisa si hay una respuesta del backend y captura el mensaje de error
      const errorMessage = error.response && error.response.data 
                           ? error.response.data 
                           : "Error al realizar la solicitud";
      throw new Error(errorMessage);
    }
  };
  

  update = async (numeroFactura, envioData) => {
    try {
      const response = await axios.put(`${this.API_URL}/${numeroFactura}`, envioData, {
        // headers: {
        //   Authorization: `Bearer ${this.authContext.token}`,
        // },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  remove = async (numeroFactura) => {
    try {
      await axios.delete(`${this.API_URL}/${numeroFactura}`, {
        // headers: {
        //   Authorization: `Bearer ${this.authContext.token}`,
        // },
      });
    } catch (error) {
      throw error;
    }
  };
}

export default EnvioService;
