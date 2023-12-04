import axios from "axios";

const API_URL = "http://localhost:8080/api/v1/clientes";

const getAll = async () => {
  try {
    const response = await axios.get(API_URL);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const getById = async (clienteId) => {
  try {
    const response = await axios.get(`${API_URL}/${clienteId}`);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const create = async (cliente) => {
  try {
    const response = await axios.post(API_URL, cliente);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const update = async (clienteId, clienteData) => {
  try {
    const response = await axios.put(`${API_URL}/${clienteId}`, clienteData);
    return response.data;
  } catch (error) {
    throw error;
  }
};

const remove = async (clienteId) => {
  try {
    await axios.delete(`${API_URL}/${clienteId}`);
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
