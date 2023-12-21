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
import LoadingPage from 'src/components/loadingPage'
import initKeycloak from "src/contexts/keycloak";

const clientSideEmotionCache = createEmotionCache();

const App = (props) => {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props;
  const [keycloakCompleto, setKeycloak] = useState(null);

  useNProgress();

  const getLayout = Component.getLayout ?? ((page) => page);
  const theme = createTheme();

  useEffect(() => {
    const initializeKeycloak = async () => {
      const keycloak = await initKeycloak();
      setKeycloak(keycloak);
    };
    initializeKeycloak();
  }, []);

  if (!keycloakCompleto) {
    return <LoadingPage />;
  }

  return (
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
  );
};

export default App;
