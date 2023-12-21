import axios from "axios";

const API_URL = process.env.NEXT_PUBLIC_APP_API_URL + "/api/v1/clientes";
const token = localStorage.getItem("token");

const getAll = async () => {
  try {
    const response = await axios.get(API_URL, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const getById = async (clienteId) => {
  try {
    const response = await axios.get(`${API_URL}/${clienteId}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const create = async (cliente) => {
  try {
    const response = await axios.post(API_URL, cliente, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const update = async (clienteId, clienteData) => {
  try {
    const response = await axios.put(`${API_URL}/${clienteId}`, clienteData, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    throw error;
  }
};

const remove = async (clienteId) => {
  try {
    await axios.delete(`${API_URL}/${clienteId}`, {
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
