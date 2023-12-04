import axios from "axios";

const API_URL = "http://localhost:8080/api/v1/repartidores";

const getAll = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};

const getById = async (repartidorId) => {
  try {
    const response = await axios.get(`${API_URL}/${repartidorId}`);
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};

const create = async (repartidor) => {
  try {
    const response = await axios.post(API_URL, repartidor);
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};

// servicio repartidoresService

const update = async (repartidorId, repartidorData) => {
  try {
    const response = await axios.put(`${API_URL}/${repartidorId}`, repartidorData);
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};


const remove = async (repartidorId) => {
  try {
    await axios.delete(`${API_URL}/${repartidorId}`);
  } catch (error) {
    // Error handling
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
