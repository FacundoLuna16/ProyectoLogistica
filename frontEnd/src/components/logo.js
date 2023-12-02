import { useTheme } from "@mui/material/styles";
import { Box } from "@mui/system";
import logo from "public/assets/logo.jpeg";

export const Logo = () => {
  const theme = useTheme();
  const fillColor = theme.palette.primary.main;

  return (
    <Box
      display="flex" // Usa flexbox para el contenedor
      justifyContent="center" // Centra horizontalmente en el contenedor
      alignItems="center" // Centra verticalmente en el contenedor
      sx={{
        height: 100, // Altura del Box, puedes ajustarla si necesitas más espacio
        marginLeft: 10,
        width: "50%", // El Box ocupa el ancho total de su contenedor padre
        borderRadius: "borderRadius", // Redondeo de bordes, usa un valor de tu tema o un número específico
        p: 3, // Padding dentro del Box, ajusta según tus necesidades
      }}
    >
      <Box
        component="img"
        src="https://siglo21myh.com.ar/wp-content/uploads/2023/01/logo-ACTUALIZADO.png"
        alt="logoSiglo21"
        sx={{
          height: 70, // Altura de la imagen, ajusta según sea necesario
          width: 175, // Anchura de la imagen, ajusta según sea necesario
          // Elimina las propiedades de maxWidth y maxHeight si no son necesarias
        }}
      />
    </Box>
  );
};
