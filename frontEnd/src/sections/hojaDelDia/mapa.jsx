import { GoogleMap, LoadScript, DirectionsService, DirectionsRenderer } from '@react-google-maps/api';
import React, { useRef, useState, useEffect } from "react";

const MapComponent = ({ addresses }) => {
  const [currentDirections, setCurrentDirections] = useState(null);

  useEffect(() => {
    if (window.google && addresses && addresses.length > 1) {
      const directionsService = new window.google.maps.DirectionsService();
      if (addresses.length > 1) {
        const waypoints = addresses.slice(1).map(address => ({
          location: address,
          stopover: true,
        }));

        const origin = addresses[0];
        const destination = addresses[addresses.length - 1];

        const directionsService = new google.maps.DirectionsService();
        directionsService.route(
          {
            origin: origin,
            destination: destination,
            waypoints: waypoints,
            travelMode: google.maps.TravelMode.DRIVING,
          },
          (result, status) => {
            if (status === google.maps.DirectionsStatus.OK) {
              setCurrentDirections(result);
            } else {
              console.error(`error fetching directions ${result}`);
            }
          }
        );
      }
    }
  }, [addresses]);

  const mapContainerStyle = {
    height: "400px",
    width: "800px"
  };

  const center = { lat: -38.9517, lng: -68.0592 }; // Neuquén Capital

  return (
    <LoadScript googleMapsApiKey="AIzaSyCEbdZKx7Dy3tmUJ6Z-cAvOqvH7P74hN1k">
      <GoogleMap
        mapContainerStyle={mapContainerStyle}
        center={center}
        zoom={12}
      >
        {currentDirections && <DirectionsRenderer directions={currentDirections} />}
      </GoogleMap>
    </LoadScript>
  );
};

export default MapComponent;