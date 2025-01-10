-- Crear tabla Categorias (
CREATE TABLE IF NOT EXISTS Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Categoria VARCHAR(100) NOT NULL UNIQUE -- Nombre único para cada categoría
);

-- Crear tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    ID_Categoria INT NOT NULL, -- Relación con la tabla Categorias
    Descripcion TEXT,
    Precio DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID_Categoria) ON DELETE CASCADE
);

-- Crear tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);

-- Crear tabla Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente INT NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente) ON DELETE CASCADE
);

-- Crear tabla DetallesPedidos
CREATE TABLE IF NOT EXISTS DetallesPedidos (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pedido INT NOT NULL,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido) ON DELETE CASCADE,
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto) ON DELETE CASCADE
);

-- Insertar categorias
INSERT INTO Categorias (Nombre_Categoria)
VALUES 
('Material Escolar'),
('Papelería'),
('Tecnología'),
('Mobiliario Escolar'),
('Arte y Manualidades'),
('Deportes'),
('Laboratorio');

-- Insertar productos (material escolar)
INSERT INTO Productos (Nombre, ID_Categoria, Descripcion, Precio, Stock)
VALUES
-- Material Escolar
('Lápiz HB', 1, 'Lápiz estándar para escritura', 0.50, 500),
('Goma de borrar', 1, 'Goma de borrar no tóxica', 0.30, 300),
('Sacapuntas', 1, 'Sacapuntas de plástico', 0.75, 200),
('Regla 30cm', 1, 'Regla de plástico transparente', 1.00, 150),
('Tijeras escolares', 1, 'Tijeras seguras para niños', 2.50, 100),

-- Papelería
('Cuaderno A4', 2, 'Cuaderno con 100 hojas', 2.00, 300),
('Cuaderno A5', 2, 'Cuaderno pequeño con 80 hojas', 1.50, 250),
('Post-it', 2, 'Notas adhesivas multicolor', 1.20, 200),
('Carpeta plástica', 2, 'Carpeta con broches', 2.00, 150),
('Papel bond 500 hojas', 2, 'Resma de papel blanco A4', 5.00, 100),

-- Tecnología
('Calculadora básica', 3, 'Calculadora para operaciones simples', 5.00, 50),
('Calculadora científica', 3, 'Calculadora avanzada para matemáticas', 15.00, 40),
('Ratón inalámbrico', 3, 'Ratón óptico sin cables', 10.00, 30),
('Teclado ergonómico', 3, 'Teclado para uso prolongado', 20.00, 20),
('USB 16GB', 3, 'Memoria USB de alta velocidad', 8.00, 60),

-- Mobiliario Escolar
('Silla escolar', 4, 'Silla ergonómica para estudiantes', 30.00, 20),
('Mesa escolar', 4, 'Mesa de madera resistente', 50.00, 15),
('Estantería', 4, 'Estantería de metal para libros', 80.00, 10),
('Armario escolar', 4, 'Armario con cerradura', 100.00, 5),
('Pizarrón blanco', 4, 'Pizarra blanca con borrador', 40.00, 8),

-- Arte y Manualidades
('Pinturas acrílicas', 5, 'Set de 12 colores', 12.00, 50),
('Pinceles', 5, 'Set de 5 pinceles', 8.00, 60),
('Papel para acuarela', 5, 'Papel especial para pinturas', 6.00, 70),
('Plastilina', 5, 'Set de plastilina multicolor', 4.00, 80),
('Cinta adhesiva', 5, 'Cinta para manualidades', 2.00, 100),

-- Deportes
('Pelota de fútbol', 6, 'Pelota tamaño estándar', 20.00, 30),
('Raqueta de tenis', 6, 'Raqueta de aluminio', 25.00, 20),
('Conos de entrenamiento', 6, 'Set de 10 conos', 15.00, 40),
('Silbato', 6, 'Silbato de metal', 3.00, 100),
('Cuerda para saltar', 6, 'Cuerda ajustable', 5.00, 50),

-- Laboratorio
('Microscopio escolar', 7, 'Microscopio básico para estudiantes', 100.00, 10),
('Tubo de ensayo', 7, 'Set de 10 tubos de vidrio', 15.00, 30),
('Beaker 500ml', 7, 'Recipiente graduado de vidrio', 10.00, 25),
('Pinzas de laboratorio', 7, 'Pinzas de acero inoxidable', 8.00, 40),
('Cajas de Petri', 7, 'Set de 20 unidades', 12.00, 35);

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

-- Insertar detalles de pedidos (15 pedidos con productos y cantidades variadas)
INSERT INTO DetallesPedidos (ID_Pedido, ID_Producto, Cantidad, Precio_Unitario)
VALUES
    -- Pedido 1
    (1, 1, 10, 0.50),  -- 10 Lápices HB
    (1, 2, 5, 0.30),   -- 5 Gomas de borrar

    -- Pedido 2
    (2, 3, 3, 0.75),   -- 3 Sacapuntas
    (2, 4, 2, 1.00),   -- 2 Reglas 30cm

    -- Pedido 3
    (3, 5, 4, 2.50),   -- 4 Tijeras escolares
    (3, 6, 2, 2.00),   -- 2 Cuadernos A4

    -- Pedido 4
    (4, 7, 3, 1.50),   -- 3 Cuadernos A5
    (4, 8, 10, 1.20),  -- 10 Post-it

    -- Pedido 5
    (5, 9, 5, 2.00),   -- 5 Carpetas plásticas
    (5, 10, 2, 5.00),  -- 2 Resmas de papel bond

    -- Pedido 6
    (6, 11, 1, 5.00),  -- 1 Calculadora básica
    (6, 12, 1, 15.00), -- 1 Calculadora científica

    -- Pedido 7
    (7, 13, 2, 10.00), -- 2 Ratones inalámbricos
    (7, 14, 1, 20.00), -- 1 Teclado ergonómico

    -- Pedido 8
    (8, 15, 4, 8.00),  -- 4 USB 16GB
    (8, 16, 1, 30.00), -- 1 Silla escolar

    -- Pedido 9
    (9, 17, 1, 50.00), -- 1 Mesa escolar
    (9, 18, 1, 80.00), -- 1 Estantería

    -- Pedido 10
    (10, 19, 2, 100.00), -- 2 Armarios escolares
    (10, 20, 1, 40.00),  -- 1 Pizarrón blanco

    -- Pedido 11
    (11, 21, 3, 12.00), -- 3 Sets de pinturas acrílicas
    (11, 22, 2, 8.00),  -- 2 Sets de pinceles

    -- Pedido 12
    (12, 23, 5, 6.00),  -- 5 Papeles para acuarela
    (12, 24, 4, 4.00),  -- 4 Sets de plastilina

    -- Pedido 13
    (13, 25, 10, 2.00), -- 10 Cintas adhesivas
    (13, 26, 1, 20.00), -- 1 Pelota de fútbol

    -- Pedido 14
    (14, 27, 1, 25.00), -- 1 Raqueta de tenis
    (14, 28, 5, 15.00), -- 5 Conos de entrenamiento

    -- Pedido 15
    (15, 29, 1, 3.00),  -- 1 Silbato
    (15, 30, 2, 5.00);  -- 2 Cuerdas para saltar
