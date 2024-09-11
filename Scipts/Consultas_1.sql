use proyecto;
-- #consulta1: Buscar empleados con nombre 'Carlos'
SELECT * FROM employees
WHERE name_ = 'Carlos';

-- #consulta2: Buscar cliente por número de documento
SELECT * FROM customers
WHERE document = 123456;

-- #consulta3: Buscar empleados con la ocupación 'Developer' y documentos mayores a 1,000,000
SELECT * FROM employees
WHERE occupation = 'Analista' AND name_ = "carlos";

-- #consulta4: Buscar clientes cuyo nombre sea 'Juan' o cuyo apellido sea 'Perez'
SELECT * FROM customers
WHERE name_ = 'Juan' OR lastname = 'Perez';

-- #consulta5: Buscar clientes cuyo nombre no sea 'Ana'
SELECT * FROM customers
WHERE name_ <> 'Ana';

-- #consulta6: Buscar productos cuyo precio sea mayor a 100,000
SELECT * FROM products
WHERE price > 100000;

-- #consulta7: Buscar reservas confirmadas
SELECT * FROM reserves r
JOIN reserve_states rs ON r.idstate = rs.idstate
WHERE rs.state_name = 'Confirmado';

-- #consulta8: Listar todas las reservas de un cliente específico (ej: idcustomers = 2)
SELECT * FROM reserves
WHERE idcustomers = 2;

-- #consulta9: Contar el total de productos reservados en una reserva específica
SELECT r.idreserves, COUNT(rp.idproduct) AS total_products
FROM reserves r
JOIN reserve_products rp ON r.idreserves = rp.idreserves
WHERE r.idreserves = 1  -- Cambia por el ID de la reserva
GROUP BY r.idreserves;

-- #consulta10: Mostrar la suma total de productos reservados por cliente
SELECT c.name_, c.lastname, SUM(rp.price * rp.quantity) AS total_spent
FROM customers c
JOIN reserves r ON c.idcustomers = r.idcustomers
JOIN reserve_products rp ON r.idreserves = rp.idreserves
GROUP BY c.idcustomers;

-- #consulta11: Buscar clientes que tengan más de una reserva
SELECT c.name_, c.lastname, COUNT(r.idreserves) AS total_reserves
FROM customers c
JOIN reserves r ON c.idcustomers = r.idcustomers
GROUP BY c.idcustomers
HAVING COUNT(r.idreserves) > 1;

-- #consulta12: Mostrar el producto más caro reservado en una reserva específica
SELECT p.product_name, MAX(rp.price) AS max_price
FROM reserve_products rp
JOIN products p ON rp.idproduct = p.idproduct
WHERE rp.idreserves = 2  -- Cambia por el ID de la reserva
GROUP BY p.product_name;

-- #consulta13: Mostrar el total de dinero gastado por cada cliente en sus reservas
SELECT c.name_, c.lastname, SUM(p.price) AS total_spent
FROM customers c
JOIN reserves r ON c.idcustomers = r.idcustomers
JOIN payment p ON r.idreserves = p.idreserves
GROUP BY c.idcustomers;



