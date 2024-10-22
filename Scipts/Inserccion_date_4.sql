USE proyecto;

-- 1. Insert into the type_document table (Document Types)
INSERT INTO type_document (name) VALUES
('CC'),  -- Cédula de Ciudadanía
('TI');  -- Tarjeta de Identidad

-- 2. Insert into the roles table (User Roles)
INSERT INTO roles (name) VALUES
('Administrador'),
('Empleado'),
('Cliente');

-- 3. Insert into the users table (Users)
INSERT INTO users (name, email, password) VALUES
('Carlos Pérez', 'carlosperez@ejemplo.com', 'clave123'),
('María Gómez', 'mariagomez@ejemplo.com', 'contraseña456'),
('Juan López', 'juanlopez@ejemplo.com', 'password789'),
('Ana Torres', 'anatorres@ejemplo.com', 'anaT_pass'),
('Pedro Sánchez', 'pedrosanchez@ejemplo.com', 'pedro_987'),
('Lucía Fernández', 'luciafernandez@ejemplo.com', 'luciaF_pass123'),
('Luis Martínez', 'luismartinez@ejemplo.com', 'luisM_secure'),
('Sofía Castro', 'sofiacastro@ejemplo.com', 'sofia_C123'),
('Miguel Reyes', 'miguelreyes@ejemplo.com', 'miguel_r_pass'),
('Elena Morales', 'elenamorales@ejemplo.com', 'elenaM_pass');

-- 4. Insert into the people table (People associated with users)
INSERT INTO people (name, lastName, phone, birthday, document, idTypeDocument, idUser) VALUES
('Carlos', 'Pérez', '3001234567', '2000-03-20', 1020304050, 1, 1),
('María', 'Gómez', '3109876543', '1999-08-15', 1122334455, 1, 2),
('Juan', 'López', '3204567890', '1998-12-10', 223344556, 1, 3),
('Ana', 'Torres', '3006543210', '2001-05-25', 334455667, 1, 4),
('Pedro', 'Sánchez', '3101122334', '1997-11-30', 445566788, 1, 5),
('Lucía', 'Fernández', '3207788990', '1999-06-10', 556778899, 1, 6),
('Luis', 'Martínez', '3009988776', '1995-09-12', 667789900, 1, 7),
('Sofía', 'Castro', '3107766554', '2002-07-18', 778990011, 1, 8),
('Miguel', 'Reyes', '3203344556', '2000-01-22', 899001122, 1, 9),
('Elena', 'Morales', '3005544332', '2001-03-05', 900112233, 1, 10);

-- 5. Insert into the usersRoles table (Assigning roles to users)
INSERT INTO usersRoles (idUser, idRole) VALUES
(1, 2),  -- Carlos is Administrator
(2, 3),  -- María is Client
(3, 3),  -- Juan is Client
(4, 3),  -- Ana is Client
(5, 2),  -- Pedro is Administrator
(6, 3),  -- Lucía is Client
(7, 2),  -- Luis is Administrator
(8, 3),  -- Sofía is Client
(9, 3),  -- Miguel is Client
(10, 2); -- Elena is Administrator

-- 6. Insert into the productCategories table (Product Categories)
INSERT INTO productCategories (name) VALUES
('Cancha Futbol'),
('Cancha Voley');

-- 7. Insert into the products table (Products)
INSERT INTO products (name, details, price, idProductCategory) VALUES
('Cancha futbol 5', 'Cancha futbol 5, duración de 1 hora y tamaño x-y', 75000, 1),
('Cancha futbol 7', 'Cancha futbol 7, duración de 1 hora y tamaño x-y', 90000, 1),
('Cancha VoleyBall', 'Cancha voleyball con superficie de arena, duración de 1 hora', 60000, 2);

-- 8. Insert into the reserveStates table (Reservation States)
INSERT INTO reserveStates (name) VALUES
('Cancelada'),
('Confirmada'),
('Pendiente');

-- 9. Insert into the reserves table (Court or facility reservations)
INSERT INTO reserves (idState, time, dateReserve, idUser, created_by, updated_by) VALUES
(1, '08:00:00', '2024-10-15', 1, 1, 1),  -- Carlos reserves a court
(2, '09:00:00', '2024-10-16', 2, 2, 2),  -- María reserves a court
(1, '10:00:00', '2024-10-17', 3, 3, 1),  -- Juan reserves
(3, '11:00:00', '2024-10-18', 4, 4, 2),  -- Ana reserves
(2, '12:00:00', '2024-10-19', 5, 5, 1),  -- Pedro reserves
(2, '13:00:00', '2024-10-20', 6, 6, 2),  -- Lucía reserves
(2, '14:00:00', '2024-10-21', 7, 7, 1),  -- Luis reserves
(2, '15:00:00', '2024-10-22', 8, 8, 2),  -- Sofía reserves
(2, '16:00:00', '2024-10-23', 9, 9, 1),  -- Miguel reserves
(1, '17:00:00', '2024-10-24', 10, 10, 2); -- Elena reserves



-- 10. Insert into the paymentMethods table (Payment Methods)
INSERT INTO paymentMethods (name) VALUES
('Tarjeta'),
('Efectivo'),
('Transferencia bancaria');

-- 11. Insert into the discount table (Applied Discounts)
INSERT INTO discount (total) VALUES
(15), 
(100);


-- 12. Insert into the payment table (Payments made)
INSERT INTO payment (idmethod, date_pay, totalPaid, idDiscount, idReserve, created_by, updated_by) VALUES
(1, '2024-10-15', 75000, 1, 1, 1, 1),  -- Carlos pays with card and gets a discount for the football field
(2, '2024-10-16', 60000, NULL, 2, 2, 2),  -- María pays in cash without discount for the volleyball court
(1, '2024-10-17', 75000, 1, 3, 3, 3),  -- Juan pays with card and gets a discount for the football field
(2, '2024-10-18', 60000, NULL, 4, 4, 4),  -- Ana pays in cash without discount for the volleyball court
(3, '2024-10-19', 90000, 2, 5, 5, 5),  -- Pedro pays by bank transfer with a discount for the football field
(1, '2024-10-20', 75000, 1, 6, 6, 6),  -- Lucía pays with card and gets a discount for the football field
(2, '2024-10-21', 60000, NULL, 7, 7, 7),  -- Luis pays in cash without discount for the volleyball court
(3, '2024-10-22', 85000, 1, 8, 8, 8),  -- Sofía pays by bank transfer with discount for the football field
(1, '2024-10-23', 75000, 1, 9, 9, 9),  -- Miguel pays with card and gets a discount for the football field
(2, '2024-10-24', 60000, NULL, 10, 10, 10);  -- Elena pays in cash without discount for the volleyball court


-- 13. Inserción en la tabla reserveProducts (Productos adquiridos junto a la reserva)
INSERT INTO reserveProducts (idReserve, idProduct, quantity) VALUES
(1, 1, 2),  -- Reserva 1
(2, 3, 1),  -- Reserva 2
(3, 1, 1),  -- Reserva 3
(4, 2, 1),  -- Reserva 4
(5, 1, 1),  -- Reserva 5
(6, 2, 2),  -- Reserva 6
(7, 3, 1),  -- Reserva 7
(8, 1, 1),  -- Reserva 8
(9, 2, 1),  -- Reserva 9
(10, 3, 1); -- Reserva 10

