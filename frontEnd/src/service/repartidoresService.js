import axios from "axios";

const API_URL = process.env.NEXT_PUBLIC_APP_API_URL + "/api/v1/repartidores";
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
    // Error handling
    throw error;
  }
};

const getById = async (repartidorId) => {
  try {
    const response = await axios.get(`${API_URL}/${repartidorId}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};

const create = async (repartidor) => {
  try {
    const response = await axios.post(API_URL, repartidor, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};

const update = async (repartidorId, repartidorData) => {
  try {
    const response = await axios.put(`${API_URL}/${repartidorId}`, repartidorData, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return response.data;
  } catch (error) {
    // Error handling
    throw error;
  }
};

const remove = async (repartidorId) => {
  try {
    await axios.delete(`${API_URL}/${repartidorId}`, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
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
