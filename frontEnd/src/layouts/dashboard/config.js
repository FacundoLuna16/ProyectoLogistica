import UsersIcon from "@heroicons/react/24/solid/UsersIcon";
import { SvgIcon } from "@mui/material";
import React from "react";
import { PaperAirplaneIcon } from "@heroicons/react/24/outline";
import { TruckIcon } from "@heroicons/react/24/outline";
import { ChartPieIcon } from "@heroicons/react/24/outline";
import { BellAlertIcon } from "@heroicons/react/24/outline";


export const items = [
  {
    title: "Envios",
    path: "/",
    icon: (
      <SvgIcon fontSize="small">
        <PaperAirplaneIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
  {
    title: "Repartidores",
    path: "/repartidores",
    icon: (
      <SvgIcon fontSize="small">
        <UsersIcon />
      </SvgIcon>
    ),
  },
  {
    title: "Camiones",
    path: "/camiones",
    icon: (
      <SvgIcon fontSize="small">
        <TruckIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
  {
    title: "Reportes y Estadisticas",
    path: "/reportes",
    icon: (
      <SvgIcon fontSize="small">
        <ChartPieIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
  {
    title: "Notificaciones al cliente",
    path: "/notificaciones",
    icon: (
      <SvgIcon fontSize="small">
        <BellAlertIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
];
