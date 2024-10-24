USE proyecto;

-- Insertar tipos de documentos
INSERT INTO type_document (name) VALUES
('CC'),
('TI'), 
('CE');
-- Insertar roles
INSERT INTO roles (name) VALUES
('Customer'), 
('Admin');

-- Insertar usuarios
INSERT INTO users (email, password) VALUES
('luis.moreno@example.com', 'password111'),
('sofia.herrera@example.com', 'password222'),
('pablo.ortiz@example.com', 'password333'),
('veronica.castro@example.com', 'password444'),
('diego.ramirez@example.com', 'password555'),
('laura.pineda@example.com', 'password666'),
('felipe.cordoba@example.com', 'password777'),
('paola.mendoza@example.com', 'password888'),
('andres.torres@example.com', 'password999'),
('carolina.barrera@example.com', 'password000');

-- Insertar relaciones de usuarios y roles
INSERT INTO usersRoles (idUser, idRole) VALUES
(1, 1),  -- luis.moreno@example.com as Customer
(2, 1),  -- sofia.herrera@example.com as Customer
(3, 1),  -- pablo.ortiz@example.com as Customer
(4, 1),  -- veronica.castro@example.com as Customer
(5, 1),  -- diego.ramirez@example.com as Customer
(6, 1),  -- laura.pineda@example.com as Customer
(7, 2),  -- felipe.cordoba@example.com as Admin
(8, 1),  -- paola.mendoza@example.com as Customer
(9, 1),  -- andres.torres@example.com as Customer
(10, 1); -- carolina.barrera@example.com as Customer

-- Insertar tipos de números de teléfono
INSERT INTO typePhoneNumber (name) VALUES
('Mobile'),
('landline'),
('Work');

-- Insertar ciudades
INSERT INTO city (name) VALUES
('Bogotá'), 
('Medellín'), 
('Cali'), 
('Barranquilla'), 
('Cartagena');

-- Insertar direcciones
INSERT INTO address (idCity, neighborhood, street) VALUES
(1, 'Chapinero', 'Calle 45 # 26-32'),  -- Bogotá
(2, 'El Poblado', 'Carrera 43A # 4 Sur-89'),  -- Medellín
(3, 'San Fernando', 'Avenida 2 # 10-34'),  -- Cali
(4, 'Centro', 'Calle 30 # 7-25'),  -- Barranquilla
(5, 'Getsemaní', 'Calle del Arsenal # 2-55');  -- Cartagena

-- Asociar números de teléfono a personas (asumiendo que ya tienes IDs generados)
INSERT INTO people (name, lastName, birthday, document, idAddress, idTypeDocument, idUser) VALUES
('Luis', 'Moreno', '1990-05-15', 12345678, 1, 1, 1),  -- User 1
('Sofía', 'Herrera', '1985-06-20', 87654321, 2, 1, 2),  -- User 2
('Pablo', 'Ortiz', '1992-07-10', 13579246, 3, 2, 3),  -- User 3
('Verónica', 'Castro', '1995-08-30', 24681357, 4, 1, 4),  -- User 4
('Diego', 'Ramírez', '1988-09-05', 98765432, 5, 2, 5),  -- User 5
('Laura', 'Pineda', '1993-10-12', 65432109, 1, 1, 6),  -- User 6
('Felipe', 'Córdoba', '1980-11-18', 12309876, 2, 2, 7),  -- User 7
('Paola', 'Mendoza', '1991-12-25', 54321098, 3, 1, 8),  -- User 8
('Andrés', 'Torres', '1984-01-30', 67890123, 4, 2, 9),  -- User 9
('Carolina', 'Barrera', '1996-02-14', 43210987, 5, 1, 10);  -- User 10

-- Asociar números de teléfono a personas
INSERT INTO people_phone (idPerson, number, idTypePhone) VALUES
(1,'3001234567', 1),  -- Luis with Mobile
(2,'6012345678', 2),  -- Sofía with landline
(3,'3109876543', 1),  -- Pablo with Mobile
(4,'3201234567', 1),  -- Verónica with Mobile
(5,'4001234567', 3),  -- Diego with Work
(6,'3012345678', 1),  -- Laura with Mobile
(7,'6023456789', 2),  -- Felipe with Home
(8,'3112345678', 1),  -- Paola with Mobile
(9,'3152345678', 1),  -- Andrés with Mobile
(10,'4009876543', 3); -- Carolina with Work

-- Inserción de datos en productCategories
INSERT INTO productCategories (`name`) VALUES
('Cancha de Fútbol 11'),
('Cancha de Fútbol 7'),
('Cancha de Fútbol 6'),
('Cancha de Fútbol 5'),
('Cancha de Voleibol');

INSERT INTO products (`name`, details, price, idProductCategory) VALUES
('Cancha de Fútbol 11 - Estadio', 'Cancha de fútbol 11 en óptimas condiciones.', 1000, 1),
('Cancha de Fútbol 7 - Polideportivo', 'Cancha de fútbol 7 con césped sintético.', 800, 2),
('Cancha de Fútbol 6 - Complejo Deportivo', 'Cancha de fútbol 6 para eventos.', 600, 3),
('Cancha de Fútbol 5 - Mini Estadio', 'Cancha de fútbol 5, ideal para amistosos.', 500, 4),
('Cancha de Voleibol - Arena', 'Cancha de voleibol con arena y tribunas.', 300, 5);

-- Inserción de datos en reserveStates
INSERT INTO reserveStates (`name`) VALUES
('Pendiente'),
('Confirmado'),
('Cancelado');

-- Inserción de datos en reserves
INSERT INTO reserves (idState, `time`, dateReserve, idUser) VALUES
(2, '10:00:00', '2024-11-01', 1),
(2, '11:00:00', '2024-11-01', 2),
(1, '12:00:00', '2024-11-01', 3),
(2, '13:00:00', '2024-11-01', 4),
(2, '14:00:00', '2024-11-01', 5),
(1, '15:00:00', '2024-11-01', 6),
(2, '16:00:00', '2024-11-01', 8),
(2, '17:00:00', '2024-11-01', 9),
(1, '18:00:00', '2024-11-01', 10),
(2, '19:00:00', '2024-11-01', 1),
(1, '10:00:00', '2024-11-02', 1),
(2, '11:00:00', '2024-11-02', 2),
(1, '12:00:00', '2024-11-02', 3),
(2, '13:00:00', '2024-11-02', 4),
(1, '14:00:00', '2024-11-02', 5),
(2, '15:00:00', '2024-11-02', 6),
(1, '16:00:00', '2024-11-02', 8),
(2, '17:00:00', '2024-11-02', 9),
(1, '18:00:00', '2024-11-02', 10),
(3, '19:00:00', '2024-11-02', 1);

-- Inserción en paymentMethods
INSERT INTO paymentMethods (`name`) VALUES
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia Bancaria'),
('Efectivo'),
('PayPal');

-- Inserción en statusPayment
INSERT INTO statusPayment (`name`) VALUES
('Pendiente'),
('Completado'),
('Fallido'),
('Reembolsado');

-- Inserción en statusGateway
INSERT INTO statusGateway (`name`) VALUES
('Éxito'),
('Error'),
('Pendiente');

-- Inserción en discount
INSERT INTO discount (total) VALUES
(10),   -- Descuento de $10
(20),   -- Descuento de $20
(30);   -- Descuento de $30

-- Inserción en PaymentTransactionInformation
INSERT INTO PaymentTransactionInformation (idCustomers, numberTarjet, idStatus, idPayMethods) VALUES
(1, 1234567812345678, 2, 1), -- Cliente 1, Tarjeta de Crédito, Completado, Método 1
(2, 1234567812345679, 1, 2), -- Cliente 2, Tarjeta de Débito, Pendiente, Método 2
(3, 1234567812345680, 2, 3), -- Cliente 3, Transferencia Bancaria, Completado, Método 3
(4, NULL, 2, (SELECT id FROM paymentMethods WHERE name = 'Efectivo'), NULL), -- Cliente 4, Efectivo, Completado, Método 4
(5, 1234567812345682, 2, 5), -- Cliente 5, PayPal, Completado, Método 5
(6, 1234567812345683, 2, 1), -- Cliente 6, Tarjeta de Crédito, Completado, Método 1
(8, 1234567812345684, 1, 2), -- Cliente 8, Tarjeta de Débito, Pendiente, Método 2
(9, 1234567812345685, 2, 3), -- Cliente 9, Transferencia Bancaria, Completado, Método 3
(10, NULL, 2, (SELECT id FROM paymentMethods WHERE name = 'Efectivo'), NULL); -- Cliente 4, Efectivo, Completado, Método 4

-- Inserción en paymentGatewayRecords
INSERT INTO paymentGatewayRecords (idTransaction, idStatus, gateway_response, transaction_reference, error_code) VALUES
(1, 2, 'Transacción exitosa', 'TRX123456', NULL),  -- Transacción 1: Completado
(2, 1, 'Esperando confirmación', 'TRX123457', NULL), -- Transacción 2: Pendiente
(3, 2, 'Transacción exitosa', 'TRX123458', NULL),  -- Transacción 3: Completado
(5, 2, 'Transacción exitosa', 'TRX123460', NULL),  -- Transacción 5: Completado
(6, 2, 'Transacción exitosa', 'TRX123461', NULL),  -- Transacción 6: Completado
(7, 1, 'Esperando confirmación', 'TRX123462', NULL), -- Transacción 7: Pendiente
(8, 2, 'Transacción exitosa', 'TRX123463', NULL),  -- Transacción 8: Completado
(9, 2, 'Transacción exitosa', 'TRX123464', NULL); -- Transacción 9: Completado


-- Inserción en payment
INSERT INTO payment (idTransaction, totalPay, idDiscount) VALUES
(1, 50.00, NULL),  -- Transacción 1, total $50.00, sin descuento
(2, 30.00, NULL),  -- Transacción 2, total $30.00, sin descuento
(3, 70.00, 1),     -- Transacción 3, total $70.00, descuento de $10
(4, 100.00, NULL), -- Transacción 4, total $100.00, sin descuento
(5, 60.00, 2),     -- Transacción 5, total $60.00, descuento de $20
(6, 90.00, NULL),  -- Transacción 6, total $90.00, sin descuento
(7, 45.00, NULL),  -- Transacción 7, total $45.00, sin descuento
(8, 25.00, NULL),  -- Transacción 8, total $25.00, sin descuento
(9, 55.00, NULL),  -- Transacción 9, total $55.00, sin descuento
(10, 80.00, 3);    -- Transacción 10, total $80.00, descuento de $30
