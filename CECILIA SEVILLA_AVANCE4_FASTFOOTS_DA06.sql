----AVANCE NUMERO 4
---------------------------------------------------------------------------------
--CONSULTAS EN LA BASE DE FASTFOOTSDB5
---------------------------------------------------------------------------------
USE FastFootsDB5;
---------------------------------------------------------------------------------
--1-¿Como puedo obtener una lista de todos los productos junto con sus categorias?

SELECT T1.Nombre, T2.Nombre
FROM Productos AS T1
LEFT JOIN Categorias AS T2
ON T1.CategoriaID = T2.CategoriaID;

--2-¿Como puedo saber a qué sucursal está asignado cada empleado?

SELECT T1.Nombre, T2.Nombre
FROM Empleados AS T1
LEFT JOIN Sucursales AS T2
ON T1.SucursalID = T2.SucursalID;

--3-¿Existen productos que no tienen una categoría asignada?

SELECT T1.Nombre, T2.Nombre
FROM Productos AS T1
LEFT JOIN Categorias AS T2
ON T1.CategoriaID = T2.CategoriaID
WHERE T2.Nombre IS NULL
SELECT *FROM Productos WHERE CategoriaID IS NULL;

--4-¿Como puedo obtener un detalle completo de las ordenes, incluyendo el nombre del cliente, nombre del empleado que tomo la --orden, y nombre del mensajero que entrego?

SELECT *
FROM Ordenes AS T1
INNER JOIN Clientes AS T2
ON T1.ClienteID = T2.ClienteID
INNER JOIN Empleados T3
ON T1.EmpleadoID = T3.EmpleadoID
INNER JOIN Mensajeros AS T4
ON T1.MensajeroID = T4.MensajeroID;

--5-¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?

 SELECT T5.Nombre AS Sucursal, --variable cualitativa.
        T4.Nombre AS Categoria, --variable cualitativa.
		SUM(T2.Cantidad) AS CantidadArticulos --metrica
 FROM Ordenes AS T1
INNER JOIN DetalleDeOrdenes AS T2
  ON T1.OrdenID = T2.OrdenID
INNER JOIN Productos AS T3
  ON T2.ProductoID = T3.ProductoID
INNER JOIN Categorias AS T4
  ON T3.CategoriaID = T4.CategoriaID
INNER JOIN Sucursales AS T5
  ON T1.SucursalID = T5.SucursalID
GROUP BY T5.Nombre, T4.Nombre;
----------------------------------------------FIN------------------------------------------------------------------


