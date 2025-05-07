USE Northwind;
GO

-- Crear roles
CREATE ROLE rol_ventas;
CREATE ROLE rol_bodega;
CREATE ROLE rol_compras;
CREATE ROLE rol_admin;
GO

-- Crear usuarios y asignar roles
CREATE LOGIN usuario_ventas WITH PASSWORD = 'Ventas123!';
CREATE USER usuario_ventas FOR LOGIN usuario_ventas;
EXEC sp_addrolemember 'rol_ventas', 'usuario_ventas';

CREATE LOGIN usuario_bodega WITH PASSWORD = 'Bodega123!';
CREATE USER usuario_bodega FOR LOGIN usuario_bodega;
EXEC sp_addrolemember 'rol_bodega', 'usuario_bodega';

CREATE LOGIN usuario_compras WITH PASSWORD = 'Compras123!';
CREATE USER usuario_compras FOR LOGIN usuario_compras;
EXEC sp_addrolemember 'rol_compras', 'usuario_compras';

CREATE LOGIN usuario_admin WITH PASSWORD = 'Admin123!';
CREATE USER usuario_admin FOR LOGIN usuario_admin;
EXEC sp_addrolemember 'rol_admin', 'usuario_admin';
GO

-- Permisos para rol_ventas
GRANT SELECT ON Customers TO rol_ventas;
GRANT SELECT ON Orders TO rol_ventas;
GRANT SELECT ON Products TO rol_ventas;
GRANT INSERT ON Orders TO rol_ventas;
GRANT UPDATE ON Orders (ShippedDate) TO rol_ventas;

-- Permisos para rol_bodega
GRANT SELECT ON Products TO rol_bodega;
GRANT UPDATE ON Products (UnitsInStock, UnitsOnOrder) TO rol_bodega;

-- Permisos para rol_compras
GRANT SELECT, INSERT, UPDATE, DELETE ON Suppliers TO rol_compras;
GRANT INSERT ON Products TO rol_compras;
GRANT SELECT ON Products TO rol_compras;
GRANT SELECT,UPDATE ON Products (UnitPrice, SupplierID) TO rol_compras;

-- Permisos para rol_admin
GRANT CONTROL ON DATABASE::Northwind TO rol_admin;