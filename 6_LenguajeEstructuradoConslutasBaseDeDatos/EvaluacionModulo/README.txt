Set de datos para evaluación SQL - ventas_online

Archivos:
- clientes.csv (120 registros)
- productos.csv (64 registros)
- pedidos.csv (180 registros)
- detalle_pedido.csv (518 registros)

Total de registros: 882

Orden sugerido de carga:
1. clientes.csv
2. productos.csv
3. pedidos.csv
4. detalle_pedido.csv

Características del set:
- 120 clientes
- 64 productos distribuidos en 6 categorías
- 180 pedidos
- 518 líneas de detalle
- Hay clientes sin pedidos para probar LEFT JOIN
- Cada pedido tiene al menos 2 productos
- Existen múltiples pedidos en la fecha 2025-03-15 para probar filtros por fecha
- El cliente id_cliente = 17 fue diseñado para destacar en consultas de mayor gasto

Estructura esperada según evaluación:
Cliente(id_cliente, nombre, email, ciudad)
Producto(id_producto, nombre, categoria, precio)
Pedido(id_pedido, fecha_pedido, id_cliente)
Detalle_Pedido(id_detalle, id_pedido, id_producto, cantidad)
