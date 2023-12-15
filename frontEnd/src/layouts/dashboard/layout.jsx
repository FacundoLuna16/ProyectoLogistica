import { useCallback, useEffect, useState } from 'react';
import { usePathname } from 'next/navigation';
import { styled } from '@mui/material/styles';
import { SideNav } from './side-nav';
import { TopNav } from './top-nav';

const SIDE_NAV_WIDTH = 280;

const LayoutRoot = styled('div')(({ theme }) => ({
  display: 'flex',
  flex: '1 1 auto',
  maxWidth: '100%',
  [theme.breakpoints.up('lg')]: {
    paddingLeft: SIDE_NAV_WIDTH
  }
}));

const LayoutContainer = styled('div')({
  display: 'flex',
  flex: '1 1 auto',
  flexDirection: 'column',
  width: '100%'
});


// Se envuelve el componente Layout con un Higher Order Component (HOC) llamado withAuthGuard.
export const Layout = (props) => {
  // Props destructuring: extraer la propiedad 'children' del objeto 'props'
  const { children } = props;

  // Obtener la ruta actual utilizando usePathname de next/navigation
  const pathname = usePathname();


  /*****************************************************/
  //Esta parte del codigo es para el funcionamiento en celular de la sidenav-bar


  // Estado local para controlar si el SideNav está abierto o cerrado
  const [openNav, setOpenNav] = useState(false);

  // Función de callback para manejar el cambio de ruta
  const handlePathnameChange = useCallback(
    () => {
      // Si el SideNav está abierto, cerrarlo al cambiar la ruta
      if (openNav) {
        setOpenNav(false);
      }
    },
    [openNav]
  );

  // Efecto que se ejecuta cuando cambia la ruta (pathname)
  useEffect(
    () => {
      // Llamar a handlePathnameChange al cambiar la ruta
      handlePathnameChange();
    },
    // Dependencia: ejecutar el efecto solo cuando cambia la ruta
    [pathname]
  );


  /*****************************************************/

  // Renderizar el componente Layout
  return (
    <>
      {/* Barra de navegación superior */}
      <TopNav onNavOpen={() => setOpenNav(true)} />
      
      {/* Panel de navegación lateral */}
      <SideNav
        onClose={() => setOpenNav(false)} // Función para cerrar el SideNav
        open={openNav} // Estado para controlar si el SideNav está abierto
      />

      {/* Contenedor principal del diseño */}
      <LayoutRoot>
        <LayoutContainer>
          {/* Renderizar el contenido de la página */}
          {children}
        </LayoutContainer>
      </LayoutRoot>
    </>
  );
};
  