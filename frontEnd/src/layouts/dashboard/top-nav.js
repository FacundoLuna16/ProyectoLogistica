import PropTypes from 'prop-types';
import Bars3Icon from '@heroicons/react/24/solid/Bars3Icon';
import {
  Box,
  IconButton,
  Stack,
  SvgIcon,
  useMediaQuery,
  Typography,
  useTheme 
} from '@mui/material';
import { usePopover } from 'src/hooks/use-popover';
import { AccountPopover } from './account-popover';

const SIDE_NAV_WIDTH = 280;
const TOP_NAV_HEIGHT = 64;

export const TopNav = (props) => {
  const { onNavOpen } = props;

  const currentDate = new Date();
  const currentDay = currentDate.toLocaleDateString('es-ES', { year: 'numeric', month: 'long', day: 'numeric' });
  const currentTime = currentDate.toLocaleTimeString('es-ES', { hour: '2-digit', minute: '2-digit' });
  const theme = useTheme();
  const lgUp = useMediaQuery(theme.breakpoints.up('lg'));

  return (
    <>
      <Box component="header" sx={{ /* ... tus estilos existentes */ }}>
        <Stack alignItems="center" direction="row" justifyContent="space-between" sx={{ minHeight: TOP_NAV_HEIGHT, px: 2 }}>
          {!lgUp && (
            <IconButton onClick={onNavOpen}>
              <SvgIcon fontSize="small">
                <Bars3Icon />
              </SvgIcon>
            </IconButton>
          )}
          {/* Título centrado con fecha y hora sin el día de la semana */}
          <Typography variant="h6" component="div" sx={{ flexGrow: 1, textAlign: 'center' }}>
            {`${currentDay} - ${currentTime}`}
          </Typography>
          {/* Espacio vacío para justificar el contenido al centro */}
          {!lgUp && <Box sx={{ width: 48 }} />} {/* Este Box actúa como un placeholder para mantener el título centrado. */}
        </Stack>
      </Box>
      <AccountPopover /* ... tus props de AccountPopover */ />
    </>
  );
};

TopNav.propTypes = {
  onNavOpen: PropTypes.func
};