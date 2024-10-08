use proyecto;
-- #consulta1: Buscar empleados con nombre 'Carlos'
SELECT * FROM employees
WHERE `name` = 'Carlos';

-- #consulta2: Buscar cliente por número de documento
SELECT * FROM customers
WHERE document = 123456;

-- #consulta3: Buscar empleados con la ocupación 'Developer' y documentos mayores a 1,000,000
SELECT * FROM employees
WHERE occupation = 'Developer' AND document > 1000000;

-- #consulta4: Buscar clientes cuyo nombre sea 'Juan' o cuyo apellido sea 'Perez'
SELECT * FROM customers
WHERE `name` = 'Juan' OR lastname = 'Perez';

-- #consulta5: Buscar clientes cuyo nombre no sea 'Ana'
SELECT * FROM customers
WHERE `name` <> 'Ana';

-- #consulta6: Buscar productos cuyo precio sea mayor a 100,000
SELECT * FROM products
WHERE price > 100000;

-- #consulta7: Buscar reservas confirmadas
SELECT * FROM reserves r
JOIN reserve_states rs ON rs.id = r.idstate
WHERE rs.`name` = "Confirmada";

-- #consulta8: Listar todas las reservas de un cliente específico (ej: idcustomers = 2)
SELECT * FROM reserves
WHERE idcustomers = 2;

-- #consulta9: Contar el total de productos reservados en una reserva específica
SELECT r.id, COUNT(rp.idproduct) AS total_products
FROM reserves r
INNER JOIN reserve_products rp ON r.id = rp.idreserves
WHERE r.id = 1  -- Cambia por el ID de la reserva
GROUP BY r.id;

-- #consulta10: Mostrar la suma total de productos reservados por cliente
SELECT c.`name`, c.lastname, SUM(rp.price * rp.quantity) AS total_spent
FROM customers c
INNER JOIN reserves r ON c.id = r.idcustomers
INNER JOIN reserve_products rp ON r.id = rp.idreserves
GROUP BY c.id;

-- #consulta11: Buscar clientes que tengan más de una reserva
SELECT c.`name`, c.lastname, COUNT(r.id) AS total_reserves
FROM customers c
INNER JOIN reserves r ON c.id = r.idcustomers
GROUP BY c.id
HAVING COUNT(r.id) > 1;

-- #consulta12: Mostrar el producto más caro reservado en una reserva específica
SELECT p.`name`, MAX(rp.price) AS max_price
FROM reserve_products rp
INNER JOIN products p ON rp.idproduct = p.id
WHERE rp.idreserves = 2  -- Cambia por el ID de la reserva
GROUP BY p.`name`;

-- #consulta13: Mostrar el total de dinero gastado por cada cliente en sus reservas
SELECT c.`name`, c.lastname, SUM(p.price) AS total_spent
FROM customers c
INNER JOIN reserves r ON c.id = r.idcustomers
INNER JOIN payment p ON r.id = p.idreserves
GROUP BY c.id;


-- # CONCAT(table.atribute, ' ' , table.atribute) AS alias of the table --> Concat text string
-- # CONCAT_WS(' ', table.atribue, table.atribute) AS alias of the table
-- # LENGHT () --> Tamaño
-- # SUBSTRING(tabel.atribute,1,6) AS alias of the table --> to from to the character 1, to until the character 6
-- # Round(table.atribute, number) AS alias of the table --> Rounding the quantity of numbers with decimals
-- # ABS(table.atribute) AS alias of the table --> change el negative number for a positive number

-- # COUNT(table.atribute) AS alias --> Count how many register there is in a table
-- # SUM(table.atribute + table.atribute) AS alias --> Sum the value total of the tables 
-- # AVG(table.atribute) AS alias --> average of the values of the table
-- # MIN(table.atribute) AS alias --> Search the value min of the table
-- # MAX(table.atribute) AS alias --> Search the value max of the table

-- # GROUP BY table.atribute --> Group rows that have similars values
-- # ORDER BY table.atribute ASC or DESC--> Order the table of way ascendent or descendent 
-- # HAVING FUNCTION() --> Fitler groups after of the grouping with a condition

-- # ---------------------------------------------------

-- # Relations and Joins

-- # Inner Join: Only return the rows that have some coincidence


-- # 