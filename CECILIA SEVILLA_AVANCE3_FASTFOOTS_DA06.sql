--CONSULTAS SOBRE LA BASE DE DATOS FASTFOOTS
------------------------------------------------------------------------------------
USE FastFootsDB5;
-------------------------------------------------------------------------------------

--Total de ventas globales
-------------------------

--1-Pregunta: �Cu�l es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) AS TotalVentas FROM Ordenes;

--2-Promedio de precios de productos por categor�a
---------------------------------------------------
--Pregunta: �Cu�l es el precio promedio de los productos dentro de cada categor�a?

SELECT CategoriaID, CONVERT(DECIMAL(10,2), AVG(Precio)) AS PrecioPromedio
  FROM Productos
  GROUP BY CategoriaID; 


--3-Orden m�nima y m�xima por sucursal
---------------------------------------
--Pregunta: �Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?

SELECT SucursalID,
 MIN(TotalCompra) AS MinCompra,
 MAX(TotalCompra) AS MaxCompra
 FROM Ordenes 
 GROUP BY SucursalID;


--4-Mayor n�mero de kil�metros recorridos para entrega
-------------------------------------------------------
--Pregunta: �Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?

SELECT TOP 1 OrdenID,
  MAX(KilometrosRecorrer) AS km
  FROM Ordenes
  GROUP BY OrdenID
  ORDER BY Km DESC;



--5-Promedio de cantidad de productos por orden
------------------------------------------------
--Pregunta: �Cu�l es la cantidad promedio de productos por orden?

SELECT OrdenID, AVG(Cantidad) AS PromedioCantidadProductos
FROM DetalleDeOrdenes 
GROUP BY OrdenID
SELECT *FROM DetalleDeOrdenes;
SELECT *FROM Ordenes;


--6-Total de ventas por tipo de pago
--------------------------------------
--Pregunta: �C�mo se distribuye la Facturaci�n Total del Negocio de acuerdo a los m�todos de pago?

SELECT TipoPagoID ,
 SUM(TotalCompra) AS FacturacionTotal
 FROM Ordenes
 GROUP BY TipoPagoID;



--7-Sucursal con la venta promedio m�s alta
----------------------------------------------
--Pregunta: �Cu�l Sucursal tiene el ingreso promedio m�s alto?

SELECT TOP 1
 SucursalID,
 AVG(TotalCompra) AS PromedioVentas
FROM Ordenes
GROUP BY SucursalID
ORDER BY PromedioVentas DESC;

--8-Sucursal con la mayor cantidad de ventas por encima de un umbral
---------------------------------------------------------------------
--Pregunta: �Cu�les son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT SucursalID, SUM(TotalCompra) AS VentasTotales
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) >= 1000

--9-Comparaci�n de ventas promedio antes y despu�s de una fecha espec�fica
----------------------------------------------------------------------------
--Pregunta: �C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?


SELECT    (SELECT AVG(TotalCompra) as VentaPromedio
        FROM Ordenes
        WHERE FechaOrdenTomada < '2023-07-01') AS [Ventas Promedio Antes del 1 de Julio],
        (SELECT AVG(TotalCompra) as VentaPromedio
        FROM Ordenes
        WHERE FechaOrdenTomada >'2023-07-01') AS [Ventas Promedio Despues del 1 de Julio];




--10-An�lisis de actividad de ventas por horario
--------------------------------------------------
--Pregunta: �Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, cu�l es el ingreso promedio de estas ventas, y cu�l ha sido el importe m�ximo alcanzado por una orden en dicha jornada?

SELECT TOP 1 HorarioVenta,
  SUM(TotalCompra) AS MayorVenta,
  AVG(TotalCompra) AS PromedioCompra,
  MAX(TotalCompra) AS CompraTotal
  FROM Ordenes
  GROUP BY HorarioVenta
  ORDER BY MayorVenta DESC;


-------------------------------------------FIN-----------------------------------------------------------------------------