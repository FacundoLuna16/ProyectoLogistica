import { useTheme } from "@mui/material/styles";
import { Box } from "@mui/system";
import logo from "public/assets/logo.jpeg";

export const Logo = () => {
  const theme = useTheme();

  return (
    <Box
      display="flex"
      justifyContent="center"
      alignItems="center"
      sx={{
        height: 35, 
        marginLeft: 11,
        width: "50%",
        borderRadius: "borderRadius",
        p: 3,
      }}
    >
      <Box
        component="img"
        src="https://siglo21myh.com.ar/wp-content/uploads/2023/01/logo-ACTUALIZADO.png"
        alt="logoSiglo21"
        sx={{
          height: 50,
          width: 175,
        }}
      />
    </Box>
  );
};
