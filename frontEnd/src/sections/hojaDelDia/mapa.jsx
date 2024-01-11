import { GoogleMap, LoadScript, DirectionsRenderer, DirectionsService } from "@react-google-maps/api";
import PlacesAutocomplete, { geocodeByAddress, getLatLng } from "react-places-autocomplete";
import { useState, useEffect } from "react";

const MapComponent = ({ directions }) => {
  const mapContainerStyle = {
    height: "400px",
    width: "800px"
  };
  const center = { lat: 40.416775, lng: -3.703790 }; // Coordenadas de ejemplo (Madrid, España)

  const [currentDirections, setCurrentDirections] = useState(null);

  const handleDirectionsResponse = (response) => {
    if (response.status === 'OK') {
      setCurrentDirections(response);
    } else {
      console.error(`error fetching directions ${response}`);
    }
  };

  useEffect(() => {
    if (directions) {
          // Asegúrate de que hay al menos dos direcciones para trazar una ruta.
    const waypoints = directions.slice(1, -1).map(location => ({ location, stopover: false }));
    const origin = directions[0];
    const destination = directions[directions.length - 1];

    const request = {
      origin,
      destination,
      waypoints,
      travelMode: 'DRIVING',
    }
  }
  }, [directions]);

  return (
    <LoadScript googleMapsApiKey="AIzaSyCEbdZKx7Dy3tmUJ6Z-cAvOqvH7P74hN1k">
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        center={center}
        zoom={15}
      >
        {currentDirections && <DirectionsRenderer directions={currentDirections} />}
        {/* Aquí puedes agregar más componentes de Google Maps si lo necesitas */}
      </GoogleMap>
    </LoadScript>
  );
};

export default MapComponent;
