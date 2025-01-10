- [Consulta 1: Total de ventas por categoría de producto]
-- Esta consulta calcula el total de ventas de cada categoría de producto.
-- Combina las tablas Categorias, Productos y DetallesPedidos, utilizando JOIN.
-- SUM se usa para calcular el total de las ventas y se agrupan los resultados por categoría.

SELECT 
    c.Nombre_Categoria AS Categoria,
    SUM(dp.Cantidad * dp.Precio_Unitario) AS Total_Ventas
FROM 
    Categorias c
JOIN 
    Productos p ON c.ID_Categoria = p.ID_Categoria
JOIN 
    DetallesPedidos dp ON p.ID_Producto = dp.ID_Producto
GROUP BY 
    c.Nombre_Categoria
ORDER BY 
    Total_Ventas DESC;

-- [Consulta 2: Promedio de gasto por cliente]
-- Esta consulta calcula el promedio de gasto de cada cliente.
-- Combina las tablas Clientes y Pedidos usando JOIN, y calcula SUM para el total y AVG para el promedio.

SELECT 
    cl.Nombre AS Nombre_Cliente,
    cl.Apellido AS Apellido_Cliente,
    AVG(ped.Total_Pedido) AS Promedio_Gasto
FROM 
    Clientes cl
JOIN (
    SELECT 
        p.ID_Cliente,
        SUM(dp.Cantidad * dp.Precio_Unitario) AS Total_Pedido
    FROM 
        Pedidos p
    JOIN 
        DetallesPedidos dp ON p.ID_Pedido = dp.ID_Pedido
    GROUP BY 
        p.ID_Cliente
) ped ON cl.ID_Cliente = ped.ID_Cliente
GROUP BY 
    cl.ID_Cliente;

-- [Consulta 3: Productos más vendidos]
-- Esta consulta lista los productos más vendidos en orden descendente.
-- Combina las tablas Productos y DetallesPedidos y utiliza ORDER BY para ordenar los resultados.

SELECT 
    p.Nombre AS Producto,
    SUM(dp.Cantidad) AS Total_Vendido
FROM 
    Productos p
JOIN 
    DetallesPedidos dp ON p.ID_Producto = dp.ID_Producto
GROUP BY 
    p.Nombre
ORDER BY 
    Total_Vendido DESC;

-- [Consulta 4: Clientes sin pedidos]
-- Esta consulta identifica a los clientes que no han hecho ningún pedido.
-- Utiliza LEFT JOIN para unir Clientes y Pedidos, y filtra los valores nulos en la columna de ID_Pedido.

SELECT 
    cl.Nombre AS Nombre_Cliente,
    cl.Apellido AS Apellido_Cliente
FROM 
    Clientes cl
LEFT JOIN 
    Pedidos ped ON cl.ID_Cliente = ped.ID_Cliente
WHERE 
    ped.ID_Pedido IS NULL;
