//Permite que el componente que se le pase como parámetro solo se pueda acceder si el usuario está autenticado.

import { AuthGuard } from 'src/guards/auth-guard';

export const withAuthGuard = (Component) => (props) => (
  <AuthGuard>
    <Component {...props} />
  </AuthGuard>
);
