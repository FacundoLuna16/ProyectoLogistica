import { useTheme } from "@mui/material/styles";
import { Box } from "@mui/system";

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
        src="/assets/logo.png"
        alt="logoSiglo21"
        sx={{
          height: 50,
          width: 175,
        }}
      />
    </Box>
  );
};
