-- ============================================
-- PROYECTO SEMANAL: FUNCIONES DE AGREGACIÓN
-- Semana 06 — Academia de Artes Marciales
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

-- ============================================
-- TABLA STUDENTS
-- ============================================

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    belt TEXT NOT NULL,
    hours_trained INTEGER NOT NULL
);

-- ============================================
-- TABLA INSTRUCTORS
-- ============================================

CREATE TABLE instructors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    experience_years INTEGER NOT NULL,
    salary INTEGER NOT NULL
);

-- ============================================
-- TABLA CLASSES
-- ============================================

CREATE TABLE classes (
    id INTEGER PRIMARY KEY,
    class_name TEXT NOT NULL,
    level TEXT NOT NULL,
    instructor_id INTEGER,
    FOREIGN KEY (instructor_id) REFERENCES instructors(id)
);

-- ============================================
-- INSERT 30 STUDENTS
-- ============================================

INSERT INTO students VALUES
(1,'Juan López',15,'Blanco',10),
(2,'María Díaz',16,'Amarillo',20),
(3,'Pedro Sánchez',14,'Blanco',5),
(4,'Laura Castro',17,'Naranja',30),
(5,'Andrés Ruiz',18,'Verde',40),
(6,'Camila Vega',15,'Amarillo',12),
(7,'David Moreno',16,'Naranja',25),
(8,'Paula Herrera',17,'Verde',50),
(9,'Jorge Ramírez',19,'Azul',60),
(10,'Valentina Cruz',14,'Blanco',8),
(11,'Sebastián Torres',18,'Amarillo',35),
(12,'Daniela Ortiz',16,'Naranja',28),
(13,'Mateo Silva',17,'Verde',45),
(14,'Lucía Mendoza',15,'Amarillo',18),
(15,'Felipe Navarro',18,'Azul',55),
(16,'Santiago Mora',16,'Blanco',22),
(17,'Natalia Ríos',17,'Verde',33),
(18,'Kevin Gómez',15,'Amarillo',14),
(19,'Sofía León',16,'Naranja',27),
(20,'Oscar Medina',18,'Azul',65),
(21,'Andrea Ruiz',14,'Blanco',9),
(22,'Carlos Pérez',17,'Verde',41),
(23,'Daniel Rojas',16,'Amarillo',21),
(24,'Luis Martínez',15,'Naranja',19),
(25,'Miguel Torres',18,'Azul',70),
(26,'Sara Gómez',17,'Verde',38),
(27,'Diego Vargas',16,'Amarillo',23),
(28,'Elena Castro',15,'Blanco',11),
(29,'Ricardo León',18,'Azul',58),
(30,'Tatiana Cruz',17,'Verde',47);

-- ============================================
-- INSERT 30 INSTRUCTORS
-- ============================================

INSERT INTO instructors VALUES
(1,'Carlos Pérez',10,3000),
(2,'Ana Gómez',8,2800),
(3,'Luis Martínez',12,3200),
(4,'Sofía Torres',6,2600),
(5,'Miguel Rojas',15,4000),
(6,'Javier Peña',7,2700),
(7,'Natalia Mora',9,2900),
(8,'Ricardo León',11,3100),
(9,'Sandra Gil',5,2400),
(10,'Mauricio Vega',14,3800),
(11,'Andrea Ruiz',8,3000),
(12,'Felipe Soto',13,3500),
(13,'Kevin Rojas',4,2200),
(14,'Tatiana Cruz',10,3300),
(15,'Oscar Medina',16,4200),
(16,'Laura Díaz',7,2750),
(17,'Pedro López',9,2950),
(18,'Camilo Reyes',12,3400),
(19,'Valeria Soto',6,2500),
(20,'Andrés Pérez',15,4100),
(21,'Camila Ríos',8,3050),
(22,'Jorge Herrera',11,3150),
(23,'Daniel Ortiz',10,3200),
(24,'Paula Ramírez',7,2850),
(25,'Santiago Vega',14,3900),
(26,'Luisa Gómez',9,2950),
(27,'Felipe Mora',12,3450),
(28,'Sara Pérez',6,2600),
(29,'Diego Castro',15,4300),
(30,'Elena Vargas',8,3000);

-- ============================================
-- INSERT CLASSES
-- ============================================

INSERT INTO classes VALUES
(1,'Karate','Básico',1),
(2,'Taekwondo','Intermedio',2),
(3,'Judo','Avanzado',3),
(4,'Kung Fu','Básico',4),
(5,'Defensa Personal','Avanzado',5);

-- ============================================
-- REPORTE 1: COUNT + SUM + AVG
-- ============================================

SELECT
    COUNT(*) AS total_estudiantes,
    SUM(hours_trained) AS horas_totales,
    AVG(hours_trained) AS promedio_horas
FROM students;

-- ============================================
-- REPORTE 2: MIN Y MAX
-- ============================================

SELECT
    MIN(hours_trained) AS minimo_horas,
    MAX(hours_trained) AS maximo_horas
FROM students;

-- ============================================
-- REPORTE 3: GROUP BY
-- ============================================

SELECT
    belt,
    COUNT(*) AS total,
    AVG(hours_trained) AS promedio
FROM students
GROUP BY belt
ORDER BY total DESC;

-- ============================================
-- REPORTE 4: HAVING
-- ============================================

SELECT
    belt,
    COUNT(*) AS total
FROM students
GROUP BY belt
HAVING COUNT(*) >= 5;