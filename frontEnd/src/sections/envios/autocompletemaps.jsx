import React, { useState, useEffect, useRef } from 'react';

const Autocompletemaps = ({ apiKey, onPlaceSelected }) => {
  const [autocomplete, setAutocomplete] = useState(null);
  const autocompleteRef = useRef(null);

  useEffect(() => {
    const loadGoogleScript = () => {
      const script = document.createElement('script');
      script.src = `https://maps.googleapis.com/maps/api/js?key=${apiKey}&libraries=places`;
      script.async = true;
      script.defer = true;
      document.body.appendChild(script);

      script.onload = () => {
        initAutocomplete();
      };
    };

    if (!window.google) {
      loadGoogleScript();
    } else {
      initAutocomplete();
    }

    const initAutocomplete = () => {
      setAutocomplete(
        new window.google.maps.places.Autocomplete(autocompleteRef.current)
      );
    };

  }, [apiKey]);

  useEffect(() => {
    if (autocomplete) {
      autocomplete.addListener('place_changed', () => {
        const place = autocomplete.getPlace();
        onPlaceSelected(place);
      });
    }
  }, [autocomplete, onPlaceSelected]);

  return <input ref={autocompleteRef} type="text" />;
};

export default Autocompletemaps;
