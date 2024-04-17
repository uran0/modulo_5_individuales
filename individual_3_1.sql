CREATE TABLE profesores (
id int primary key auto_increment,
nombre varchar (25),
apellido varchar (50),
escuela varchar (50),
fecha_de_contratacion date,
sueldo int
);

INSERT INTO profesores (
nombre, apellido, escuela, fecha_de_contratacion, sueldo)
VALUES
('Juanita', 'Perez', 'Gabriela Mistral', '2011-10-30', 234000), 
('Bruce', 'Lee', 'Republica Popular China', '1993-05-22', 780945), 
('Juan Alberto', 'Valdivieso', 'Sagrada Concepcion', '2005-08-001', 3400000), 
('Pablo', 'Rojas', 'E-34', '2011-10-30', 300000),
('Nicolas', 'Echeñique', 'Bendito Corazon de Maria', '2005-08-30', 8900000),
('Jericho', 'Jorquera', 'A-18 Abrazo de Maipu', '2010-10-22', 67500);

INSERT INTO profesores (
nombre, apellido, escuela, fecha_de_contratacion, sueldo)
VALUES
('Caupolican', 'Catrileo', 'Santiago de la extremadura', '2000-10-26', 780000);

SELECT * FROM profesores;
SELECT nombre, apellido FROM profesores;
alter table profesores add primary key (nombre);

-- agregar 3 profesores nuevos
INSERT INTO	profesores (nombre, apellido, escuela, fecha_de_contratacion, sueldo)
VALUES
('Felicia', 'Blanco', 'El Vergel', '2024-03-02', 216000),
('Segundo', 'Ortega', 'Villa Lourdes', '2007-07-01', 618000),
('Angélica', 'Goyenechea', 'Liceo A-77', '2009-02-27', 803000); 

-- agregar 3 cursos nuevos
CREATE TABLE cursos (
id int primary key auto_increment,
nombre VARCHAR(30), 
duracion VARCHAR(30), 
valor INT
);

-- seleccionar el curso mas costoso
SELECT * FROM cursos WHERE valor = (SELECT MAX(valor) FROM cursos) LIMIT 1;

-- seleccionar el profesor con menor salario
SELECT * FROM profesores WHERE sueldo = (SELECT MIN(sueldo) FROM profesores) LIMIT 1;

-- seleccionar cursos mas costosos que el promedio
SELECT * FROM cursos WHERE valor > (SELECT AVG(valor) FROM cursos);

-- crear nueva tabla con los cursos cuyo valor es inferior al promedio
CREATE TABLE cursos_economicos AS SELECT * FROM cursos WHERE valor < (SELECT AVG(valor) FROM cursos);

-- agregar dos columnas a la nueva tabla de cursos economicos
ALTER TABLE cursos_economicos ADD COLUMN cantidad_minima_estudiantes INT, ADD COLUMN aportes_publicos INT;

-- agregar columna costo efectivo
ALTER TABLE cursos_economicos ADD COLUMN costo_efectivo INT;

-- actualizar columna costo efectivo para que realice operacion resta
UPDATE cursos_economicos SET costo_efectivo = valor - aportes_publicos;

-- "actualizar" agregando 5 cursos (no pedían inscribir ninguno previamente)
INSERT INTO cursos (nombre, duracion, valor)
VALUES
('Programación en Python', '3 meses', 150000),
('Diseño gráfico', '6 meses', 200000),
('Gestión de proyectos', '4 meses', 180000),
('Marketing digital', '2 meses', 120000),
('Desarrollo web', '5 meses', 170000);

-- 5 actualizaciones en tabla profesores
UPDATE profesores SET sueldo = 84000 WHERE id = 5;
UPDATE profesores SET escuela = 'Carolina Llona' WHERE id = 3;
UPDATE profesores SET sueldo = 120000 WHERE id IN (2, 6);
UPDATE profesores SET escuela = 'Escuela básica El Vergel' WHERE id = 8;
UPDATE profesores SET nombre = 'María Angélica' WHERE id = 10;