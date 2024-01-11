import axios from 'axios';
import React, { useEffect, useState , useRef} from 'react';
import Box from '@mui/material/Box';

const geocodeAddress = async (address, apiKey) => {
  try {
    const response = await axios.get(`https://geocode.search.hereapi.com/v1/geocode`, {
      params: {
        q: address,
        apiKey: apiKey
      }
    });

    if (response.data.items && response.data.items.length > 0) {
      const location = response.data.items[0].position;
      console.log(location)
      return { lat: location.lat, lng: location.lng };
    } else {
      throw new Error('No se encontraron resultados');
    }
  } catch (error) {
    console.error('Error en la geocodificación:', error);
    throw error;
  }
};
const MapComponent = ({ open, onClose, enviosDirecciones, apiKey }) => {
    const mapRef = useRef(null);

    const updatePins = async () => {
      if (mapRef.current && mapRef.current.getObjects()) {
        mapRef.current.removeObjects(mapRef.current.getObjects());
      }
  
      const newPins = await Promise.all(enviosDirecciones.map(address => geocodeAddress(address, apiKey)));
  
      newPins.forEach(pin => {
        const marker = new window.H.map.Marker({ lat: pin.lat, lng: pin.lng });
        if (mapRef.current) {
          mapRef.current.addObject(marker);
        }
      });
      
    };
    console.log("Direcciones recibidas",enviosDirecciones)

    useEffect(() => {
        if (!open || mapRef.current) return;

        const loadHereMap = () => {
            const coreScript = document.createElement('script');
            coreScript.type = 'text/javascript';
            coreScript.src = `https://js.api.here.com/v3/3.1/mapsjs-core.js`;
            coreScript.async = true;

            coreScript.onload = () => {
                // Cargar el script para los servicios
                const serviceScript = document.createElement('script');
                serviceScript.type = 'text/javascript';
                serviceScript.src = `https://js.api.here.com/v3/3.1/mapsjs-service.js`;
                serviceScript.async = true;

                // Cargar el script para eventos del mapa
                const eventsScript = document.createElement('script');
                eventsScript.type = 'text/javascript';
                eventsScript.src = `https://js.api.here.com/v3/3.1/mapsjs-mapevents.js`;
                eventsScript.async = true;

                // Cargar el script para la UI del mapa
                const uiScript = document.createElement('script');
                uiScript.type = 'text/javascript';
                uiScript.src = `https://js.api.here.com/v3/3.1/mapsjs-ui.js`;
                uiScript.async = true;
                uiScript.onload = () => {
                    // Inicializar el mapa una vez que todos los scripts se han cargado
                    initializeMap();
                };

                document.head.appendChild(serviceScript);
                document.head.appendChild(eventsScript);
                document.head.appendChild(uiScript);
            };

            document.head.appendChild(coreScript);
        };
      
        loadHereMap();

        return () => {
            if (mapRef.current) {
              mapRef.current.dispose();
              mapRef.current = null;
            }
          };
        }, [open, apiKey, enviosDirecciones]);
  
        const initializeMap = () => {
            if (mapRef.current) {
                updatePins();
                return;
            }
    
            const platform = new window.H.service.Platform({ apikey: apiKey });
            const defaultLayers = platform.createDefaultLayers();
    
            const map = new window.H.Map(
                document.getElementById('mapContainer'),
                defaultLayers.vector.normal.map,
                {
                    zoom: 10,
                    center: { lat: -38.9517, lng: -68.0592 }
                }
            );
    
            // Habilitar eventos de mapa para zoom y movimiento
            const behavior = new window.H.mapevents.Behavior(new window.H.mapevents.MapEvents(map));
            
            // Crear controles de UI para el mapa
            const ui = window.H.ui.UI.createDefault(map, defaultLayers);
    
            mapRef.current = map;
    
            updatePins();
        };

        return open ? (
            <Box 
              id="mapContainer"
              sx={{
                height: '500px',
                width: '100%',
                border: '3px solid #424242',
                borderRadius: '8px',
                boxShadow: '0 4px 8px rgba(0,0,0,0.1)',
                // Aquí puedes agregar más estilos
              }}
            />
          ) : null;
      };

export default MapComponent;