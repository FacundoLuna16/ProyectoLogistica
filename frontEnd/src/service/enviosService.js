import axios from "axios";

const API_URL = process.env.NEXT_PUBLIC_APP_API_URL + "/api/v1/envios";

const getAll = async () => {
    try {
        const response = await axios.get(API_URL);
        return response.data;
    } catch (error) {
        throw error;
    }
    };

const getById = async (numeroFactura) => {
    try {
        const response = await axios.get(`${API_URL}/${numeroFactura}`);
        return response.data;
    } catch (error) {
        throw error;
    }
    }

const create = async (envio) => {
    try {
        const response = await axios.post(API_URL, envio);
        return response.data;
    } catch (error) {
        throw error;
    }
    }

const update = async (numeroFactura, envioData) => {
    try {
        const response = await axios.put(`${API_URL}/${numeroFactura}`, envioData);
    } catch (error) {
        throw error;
    }
    }

const remove = async (numeroFactura) => {
    try {
        await axios.delete(`${API_URL}/${numeroFactura}`);
    } catch (error) {
        throw error;
    }
    }




export default {
    getAll,
    getById,
    create,
    update,
    remove,
  };