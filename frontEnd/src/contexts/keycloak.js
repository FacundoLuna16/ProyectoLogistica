// keycloak.js
import Keycloak from "keycloak-js";

const initKeycloak = async () => {
  const keycloak = new Keycloak({
    url: "http://localhost:8180/auth",
    realm: "siglo21",
    clientId: "siglo21-client-api-rest",
    onLoad: "login-required",
  });

  await keycloak.init({
    onLoad: "login-required",
    checkLoginIframe: false,
  });

  localStorage.setItem("token", keycloak.token);
  localStorage.setItem("userName", keycloak.idTokenParsed.preferred_username);

  return keycloak;
};

export default initKeycloak;
