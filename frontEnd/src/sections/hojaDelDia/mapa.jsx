import React, { useEffect, useState } from 'react';
import { GoogleMap, LoadScript, Marker } from '@react-google-maps/api';

// Define las bibliotecas fuera del componente
const libraries = ["places"];

const MapComponent = ({ direcciones }) => {
    const [markers, setMarkers] = useState([]);

    const mapStyles = {        
        height: "400px",
        width: "100%"};

    const defaultCenter = {
        lat: -38.9517, 
        lng: -68.0592
    }

    const geocodeAddress = (direccion) => {
        const geocoder = new window.google.maps.Geocoder();

        geocoder.geocode({ 'address': direccion }, (results, status) => {
            if (status === 'OK') {
                const location = results[0].geometry.location;
                setMarkers(prevMarkers => [
                    ...prevMarkers,
                    { lat: location.lat(), lng: location.lng() }
                ]);
            } else {
                console.error('Geocode no fue exitoso por la siguiente razón: ' + status);
            }
        });
    }

    useEffect(() => {
        direcciones.forEach(direccion => {
            geocodeAddress(direccion);
        });
    }, [direcciones]);

    return (
        <LoadScript
            googleMapsApiKey="AIzaSyCEbdZKx7Dy3tmUJ6Z-cAvOqvH7P74hN1k"
            libraries={libraries}
        >
            <GoogleMap
                mapContainerStyle={mapStyles}
                zoom={13}
                center={defaultCenter}
            >
                {
                    markers.map((marker, index) => (
                        <Marker key={index} position={marker} />
                    ))
                }
            </GoogleMap>
        </LoadScript>
    )
}

export default MapComponent;
