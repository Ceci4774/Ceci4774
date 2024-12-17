--CONSULTAS SOBRE LA BASE DE DATOS FASTFOOTS
------------------------------------------------------------------------------------
USE FastFootsDB5;
-------------------------------------------------------------------------------------

--Total de ventas globales
-------------------------

--1-Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) AS TotalVentas FROM Ordenes;

--2-Promedio de precios de productos por categoría
---------------------------------------------------
--Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT CategoriaID, CONVERT(DECIMAL(10,2), AVG(Precio)) AS PrecioPromedio
  FROM Productos
  GROUP BY CategoriaID; 


--3-Orden mínima y máxima por sucursal
---------------------------------------
--Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT SucursalID,
 MIN(TotalCompra) AS MinCompra,
 MAX(TotalCompra) AS MaxCompra
 FROM Ordenes 
 GROUP BY SucursalID;


--4-Mayor número de kilómetros recorridos para entrega
-------------------------------------------------------
--Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT TOP 1 OrdenID,
  MAX(KilometrosRecorrer) AS km
  FROM Ordenes
  GROUP BY OrdenID
  ORDER BY Km DESC;



--5-Promedio de cantidad de productos por orden
------------------------------------------------
--Pregunta: ¿Cuál es la cantidad promedio de productos por orden?

SELECT OrdenID, AVG(Cantidad) AS PromedioCantidadProductos
FROM DetalleDeOrdenes 
GROUP BY OrdenID
SELECT *FROM DetalleDeOrdenes;
SELECT *FROM Ordenes;


--6-Total de ventas por tipo de pago
--------------------------------------
--Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

SELECT TipoPagoID ,
 SUM(TotalCompra) AS FacturacionTotal
 FROM Ordenes
 GROUP BY TipoPagoID;



--7-Sucursal con la venta promedio más alta
----------------------------------------------
--Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT TOP 1
 SucursalID,
 AVG(TotalCompra) AS PromedioVentas
FROM Ordenes
GROUP BY SucursalID
ORDER BY PromedioVentas DESC;

--8-Sucursal con la mayor cantidad de ventas por encima de un umbral
---------------------------------------------------------------------
--Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT SucursalID, SUM(TotalCompra) AS VentasTotales
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) >= 1000

--9-Comparación de ventas promedio antes y después de una fecha específica
----------------------------------------------------------------------------
--Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?


SELECT    (SELECT AVG(TotalCompra) as VentaPromedio
        FROM Ordenes
        WHERE FechaOrdenTomada < '2023-07-01') AS [Ventas Promedio Antes del 1 de Julio],
        (SELECT AVG(TotalCompra) as VentaPromedio
        FROM Ordenes
        WHERE FechaOrdenTomada >'2023-07-01') AS [Ventas Promedio Despues del 1 de Julio];




--10-Análisis de actividad de ventas por horario
--------------------------------------------------
--Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?

SELECT TOP 1 HorarioVenta,
  SUM(TotalCompra) AS MayorVenta,
  AVG(TotalCompra) AS PromedioCompra,
  MAX(TotalCompra) AS CompraTotal
  FROM Ordenes
  GROUP BY HorarioVenta
  ORDER BY MayorVenta DESC;


-------------------------------------------FIN-----------------------------------------------------------------------------