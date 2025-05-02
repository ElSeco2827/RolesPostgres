-- Crear base de datos
create database Tienda;

-- Crear tablas
create table Productos(
	Marca varchar(50),
	Precio varchar(10)
);

create table Ventas(
	total varchar(10)
);

-- Insertar datos
insert into Productos values ('Refresco', '10');
insert into Productos values ('Donas', '15');
insert into Productos values ('Sabritas', '12');

insert into Ventas values ('25');
insert into Ventas values ('12');
insert into Ventas values ('15');
insert into Ventas values ('22');
insert into Ventas values ('37');

-- Crear usuarios
-- Rol de proveedores se encarga de actualizar, insertar y ver productos
CREATE ROLE Rol_Proveedor; -- Crear rol para proveedores
GRANT SELECT, INSERT, UPDATE ON TABLE Productos TO Rol_Proveedor; -- Permisos de lectura, actualizacion y escritura
CREATE USER Amanda WITH PASSWORD 'Proveedor'; -- Creacion de usuarios
CREATE USER Fernando WITH PASSWORD 'Proveedor';
CREATE USER Carlos WITH PASSWORD 'Proveedor';
GRANT Rol_Proveedor TO Amanda; -- Aplicar rol proveedor a usuarios
GRANT Rol_Proveedor to Fernando;
GRANT Rol_Proveedor to Carlos;
ALTER ROLE Rol_Proveedor INHERIT; -- Actualizar el rol

-- Rol de ventas se encarga de insertar y ver las ventas
CREATE ROLE Rol_Venta; -- Crear rol
GRANT SELECT, INSERT ON TABLE Ventas TO Rol_Venta; -- Permisos de lectura y escritura
CREATE USER Emmanuel WITH PASSWORD 'Proveedor'; -- Crear usuarios
CREATE USER Alfonso WITH PASSWORD 'Proveedor';
GRANT Rol_Venta TO Emmanuel; -- Dar rol venta a usuarios
GRANT Rol_Venta to Alfonso;
ALTER ROLE Rol_Venta INHERIT; -- Actualizar rol

-- Rol de administrador se encarga de toda la base de datos
CREATE USE Admon WITH PASSWORD 'Administrador'; -- crear usuario
ALTER USER Admon WITH SUPERUSER; -- dar permisos de super usuario (rol de mayor rango)