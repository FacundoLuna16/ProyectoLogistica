import * as React from 'react';
import {
  DataGrid,
  GridToolbar,
  gridFilteredSortedRowIdsSelector,
  selectedGridRowsSelector,
} from '@mui/x-data-grid';
import { useRef } from 'react';
export const getSelectedRowsToExport = ({ apiRef }) => {
  const selectedRowIds = selectedGridRowsSelector(apiRef);
  if (selectedRowIds.size > 0) {
    alert(JSON.stringify(Array.from(selectedRowIds.keys())));
    return Array.from(selectedRowIds.keys());
  }
  alert(JSON.stringify(gridFilteredSortedRowIdsSelector(apiRef)));
  return gridFilteredSortedRowIdsSelector(apiRef);
};

export const getNroFacturasACerrar = ({ apiRef }) => {
  alert('getNroFacturasACerrar');
  const selectedRowIds = selectedGridRowsSelector(apiRef);
  if (selectedRowIds.size > 0) {
    alert(JSON.stringify(Array.from(selectedRowIds.keys())));
    return Array.from(selectedRowIds.keys());
  }
  alert('No hay envíos seleccionados');
  return Array.from(selectedRowIds.keys());
}

export default function CustomDataGridComponent({ envios, onEnviosSeleccionadosChange}) {

  const [selectionModel, setSelectionModel] = React.useState([]);

  const handleSelectionModelChange = (newSelectionModel) => {
    console.log('Filas seleccionadas:', newSelectionModel); // Para depuración
    setSelectionModel(newSelectionModel);
    // Asegúrate de que esta línea se ejecuta correctamente
    onEnviosSeleccionadosChange(newSelectionModel); 
  };
  
  // Transforma la estructura de datos para adaptarla al DataGrid
  const rows = envios.map((envio) => ({
    id: envio.numeroFactura,
    numeroFactura: envio.numeroFactura,
    cliente: `${envio.cliente.nombre} ${envio.cliente.apellido}`,
    zona: envio.zona,
    detalleEnvio: envio.detalleEnvio.map((detalle) => detalle.nombre).join('\n'), // Cambio aquí
    direccionEnvio: envio.direccionEnvio,
    entreCalles: envio.entreCalles,
    estadoActual: envio.estadoActual,
    ultimosDigitosTarjeta: envio.ultimosDigitosTarjeta,
  }));

  const columns = [
    { field: 'numeroFactura', headerName: 'Número de Factura', width: 200 },
    { field: 'cliente', headerName: 'Cliente', width: 200 },
    { field: 'zona', headerName: 'Zona', width: 100 },
    {
      field: 'detalleEnvio',
      headerName: 'Detalle de Envío',
      width: 200,
      renderCell: (params) => (
        <div style={{ whiteSpace: 'pre-wrap', lineHeight: 1.2, maxHeight: '4.8em', overflow: 'hidden' }}>
          {params.value}
        </div>
      ),
    },
    { field: 'direccionEnvio', headerName: 'Dirección de Envío', width: 200 },
    { field: 'entreCalles', headerName: 'Entre Calles', width: 150 },
    { field: 'estadoActual', headerName: 'Estado Actual', width: 150 },
    { field: 'ultimosDigitosTarjeta', headerName: 'Últimos dígitos de Tarjeta', width: 200 },
  ];



  return (
    <div style={{ height: 600, width: '100%' }}>
     <DataGrid
        rows={rows}
        columns={columns}
        checkboxSelection
        onRowSelectionModelChange={handleSelectionModelChange}
        selectionModel={selectionModel}
        components={{
          Toolbar: GridToolbar,
        }}
      />
    </div>
  );
}
