use proyecto;

#insertar datos
INSERT INTO type_document (`name`)
VALUES
('CC'),('PP'),('CE');


INSERT INTO reserve_states (`name`)
VALUES
('Confirmada'),
('Pendiente'),
('Cancelada');

INSERT INTO reserves (idstate, `time`, date_reserve, idcustomers)
VALUES
(1, '08:30:00', '2024-09-10', 1),
(2, '11:15:00', '2024-09-11', 2),
(3, '13:45:00', '2024-09-12', 3),
(1, '16:00:00', '2024-09-13', 4),
(2, '18:30:00', '2024-09-14', 5),
(1, '10:00:00', '2024-09-15', 1),
(3, '12:00:00', '2024-09-16', 2),
(2, '14:30:00', '2024-09-17', 3),
(1, '17:00:00', '2024-09-18', 4),
(2, '19:15:00', '2024-09-19', 5);
INSERT INTO payment_methods (`name`)
VALUES
('Tarjeta de Crédito'),
('Tarjeta Débito'),
('Transferencia Bancaria'),
('Efectivo');

INSERT INTO payment (idmethod, date_pay, price, idreserves)
VALUES
(1, '2024-09-10', 150.00, 1),
(2, '2024-09-11', 200.00, 2),
(3, '2024-09-12', 250.00, 3),
(1, '2024-09-13', 300.00, 4),
(2, '2024-09-14', 180.00, 5);
INSERT INTO product_categories (`name`, details)
VALUES
('Fútbol', 'Canchas para fútbol de diferentes tamaños'),
('Voleibol', 'Canchas para jugar voleibol'),
('Otros Deportes', 'Canchas y espacios para otros deportes');
INSERT INTO products (`name`, details, price, idcategory)
VALUES
('Cancha Fútbol 5', 'Cancha de Fútbol para 10 personas (5 por equipo)', 150000, 1),
('Cancha Fútbol 6', 'Cancha de Fútbol para 12 personas (6 por equipo)', 180000, 1),
('Cancha Fútbol 7', 'Cancha de Fútbol para 14 personas (7 por equipo)', 200000, 1),
('Cancha de Voleibol', 'Cancha estándar para voleibol', 120000, 2),
('Cancha Multideporte', 'Cancha adaptable para varios deportes (fútbol, voleibol, etc.)', 220000, 3);

INSERT INTO reserve_products (idreserves, idproduct, quantity, price)
VALUES
(1, 1, 1, 150000);  -- 1 Cancha Fútbol 5

INSERT INTO reserve_products (idreserves, idproduct, quantity, price)
VALUES
(2, 2, 1, 180000);  -- 1 Cancha Fútbol 6

INSERT INTO reserve_products (idreserves, idproduct, quantity, price)
VALUES
(3, 4, 1, 120000);  -- 1 Cancha de Voleibol

INSERT INTO reserve_products (idreserves, idproduct, quantity, price)
VALUES
(4, 3, 1, 200000);  -- 1 Cancha Fútbol 7
