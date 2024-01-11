import axios from "axios";

class EnvioService {
  constructor(authContext) {
    this.authContext = authContext;
    this.API_URL = "http://localhost:8080/api/v1/envios";
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

  getById = async (numeroFactura) => {
    try {
      const response = await axios.get(`${this.API_URL}/${numeroFactura}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  create = async (envio) => {
    try {
      const response = await axios.post(this.API_URL, envio, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      
      return response.data;
    } catch (error) {
      throw error;
    }
  };
  

  update = async (numeroFactura, envioData) => {
    try {
      const response = await axios.put(`${this.API_URL}/${numeroFactura}`, envioData, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  remove = async (numeroFactura) => {
    try {
      await axios.delete(`${this.API_URL}/${numeroFactura}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
    } catch (error) {
      throw error;
    }
  };

  cerrarEnvio = async (numeroFactura,motivo) => {
    try {
      const params = {
        nroFactura : numeroFactura,
        descripcion : motivo
      }
      await axios.put(`${this.API_URL}/cerrarEnvio`, {},{
        params: params,
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
    }
    catch
    (error) {
      throw error;
    }
  }

  subirImagen = async (numeroFactura, imagen) => {
    try {
      const formData = new FormData();
      formData.append("imagen", imagen);

      const response = await axios.put(
        `${this.API_URL}/subirImagen/${numeroFactura}`,
        formData,
        {
          headers: {
            Authorization: `Bearer ${this.authContext.keycloak.token}`,
            "Content-Type": "multipart/form-data",
          },
        }
      );
      return response.data;
    } catch (error) {
      throw error;
    }
  };

  obtenerImagen = async (numeroFactura) => {
    try {
      const response = await axios.get(`${this.API_URL}/obtenerImagen/${numeroFactura}`, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
        responseType: 'arraybuffer',
      });
      //valida que la respuesta no sea vacia
      if (response.data.byteLength === 0) {
        return null;
      }
      
      // Convierte la respuesta (array de bytes) a un blob y crea una URL para la imagen
      const blob = new Blob([response.data], { type: response.headers['content-type'] });
      const imageUrl = URL.createObjectURL(blob)
      return imageUrl;
    } catch (error) {
      throw error;
    }
  };


}

export default EnvioService;
