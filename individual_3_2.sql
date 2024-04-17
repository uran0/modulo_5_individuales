CREATE DATABASE usuarios;
USE usuarios;
CREATE TABLE usuarios_inactivos
(run VARCHAR(11) PRIMARY KEY,
nombres VARCHAR(30),
apellidos VARCHAR (30),
correo_electronico VARCHAR (50),
telefono VARCHAR(20),
genero VARCHAR(1)
);
INSERT INTO usuarios_inactivos
VALUES
('15987635-2', 'María Eugenia', 'Gómez Salgado', 'kena.salgado@hotmail.es', '945678256', 'F'),
('20654785-8', 'Nicolás', 'Rebolledo Miranda', 'nicolas.miranda@gmail.com', '842567145', 'M'),
('17685002-7', 'Rubén', 'Cid Cabezas', 'cidcabezas@hotmail.com','878546521', 'M'),
('18663543-3', 'Fernanda Camila', 'Torres Torres', 'fernycami@gmail.com', '962654526', 'F'),
('21339695-1', 'Kevin', 'Smith Soto', 'kevinsmith@yahoo.es', '999654334', 'M');
CREATE TABLE usuarios_activos
(run VARCHAR(11) PRIMARY KEY,
nombres VARCHAR(30),
apellidos VARCHAR(30),
correo_electronico VARCHAR(50),
telefono VARCHAR(20),
genero VARCHAR(1)
);
-- mover 3 usuarios (desde usuarios_inactivos a usuarios_activos y anular el tercer cambio, es decir, hacer rollback en lugar de commit)
START TRANSACTION;
INSERT INTO usuarios_activos (run, nombres, apellidos, correo_electronico, telefono, genero)
SELECT run, nombres, apellidos, correo_electronico, telefono, genero
FROM usuarios_inactivos
WHERE run = '15987635-2';
DELETE FROM usuarios_inactivos WHERE run = '15987635-2';
COMMIT;
START TRANSACTION;
INSERT INTO usuarios_activos (run, nombres, apellidos, correo_electronico, telefono, genero)
SELECT run, nombres, apellidos, correo_electronico, telefono, genero
FROM usuarios_inactivos
WHERE run = '18663543-3';
DELETE FROM usuarios_inactivos WHERE run = '18663543-3';
COMMIT;
START TRANSACTION;
INSERT INTO usuarios_activos (run, nombres, apellidos, correo_electronico, telefono, genero)
SELECT run, nombres, apellidos, correo_electronico, telefono, genero
FROM usuarios_inactivos
WHERE run = '21339695-1';
DELETE FROM usuarios_inactivos WHERE run= '21339695-1';
ROLLBACK;
-- mostrar que efectivamente solo se hicieron 2 transacciones
SELECT * FROM usuarios_activos;
SELECT * FROM usuarios_inactivos;
