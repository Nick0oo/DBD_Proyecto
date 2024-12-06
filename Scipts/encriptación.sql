USE proyecto;
-- Encriptar la contraseña del usuario
ALTER TABLE users MODIFY COLUMN `password` VARBINARY(255);
UPDATE users
SET `password` = AES_ENCRYPT(`password`, 'password_client')
where users.id > 0;
SELECT HEX(`password`) FROM users;
--   Desencriptar la contraseña del usuario
SELECT users.id, CAST(AES_DECRYPT(`password`, 'password_client') AS CHAR) AS `password`
FROM users;

-- Encriptar el documento del usuario
ALTER TABLE people MODIFY COLUMN document VARBINARY(255);
UPDATE people
SET document = AES_ENCRYPT(document, 'document_client')
where people.id > 0;
SELECT HEX(document) FROM people;
--   Desencriptar la contraseña del usuario
SELECT people.id, CAST(AES_DECRYPT(document, 'document_client') AS CHAR) AS document
FROM people;

-- Encriptar el numero de tarjeta del usuario
ALTER TABLE paymentTransactionInformation MODIFY COLUMN numberTarjet VARBINARY(255);
UPDATE paymentTransactionInformation
SET numberTarjet = AES_ENCRYPT(numberTarjet, 'numberTarjet_client')
where paymentTransactionInformation.id > 0;
SELECT HEX(numberTarjet) FROM paymentTransactionInformation;
--   Desencriptar la contraseña del usuario
SELECT paymentTransactionInformation.id,
 CAST(AES_DECRYPT(numberTarjet, 'numberTarjet_client') AS CHAR) AS numberTarjet
FROM paymentTransactionInformation;
