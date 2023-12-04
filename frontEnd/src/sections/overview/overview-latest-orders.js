import { format } from "date-fns";
import PropTypes from "prop-types";
import ArrowRightIcon from "@heroicons/react/24/solid/ArrowRightIcon";
import {
  Box,
  Button,
  Card,
  CardActions,
  CardHeader,
  Divider,
  SvgIcon,
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableRow,
  Typography,
} from "@mui/material";
import { Scrollbar } from "src/components/scrollbar";
import { SeverityPill } from "src/components/severity-pill";

const statusMap = {
  pending: "warning",
  delivered: "success",
  refunded: "error",
};

function getZone(day) {
  const dayToZoneMap = {
    martes: "zona 1",
    miércoles: "zona 2",
    jueves: "zona 3",
    viernes: "zona 4",
  };

  return dayToZoneMap[day.toLowerCase()] || "Día no válido para realizar entregas";
}
const days = ["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"];
const date = new Date();
const day = days[date.getDay()];

const zoneInfo = `Hoy es ${day} y corresponde a: ${getZone(day)}.`;

export const OverviewLatestOrders = (props) => {
  const { orders = [], sx } = props;
  return (
    <Card sx={sx}>
      <CardHeader title="Envios correspondientes del dia" />
      <Typography variant="h6" component="div" sx={{ flexGrow: 1, textAlign: "center", marginY:2}}>
        {zoneInfo}
      </Typography>
      <Scrollbar sx={{ flexGrow: 1 }}>
        <Box sx={{ minWidth: 800 }}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>Nro Envio</TableCell>
                <TableCell>Cliente</TableCell>
                <TableCell sortDirection="desc">Camion</TableCell>
                <TableCell>direccionEnvio</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {orders.map((order) => {
                const createdAt = format(order.createdAt, "dd/MM/yyyy");

                return (
                  <TableRow hover key={order.id}>
                    <TableCell>{order.ref}</TableCell>
                    <TableCell>{order.customer.name}</TableCell>
                    <TableCell>{createdAt}</TableCell>
                    <TableCell>
                      <SeverityPill color={statusMap[order.status]}>{order.status}</SeverityPill>
                    </TableCell>
                  </TableRow>
                );
              })}
            </TableBody>
          </Table>
        </Box>
      </Scrollbar>
      <Divider />
    </Card>
  );
};

OverviewLatestOrders.prototype = {
  orders: PropTypes.array,
  sx: PropTypes.object,
};
