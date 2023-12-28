import UsersIcon from "@heroicons/react/24/solid/UsersIcon";
import { SvgIcon } from "@mui/material";
import { HomeIcon } from "@heroicons/react/24/outline";

import React from "react";
import { PaperAirplaneIcon } from "@heroicons/react/24/outline";
import { TruckIcon } from "@heroicons/react/24/outline";
import { ChartPieIcon } from "@heroicons/react/24/outline";
import { BellAlertIcon } from "@heroicons/react/24/outline";
import { UserIcon } from "@heroicons/react/24/outline";
import { ExclamationTriangleIcon } from "@heroicons/react/24/outline";
import { DocumentIcon } from "@heroicons/react/24/outline";

export const items = [
  {
    title: "Inicio",
    path: "/", // path is used by the Sidebar component
    icon: (
      <SvgIcon fontSize="small">
        <HomeIcon />
      </SvgIcon>
    ),
  },
  {
    title: "Envios",
    path: "/envios",
    icon: (
      <SvgIcon fontSize="small">
        <PaperAirplaneIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
  {
    title: "Hoja del Dia",
    path: "/hojaDelDia",
    icon: (
      <SvgIcon fontSize="small">
        <DocumentIcon className="h-6 w-6 text-gray-500" />
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
    title: "Clientes",
    path: "/clientes",
    icon: (
      <SvgIcon fontSize="small">
        <UserIcon className="h-6 w-6 text-gray-500" />
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
    path: "/notificacionesCliente",
    icon: (
      <SvgIcon fontSize="small">
        <BellAlertIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
  {
    title: "Envios no realizados a tiempo",
    path: "/notificacionesEnvio",
    icon: (
      <SvgIcon fontSize="small">
        <ExclamationTriangleIcon className="h-6 w-6 text-gray-500" />
      </SvgIcon>
    ),
  },
];
