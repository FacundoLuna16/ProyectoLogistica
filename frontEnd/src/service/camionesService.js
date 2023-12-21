import axios from "axios";
import { useAuth } from "src/contexts/AuthContext";

const API_URL = process.env.NEXT_PUBLIC_APP_API_URL + "/api/v1/camiones";
// const token = localStorage.getItem("token");


const getAll = async () => {
  try {
    
    const { keycloak } = useAuth();
    console.log("token", token);
    const response = await axios.get(API_URL, {
      headers: {
        Authorization: `Bearer ${keycloak.token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const getById = async (patente) => {
  try {
    const response = await axios.get(`${API_URL}/${patente}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const create = async (camion) => {
  try {
    const response = await axios.post(API_URL, camion, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const update = async (patente, camionData) => {
  try {
    const response = await axios.put(`${API_URL}/${patente}`, camionData, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const remove = async (patente) => {
  try {
    await axios.delete(`${API_URL}/${patente}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
  } catch (error) {
    throw error;
  }
};

export default {
  getAll,
  getById,
  create,
  update,
  remove,
};

