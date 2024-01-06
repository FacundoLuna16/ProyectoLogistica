import axios from "axios";

class HojaDelDiaService {

    constructor(authContext) {
        this.authContext = authContext;
        this.API_URL ="http://localhost:8080" + "/api/v1/hojas";
    }

    getAll = async () => {
        try {
            const response = await axios.get(this.API_URL, {
                headers: {
                    Authorization: `Bearer ${this.authContext.keycloak.token}`,
                  },
            });
            return response.data;
        } catch (error) {
                throw error;
        }
    };


    getByFechaReparto = async (fechaReparto) => {
        try {
            const response = await axios.get(`${this.API_URL}/getHojaDelDia`, {
                // query params
                params: {
                    //Formato de la fecha debe ser YYYY-MM-DD
                    fechaReparto : fechaReparto,
                },
                headers: {
                    Authorization: `Bearer ${this.authContext.keycloak.token}`,
                  },
            });
            return response.data;
        } catch (error) {
            throw error;
        }
    };

    iniciarEntrega = async (idHoja, idRepartidor, patenteCamion) => {
        try {
            // Convertir los valores a números si es necesario
            const idHojaInt = parseInt(idHoja);
            const idRepartidorInt = parseInt(idRepartidor);
    
            //alert(idHoja + idRepartidor + patenteCamion) 
            // Construir la URL con los parámetros
            const url = `${this.API_URL}/iniciarEntrega?idHojaDelDia=${idHojaInt}&Patente=${patenteCamion}&idRepartidor=${idRepartidorInt}`;
    
            const response = await axios.put(url, {}, { 
                headers: {
                    Authorization: `Bearer ${this.authContext.keycloak.token}`,
                }
            });
            
            return response.data;
        } catch (error) {
            throw error;
        }
    };
    
    

    cerrarHojaDelDia = async (idHojaDelDia, arregloStrings) => {
        try {
            const url = `${this.API_URL}/cerrarHojaDelDia`;
            const params = {
                idHojaDelDia: idHojaDelDia,
            };
    
            const response = await axios.put(url, arregloStrings, { 
                params: params,
                headers: {
                    Authorization: `Bearer ${this.authContext.keycloak.token}`,
                  },
            });
    
            return response.data;
        } catch (error) {
            throw error;
        }
    };
}

export default HojaDelDiaService;