CREATE DATABASE UranoUnido;
USE UranoUnido;
CREATE TABLE OPERADORES (
RUN varchar(10) primary key,
nombre varchar(20),
apellido varchar (20), 
direccion varchar (100),
correo_electronico varchar (100)
);
CREATE TABLE USUARIOS (
id_coder int primary key auto_increment,
nombre varchar (20),
apellido varchar (20),
correo_electronico varchar (100),
telefono varchar (30)
);
CREATE TABLE CAPACITACION (
codigo_curso int primary key,
nombre varchar (20),
horario varchar (100)
);
INSERT INTO OPERADORES (RUN, nombre, apellido, direccion, correo_electronico) VALUES
('12345678-9', 'Juan', 'Perez', 'Calle 123', 'juan@example.com'),
('98765432-1', 'María', 'González', 'Avenida 456', 'maria@example.com'),
('45678912-3', 'Pedro', 'Martínez', 'Calle 789', 'pedro@example.com'),
('78912345-6', 'Ana', 'López', 'Avenida 012', 'ana@example.com'),
('23456789-0', 'Carlos', 'Rodríguez', 'Calle 345', 'carlos@example.com'),
('56789012-3', 'Laura', 'Sánchez', 'Avenida 678', 'laura@example.com'),
('89012345-6', 'Diego', 'Fernández', 'Calle 901', 'diego@example.com'),
('34567890-1', 'Marta', 'Díaz', 'Avenida 234', 'marta@example.com'),
('67890123-4', 'José', 'López', 'Calle 567', 'jose@example.com'),
('01234567-8', 'Sofía', 'Martínez', 'Avenida 890', 'sofia@example.com');
INSERT INTO USUARIOS (nombre, apellido, correo_electronico, telefono) VALUES
('Juan', 'Perez', 'juan@example.com', '1234567890'),
('María', 'González', 'maria@example.com', '0987654321'),
('Pedro', 'Martínez', 'pedro@example.com', '4567891230'),
('Ana', 'López', 'ana@example.com', '7891234560'),
('Carlos', 'Rodríguez', 'carlos@example.com', '2345678900'),
('Laura', 'Sánchez', 'laura@example.com', '5678901230'),
('Diego', 'Fernández', 'diego@example.com', '8901234560'),
('Marta', 'Díaz', 'marta@example.com', '3456789010'),
('José', 'López', 'jose@example.com', '6789012340'),
('Sofía', 'Martínez', 'sofia@example.com', '0123456780');

ALTER TABLE CAPACITACION MODIFY codigo_curso INT AUTO_INCREMENT;

INSERT INTO CAPACITACION (nombre, horario) VALUES
('Curso 1', '2024-04-06 09:00:00'),
('Curso 2', '2024-04-07 14:00:00'),
('Curso 3', '2024-04-08 10:30:00'),
('Curso 4', '2024-04-09 11:00:00'),
('Curso 5', '2024-04-10 15:30:00'),
('Curso 6', '2024-04-11 08:45:00'),
('Curso 7', '2024-04-12 13:20:00'),
('Curso 8', '2024-04-13 09:45:00'),
('Curso 9', '2024-04-14 12:00:00'),
('Curso 10', '2024-04-15 16:00:00');

SELECT * FROM CAPACITACION;


