import axios from 'axios';

const BASE_URL = 'http://localhost:8080/api/v1/zona';

class ZoneService {
  constructor(authContext) {
    this.authContext = authContext;
  }

  getAll = async () => {
    try {
      const response = await axios.get(BASE_URL, {
        headers: {
          Authorization: `Bearer ${this.authContext.keycloak.token}`,
        },
      });
      return response.data;
    } catch (error) {
      throw error;
    }
  }
}

export default ZoneService;