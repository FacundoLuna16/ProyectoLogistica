import axios from "axios";

const API_URL = "http://localhost:8080/api/v1/camiones";

const getAll = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const getById = async (patente) => {
  try {
    const response = await axios.get(`${API_URL}/${patente}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const create = async (camion) => {
  try {
    const response = await axios.post(API_URL, camion);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const update = async (patente, camionData) => {
  try {
    const response = await axios.put(`${API_URL}/${patente}`, camionData);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const remove = async (patente) => {
  try {
    await axios.delete(`${API_URL}/${patente}`);
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
