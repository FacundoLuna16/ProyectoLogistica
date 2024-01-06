import axios from 'axios';

class ZoneService {
  constructor(authContext) {
    this.authContext = authContext;
    this.API_URL = 'http://localhost:8080/api/v1/zona';
  }

  getAll = async () => {
    try {
      const response = await axios.get(this.API_URL, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      console.log("Peticion:", response.data)
      return response.data;
    } catch (error) {
      throw error;
    }
  };
}

export default ZoneService;