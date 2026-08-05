create database retail_projet;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;


CREATE TABLE clientes (
    cliente_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    edad INT NOT NULL,
    fecha_registro DATE DEFAULT CURRENT_DATE,
    
    
    CONSTRAINT chk_cliente_edad CHECK (edad >= 18)
);


CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    
   
    CONSTRAINT chk_producto_precio CHECK (precio > 0),
    
    CONSTRAINT chk_producto_stock CHECK (stock >= 0)
);

-
CREATE TABLE ventas (
    venta_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    fecha_venta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
   
    CONSTRAINT fk_ventas_clientes FOREIGN KEY (cliente_id) 
        REFERENCES clientes(cliente_id) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_ventas_productos FOREIGN KEY (producto_id) 
        REFERENCES productos(producto_id) 
        ON DELETE CASCADE,
        
    
    CONSTRAINT chk_venta_cantidad CHECK (cantidad > 0)
);


BEGIN;


INSERT INTO clientes (nombre, email, edad) VALUES
('Ana García', 'ana.garcia@example.com', 28),
('Carlos López', 'carlos.lopez@example.com', 35),
('María Rodríguez', 'maria.rodriguez@example.com', 42),
('Juan Pérez', 'juan.perez@example.com', 19),
('Lucía Fernández', 'lucia.fernandez@example.com', 31);


INSERT INTO productos (nombre, categoria, precio, stock) VALUES
('Laptop Pro 15', 'Electrónica', 1200.00, 15),
('Mouse Inalámbrico', 'Electrónica', 25.50, 50),
('Teclado Mecánico', 'Electrónica', 75.00, 30),
('Silla Ergonómica', 'Muebles', 250.00, 10),
('Escritorio de Madera', 'Muebles', 180.00, 8);


INSERT INTO ventas (cliente_id, producto_id, cantidad, total) VALUES
(1, 1, 1, 1200.00),
(2, 2, 2, 51.00),
(3, 4, 1, 250.00),
(4, 3, 1, 75.00),
(5, 5, 2, 360.00);

COMMIT;




UPDATE productos
SET precio = precio * 1.10
WHERE categoria = 'Electrónica';


DELETE FROM ventas
WHERE venta_id = 5;