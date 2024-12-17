--EXTRA CREDIT--------

--POSICIONAMIENTO DE LA BASE DE DATOS FAST FOOTS----

USE FastFootsDB5;
----------------------------------------------------------
--INGRESO DE DATOS EN LA BASE DE DATOS FAST FOOTS---------

-- Insertar Datos en Ordenes
INSERT INTO Ordenes (ClienteID, EmpleadoID, SucursalID, MensajeroID, TipoPagoID, OrigenID, HorarioVenta, TotalCompra, KilometrosRecorrer, FechaDespacho, FechaEntrega, FechaOrdenTomada, FechaOrdenLista) VALUES
(11, 11, 11, 11, 11, 11, 'Noche', 1153.51, 3.5, '2023-01-11 20:00:00', '2023-01-11 20:15:00', '2023-01-11 19:45:00', '2023-01-11 20:15:00'),
(12, 12, 12, 12, 12, 12, 'Noche', 1175.00, 8.0, '2023-02-14 20:30:00', '2023-02-14 20:40:00', '2023-02-14 20:10:00', '2023-02-14 21:00:00'),
(13, 13, 13, 13, 13, 13, 'Tarde', 928.00, 1.0, '2023-03-20 17:00:00', '2023-03-20 17:10:00', '2023-03-20 17:05:00', '2023-03-20 17:15:00'),
(14, 14, 14, 14, 14, 14, 'Tarde', 933.00, 2.5, '2023-04-23 14:30:00', '2023-04-23 15:00:00', '2023-04-23 14:20:00', '2023-04-23 15:15:00'),
(15, 15, 15, 15, 15, 15, 'Tarde', 958.00, 6.0, '2023-05-29 17:30:00', '2023-05-29 18:00:00', '2023-05-29 17:20:00', '2023-05-29 18:15:00'),
(16, 16, 16, 16, 16, 11, 'Noche', 845.00, 1.5, '2023-06-02 21:30:00', '2023-06-02 21:50:00', '2023-06-02 21:20:00', '2023-06-02 22:15:00'),
(17, 17, 17, 17, 17, 12, 'Noche', 1000.00, 5.5, '2023-07-10 21:00:00', '2023-07-10 21:20:00', '2023-07-10 20:50:00', '2023-07-10 21:30:00'),
(18, 18, 18, 18, 18, 13, 'Tarde', 1095.00, 9.5, '2023-08-18 14:30:00', '2023-08-18 15:00:00', '2023-08-18 14:00:00', '2023-08-18 15:30:00'),
(19, 19, 19, 19, 19, 14, 'Mañana', 1055.00, 2.0, '2023-09-20 10:30:00', '2023-09-20 10:20:00', '2023-09-20 10:00:00', '2023-09-20 10:45:00'),
(20, 20, 20, 20, 20, 15, 'Mañana', 908.00, 3.0, '2023-10-24 09:30:00', '2023-10-24 10:00:00', '2023-10-24 09:00:00', '2023-10-24 10:35:00');

Select * from Ordenes

-- Insertar Datos en Detalle de Ordenes
INSERT INTO DetalledeOrdenes (OrdenID, ProductoID, Cantidad, Precio) VALUES
(1, 11, 5, 25.44),
(1, 12, 6, 50.14),
(1, 13, 7, 58.37),
(1, 14, 9, 80.34),
(1, 15, 11, 45.25),
(1, 16, 8, 30.08),
(1, 17, 6, 39.31),
(1, 18, 7, 29.96),
(1, 19, 6, 38.13),
(1, 20, 9, 68.34);

Select * from DetalledeOrdenes

-------------------------------------------------------------------------------------------------------------------------
-----CONSULTAS SQL--------------------------------------------------------
--1-¿Cuantas filas han sido insertadas?

SELECT @@ROWCOUNT AS FilasAfectadas;

--2-¿Cual es el ID de la ultima orden insertada?

SELECT @@IDENTITY AS UltimaOrden;

--3-¿Cuantas ordenes hay por horario?

SELECT HorarioVenta,
 YEAR(FechaDespacho) FechaDespacho,
 COUNT(OrdenID) AS Ordenes
 FROM [dbo].[Ordenes]
 GROUP BY HorarioVenta, YEAR(FechaDespacho)
 ORDER BY Ordenes

--------------------------------------------FIN------------------------------------------------------