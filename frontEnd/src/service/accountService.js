import axios from 'axios';

const API_URL = process.env.NEXT_PUBLIC_APP_API_URL + '/api/user/';

// Consultar a un endpoint el nombre de usuario
const getNombreUsuario = () => {
  return axios.get(API_URL + 'nombreUsuario', { headers: authHeader() });
};

// Consultar a un endpoint el email del usuario
const getEmailUsuario = () => {
  return axios.get(API_URL + 'emailUsuario', { headers: authHeader() });
};

// Consultar a un endpoint el rol del usuario
const getRolUsuario = () => {
  return axios.get(API_URL + 'rolUsuario', { headers: authHeader() });
};

// Consultar a un endpoint el id del usuario
const getIdUsuario = () => {
  return axios.get(API_URL + 'idUsuario', { headers: authHeader() });
};

//retornar
export default {
  getNombreUsuario,
  getEmailUsuario,
  getRolUsuario,
  getIdUsuario
};
