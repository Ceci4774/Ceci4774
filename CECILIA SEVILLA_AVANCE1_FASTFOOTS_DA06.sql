--CREACION DE LA BASE DE DATOS FAST FOOTS5---
----------------------------------------------------------------------------------------------------
CREATE DATABASE FastFootsDB5;

--USO DE LA BASE DE DATOS

USE FastFootsDB5;

----------------------------------------------------------------------------------------------------
--CREACION DE TABLAS DE FAST FOOTS5
----------------------------------------------------------------------------------------------------


--TABLA CATEGORIAS
CREATE TABLE Categorias(
  CategoriaID INT PRIMARY KEY IDENTITY,
  Nombre NVARCHAR(255) NOT NULL);



--TABLA PRODUCTOS
CREATE TABLE Productos(
  ProductoID INT PRIMARY KEY IDENTITY,
  Nombre VARCHAR(255) NOT NULL,
  CategoriaID INT,
  Precio DECIMAL(10,2) NOT NULL);



--TABLA SUCURSALES
CREATE TABLE Sucursales(
  SucursalID INT PRIMARY KEY IDENTITY,
  Nombre VARCHAR(255) NOT NULL,
  Direccion VARCHAR(255));



  --TABLA EMPLEADOS
CREATE TABLE Empleados(
  EmpleadoID INT PRIMARY KEY IDENTITY,
  Nombre VARCHAR(255) NOT NULL,
  Posicion VARCHAR(255),
  Departamento VARCHAR (255),
  SucursalID INT,
  Rol VARCHAR(255));--VENDEDOR,MENSAJERO,ETC



  --TABLA CLIENTES
CREATE TABLE Clientes(
  ClienteID INT PRIMARY KEY IDENTITY,
  Nombre VARCHAR(255) NOT NULL,
  Direccion VARCHAR(255));



--TABLA ORIGENES DE ORDEN
CREATE TABLE OrigenesOrden(
  OrigenID INT PRIMARY KEY IDENTITY,
  Descripcion VARCHAR(255) NOT NULL);



  --TABLA TIPOS DE PAGO
CREATE TABLE TiposPago(
  TipoPagoID INT PRIMARY KEY IDENTITY,
  Descripcion VARCHAR(255) NOT NULL);



  --TABLA MENSAJEROS
CREATE TABLE Mensajeros(
  MensajeroID INT PRIMARY KEY IDENTITY,
  Nombre VARCHAR(255) NOT NULL,
  EsExterno BIT NOT NULL);
  


  --TABLA ORDENES
CREATE TABLE Ordenes(
  OrdenID INT PRIMARY KEY IDENTITY,
  ClienteID INT,
  EmpleadoID INT,
  SucursalID INT,
  MensajeroID INT,
  TipoPagoID INT,
  OrigenID INT,
  HorarioVenta VARCHAR(50), --MAÑANA,TARDE,NOCHE.
  TotalCompra DECIMAL(10,2),
  KilometrosRecorrer DECIMAL(10,2),--EN CASO QUE LA ORDEN SEA DELIBERY 
  FechaDespacho DATETIME,--FECHA Y HORA DE ENTREGA AL REPARTIDOR
  FechaEntrega DATETIME,--FECHA Y HORA DE ENTREGA AL CLIENTE
  FechaOrdenTomada DATETIME,--FECHA Y HORA DE LA RECEPCION DE LA ORDEN
  FechaOrdenLista DATETIME);--FECHA Y HORA DE LA ORDEN LISTA.



  --TABLA DETALLE DE ORDENES
CREATE TABLE DetalleDeOrdenes(
  OrdenID INT,--CLAVE PRIMARIA COMPUESTA
  ProductoID INT,--CLAVE PRIMARIA COMPUESTA
  Cantidad INT,
  Precio DECIMAL(10,2),
  PRIMARY KEY (OrdenID,ProductoID));

  ------------------------------------------------------------------------------------------------
  --RELACION DE LAS TABLAS
  ------------------------------------------------------------------------------------------------

SELECT * FROM Categorias;
SELECT * FROM Productos;

ALTER TABLE Productos
ADD CONSTRAINT fk_Producto_Categoria --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID);

ALTER TABLE Empleados
ADD CONSTRAINT fk_Empleados_Sucursal --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(SucursalID) REFERENCES Sucursales(SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_Ordenes_Clientes --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_Ordenes_Empleados --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_Ordenes_Sucursales --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_Ordenes_Mensajeros --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(MensajeroID) REFERENCES Mensajeros(MensajeroID);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_Ordenes_TiposPagos --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(TipoPagoID) REFERENCES TiposPago(TipoPagoID);

ALTER TABLE Ordenes
ADD CONSTRAINT fk_Ordenes_Origen --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(OrigenID) REFERENCES OrigenesOrden(OrigenID);


ALTER TABLE DetalleDeOrdenes
ADD CONSTRAINT fk_Detalle_Producto --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID);

ALTER TABLE DetalleDeOrdenes
ADD CONSTRAINT fk_Detalle_Ordenes --LE ASIGNO UN NOMBRE PROPIO A LA RELACION
FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID);


--------------------------------------------FIN------------------------------------------------------------------------------


  



  





