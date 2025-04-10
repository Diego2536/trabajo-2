CREATE DATABASE sistema_ventas;
USE sistema_ventas;

CREATE TABLE ciudad (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE sucursal (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad_id INT,
  FOREIGN KEY (ciudad_id) REFERENCES ciudad(id)
);

CREATE TABLE vendedor (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  sucursal_id INT,
  FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)
);

CREATE TABLE cliente (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  ciudad_id INT,
  FOREIGN KEY (ciudad_id) REFERENCES ciudad(id)
);

CREATE TABLE tipo_producto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100)
);

CREATE TABLE producto (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100),
  tipo_id INT,
  ciudad_id INT,
  FOREIGN KEY (tipo_id) REFERENCES tipo_producto(id),
  FOREIGN KEY (ciudad_id) REFERENCES ciudad(id)
);

CREATE TABLE venta (
  id INT AUTO_INCREMENT PRIMARY KEY,
  vendedor_id INT,
  cliente_id INT,
  producto_id INT,
  fecha DATE,
  FOREIGN KEY (vendedor_id) REFERENCES vendedor(id),
  FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  FOREIGN KEY (producto_id) REFERENCES producto(id)
);


-- Ciudades
INSERT INTO ciudad (nombre) VALUES 
('Bogotá'),
('Medellín'),
('Cali');

-- Sucursales
INSERT INTO sucursal (nombre, ciudad_id) VALUES 
('Sucursal Norte', 1),
('Sucursal Centro', 2),
('Sucursal Sur', 3);

-- Vendedores
INSERT INTO vendedor (nombre, sucursal_id) VALUES 
('Carlos Pérez', 1),
('Ana Gómez', 2),
('Luis Torres', 3);

-- Clientes
INSERT INTO cliente (nombre, ciudad_id) VALUES 
('María López', 1),
('Juan Díaz', 2),
('Laura Martínez', 3);

-- Tipos de Producto
INSERT INTO tipo_producto (nombre) VALUES 
('Ropa'),
('Electrónica'),
('Hogar');

-- Productos
INSERT INTO producto (nombre, tipo_id, ciudad_id) VALUES 
('Camisa Blanca', 1, 1),
('Pantalón Jeans', 1, 2),
('Televisor LED', 2, 1),
('Licuadora', 3, 3),
('Celular Android', 2, 2),
('Sábana Doble', 3, 1);

-- Ventas
INSERT INTO venta (vendedor_id, cliente_id, producto_id, fecha) VALUES 
(1, 1, 1, '2025-04-09'),
(2, 2, 2, '2025-04-08'),
(3, 3, 4, '2025-04-09'),
(1, 2, 3, '2025-04-07'),
(2, 1, 5, '2025-04-09');
