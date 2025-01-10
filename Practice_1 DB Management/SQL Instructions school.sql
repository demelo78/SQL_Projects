-- Crear la base de datos
CREATE DATABASE EscuelaMaterial;
USE EscuelaMaterial;

-- Tabla Productos
CREATE TABLE Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL
);

-- Tabla Clientes
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) ON DELETE CASCADE
);

-- Tabla Detalles de Pedidos
CREATE TABLE DetallesPedidos (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido) ON DELETE CASCADE,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto) ON DELETE CASCADE
);

-- Insertar clientes (nombres ficticios japoneses y direcciones reales en Japón)
INSERT INTO Clientes (Nombre, Apellido, Direccion, Telefono, Email)
VALUES
    ('Taro', 'Yamamoto', '1-1-1 Shibuya, Tokio, Japón', '03-1234-5678', 'taro.yamamoto@example.com'),
    ('Yuki', 'Tanaka', '2-2-2 Shinjuku, Tokio, Japón', '03-2345-6789', 'yuki.tanaka@example.com'),
    ('Haruki', 'Kobayashi', '3-3-3 Minato, Tokio, Japón', '03-3456-7890', 'haruki.kobayashi@example.com'),
    ('Sakura', 'Nakamura', '4-4-4 Akihabara, Tokio, Japón', '03-4567-8901', 'sakura.nakamura@example.com'),
    ('Naoki', 'Sato', '5-5-5 Chiyoda, Tokio, Japón', '03-5678-9012', 'naoki.sato@example.com'),
    ('Aiko', 'Suzuki', '6-6-6 Shinjuku, Tokio, Japón', '03-6789-0123', 'aiko.suzuki@example.com'),
    ('Hiroshi', 'Takahashi', '7-7-7 Ikebukuro, Tokio, Japón', '03-7890-1234', 'hiroshi.takahashi@example.com'),
    ('Mika', 'Watanabe', '8-8-8 Roppongi, Tokio, Japón', '03-8901-2345', 'mika.watanabe@example.com'),
    ('Shinji', 'Yoshida', '9-9-9 Ochanomizu, Tokio, Japón', '03-9012-3456', 'shinji.yoshida@example.com'),
    ('Aya', 'Ishikawa', '10-10-10 Shibuya, Tokio, Japón', '03-0123-4567', 'aya.ishikawa@example.com');

-- Insertar pedidos (15 pedidos aleatorios, con fechas y clientes asignados)
INSERT INTO Pedidos (Fecha, ID_Cliente)
VALUES
    ('2025-01-01', 1),
    ('2025-01-02', 2),
    ('2025-01-03', 3),
    ('2025-01-04', 4),
    ('2025-01-05', 5),
    ('2025-01-06', 6),
    ('2025-01-07', 7),
    ('2025-01-08', 8),
    ('2025-01-09', 9),
    ('2025-01-10', 10),
    ('2025-01-11', 1),
    ('2025-01-12', 2),
    ('2025-01-13', 3),
    ('2025-01-14', 4),
    ('2025-01-15', 5);

-- Insertar detalles de pedidos (15 pedidos con productos y cantidades aleatorias)
INSERT INTO DetallesPedidos (ID_Pedido, ID_Producto, Cantidad, Precio_Unitario)
VALUES
    (1, 1, 2, 200),  -- Pedido 1: 2 Cuadernos
    (1, 2, 5, 50),   -- Pedido 1: 5 Lápices
    (2, 3, 3, 80),   -- Pedido 2: 3 Gomas de borrar
    (2, 4, 1, 1500), -- Pedido 2: 1 Mochila
    (3, 5, 10, 120), -- Pedido 3: 10 Reglas
    (3, 6, 5, 150),  -- Pedido 3: 5 Bolígrados
    (4, 7, 2, 350),  -- Pedido 4: 2 Carpetas
    (4, 8, 1, 500),  -- Pedido 4: 1 Estuche
    (5, 9, 10, 1000),-- Pedido 5: 10 Marcadores
    (5, 10, 5, 1200),-- Pedido 5: 5 Paquetes de Papel A4
    (6, 1, 3, 200),  -- Pedido 6: 3 Cuadernos
    (7, 2, 6, 50),   -- Pedido 7: 6 Lápices
    (8, 3, 4, 80),   -- Pedido 8: 4 Gomas de borrar
    (9, 4, 2, 1500), -- Pedido 9: 2 Mochilas
    (10, 5, 1, 120); -- Pedido 10: 1 Regla
