use proyecto;
-- 1. **Filtrado de Datos**

-- Selecciona empleados cuyo nombre es 'Carlos'
SELECT * FROM employees
WHERE name_ = 'Carlos';

-- 2. **Condiciones de Filtrado**

-- Comparaciones Directas
-- Selecciona clientes cuyo documento es 123456
SELECT * FROM customers
WHERE document = 123456;




-- Condiciones Lógicas
-- Selecciona empleados que son 'Developer' y tienen un documento mayor a 1000000
SELECT * FROM employees
WHERE occupation = 'Developer' AND document > 1000000;

-- Condición con OR
-- Selecciona clientes que tienen el nombre 'Juan' o el apellido 'Perez'
SELECT * FROM customers
WHERE name_ = 'Juan' OR lastname = 'Perez';

-- Condición con NOT
-- Selecciona clientes que no tienen el nombre 'Ana'
SELECT * FROM customers
WHERE name_ <> 'Ana';

-- 3. **Operadores de Comparación**

-- Mayor que
-- Selecciona productos cuyo precio es mayor que 100000
SELECT * FROM products
WHERE price > 100000;



