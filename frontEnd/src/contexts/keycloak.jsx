import Keycloak from "keycloak-js";

let keycloak;
if (typeof window !== "undefined") {
  const keycloakConfig = {
    url: "http://localhost:8180/auth",
    realm: "siglo21",
    clientId: "siglo21-client-api-rest",
    onLoad: "login-required", // Asegúrate de añadir esta línea
  };

  keycloak = new Keycloak(keycloakConfig);
}

export default keycloak;
