import Head from "next/head";
import { CacheProvider } from "@emotion/react";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDateFns } from "@mui/x-date-pickers/AdapterDateFns";
import { CssBaseline } from "@mui/material";
import { ThemeProvider } from "@mui/material/styles";
import { useNProgress } from "src/hooks/use-nprogress";
import { createTheme } from "src/theme";
import { createEmotionCache } from "src/utils/create-emotion-cache";
import "simplebar-react/dist/simplebar.min.css";
import Keycloak from "keycloak-js";
import { useEffect, useState } from "react";
import React, { createContext, useContext } from "react";

const clientSideEmotionCache = createEmotionCache();

const App = (props) => {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props;
  const [keycloakCompleto, setKeycloak] = useState(null);

  useNProgress();

  const getLayout = Component.getLayout ?? ((page) => page);
  const theme = createTheme();

  useEffect(() => {
    const keycloak = new Keycloak({
      url: "http://localhost:8180/auth",
      realm: "siglo21",
      clientId: "siglo21-client-api-rest",
      onLoad: "login-required",
    });

    keycloak.init({ onLoad: "login-required", checkLoginIframe: false }).then(() => {
      setKeycloak(keycloak);

      localStorage.setItem("token", keycloak.token);
      // console.log(keycloak);
    });
  }, []);

  if (!keycloakCompleto) {
    return <div>Cargando...</div>;
  }

  return (
    // <ReactKeycloakProvider authClient={keycloakCompleto}>
    <CacheProvider value={emotionCache}>
      <Head>
        <title>Sistema de Gestión de Envios</title>
        <meta name="viewport" content="initial-scale=1, width=device-width" />
      </Head>
      <LocalizationProvider dateAdapter={AdapterDateFns}>
        <ThemeProvider theme={theme}>
          <CssBaseline />
          {getLayout(<Component {...pageProps} />)}
        </ThemeProvider>
      </LocalizationProvider>
    </CacheProvider>

    // </ReactKeycloakProvider>
  );
};

export default App;
