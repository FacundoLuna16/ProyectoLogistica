import Head from "next/head";
import { CacheProvider } from "@emotion/react";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { AdapterDateFns } from "@mui/x-date-pickers/AdapterDateFns";
import { CssBaseline } from "@mui/material";
import { ThemeProvider } from "@mui/material/styles";
import { AuthConsumer, AuthProvider } from "src/contexts/auth-context";
import { useNProgress } from "src/hooks/use-nprogress";
import { createTheme } from "src/theme";
import { createEmotionCache } from "src/utils/create-emotion-cache";
import "simplebar-react/dist/simplebar.min.css";
import { ReactKeycloakProvider } from "@react-keycloak/web";
import Keycloak from "keycloak-js";
import { useEffect } from "react";
import keycloak from "src/contexts/keycloak";

const clientSideEmotionCache = createEmotionCache();

const SplashScreen = () => null;

const App = (props) => {
  const { Component, emotionCache = clientSideEmotionCache, pageProps } = props;

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

    keycloak.init({ onLoad: "login-required" }).then((authenticated) => {
      

    });
  }, []);

  return (
    <ReactKeycloakProvider authClient={keycloak}>
      <CacheProvider value={emotionCache}>
        <Head>
          <title>Sistema de Gestión de Envios</title>
          <meta name="viewport" content="initial-scale=1, width=device-width" />
        </Head>
        <LocalizationProvider dateAdapter={AdapterDateFns}>
          <ThemeProvider theme={theme}>
            <CssBaseline />
            <Component {...pageProps} />
          </ThemeProvider>
        </LocalizationProvider>
      </CacheProvider>
    </ReactKeycloakProvider>
  );
};

export default App;
