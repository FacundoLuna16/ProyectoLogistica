import axios from "axios";

class HojaDelDiaService {

    constructor(authContext) {
        this.authContext = authContext;
        this.API_URL ="http://localhost:8080" + "/api/v1/hojas";
    }

    getAll = async () => {
        try {
            const response = await axios.get(this.API_URL, {
                // headers: {
                //   Authorization: `Bearer ${this.authContext.token}`,
                // },
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
                // headers: {
                //   Authorization: `Bearer ${this.authContext.token}`,
                // },
            });
            return response.data;
        } catch (error) {
            throw error;
        }
    };
}

export default HojaDelDiaService;