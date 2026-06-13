-- ============================================
-- PROYECTO SEMANA 09
-- JOINs aplicados a tu dominio
-- Academia de Artes Marciales
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- ELIMINAR TABLAS SI EXISTEN
-- ============================================

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;

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
-- TABLA STUDENTS
-- ============================================

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    belt TEXT NOT NULL,
    hours_trained INTEGER NOT NULL,
    class_id INTEGER,
    FOREIGN KEY (class_id) REFERENCES classes(id)
);

-- ============================================
-- INSERTAR INSTRUCTORES
-- ============================================

INSERT INTO instructors VALUES
(1,'Carlos Perez',10,2500000),
(2,'Ana Gomez',8,2200000),
(3,'Luis Martinez',12,3000000),
(4,'Jorge Ruiz',6,2100000),
(5,'Camila Torres',9,2400000),
(6,'David Moreno',7,2300000),
(7,'Paula Herrera',11,2800000),
(8,'Ricardo Castro',5,2000000),
(9,'Tatiana Diaz',13,3200000),
(10,'Andres Silva',8,2250000),
(11,'Natalia Rojas',10,2600000),
(12,'Sebastian Leon',15,3500000),
(13,'Karen Vargas',6,2100000),
(14,'Julian Medina',9,2450000),
(15,'Oscar Sanchez',14,3300000),
(16,'Valentina Cruz',7,2200000),
(17,'Miguel Gomez',12,2950000),
(18,'Daniela Ortiz',8,2350000),
(19,'Felipe Navarro',11,2750000),
(20,'Lucia Mendoza',5,2000000);

-- ============================================
-- INSERTAR CLASES
-- ============================================

INSERT INTO classes VALUES
(1,'Karate Basico','Principiante',1),
(2,'Karate Intermedio','Intermedio',2),
(3,'Karate Avanzado','Avanzado',3),
(4,'Taekwondo Basico','Principiante',4),
(5,'Taekwondo Intermedio','Intermedio',5),
(6,'Taekwondo Avanzado','Avanzado',6),
(7,'Judo Basico','Principiante',7),
(8,'Judo Intermedio','Intermedio',8),
(9,'Judo Avanzado','Avanzado',9),
(10,'Kickboxing Basico','Principiante',10),
(11,'Kickboxing Intermedio','Intermedio',11),
(12,'Kickboxing Avanzado','Avanzado',12),
(13,'Muay Thai Basico','Principiante',13),
(14,'Muay Thai Intermedio','Intermedio',14),
(15,'Muay Thai Avanzado','Avanzado',15),
(16,'Defensa Personal I','Principiante',16),
(17,'Defensa Personal II','Intermedio',17),
(18,'Defensa Personal III','Avanzado',18),
(19,'Combate Deportivo','Avanzado',19),
(20,'Elite Marcial','Experto',20);

-- ============================================
-- INSERTAR ESTUDIANTES
-- ============================================

INSERT INTO students VALUES
(1,'Juan Lopez',15,'Blanco',120,1),
(2,'Maria Diaz',16,'Amarillo',150,1),
(3,'Pedro Sanchez',14,'Blanco',100,1),
(4,'Laura Castro',17,'Verde',220,1),
(5,'Andres Ruiz',18,'Azul',300,2),
(6,'Camila Vega',15,'Amarillo',180,2),
(7,'David Ramirez',16,'Verde',210,2),
(8,'Paula Herrera',17,'Azul',290,2),
(9,'Jorge Ramirez',18,'Marron',450,3),
(10,'Valentina Cruz',14,'Blanco',130,3),
(11,'Sebastian Torres',18,'Azul',310,3),
(12,'Daniela Ortiz',16,'Verde',240,3),
(13,'Mateo Silva',17,'Amarillo',200,4),
(14,'Lucia Mendoza',15,'Blanco',120,4),
(15,'Felipe Navarro',18,'Azul',340,4),
(16,'Sara Rojas',15,'Verde',230,4),
(17,'Miguel Leon',16,'Amarillo',190,5),
(18,'Karen Gil',17,'Verde',250,5),
(19,'Julian Perez',18,'Azul',330,5),
(20,'Natalia Mora',15,'Blanco',110,5),
(21,'Kevin Suarez',16,'Amarillo',170,6),
(22,'Tatiana Ruiz',17,'Verde',260,6),
(23,'Oscar Medina',18,'Azul',320,6),
(24,'Andrea Lopez',15,'Blanco',140,6),
(25,'Ricardo Vargas',16,'Amarillo',180,7),
(26,'Paola Diaz',17,'Verde',240,7),
(27,'Esteban Torres',18,'Azul',350,7),
(28,'Melissa Gomez',15,'Blanco',130,7),
(29,'Santiago Castro',16,'Amarillo',200,8),
(30,'Valeria Herrera',17,'Verde',270,8),
(31,'Juan Garcia',15,'Blanco',150,8),
(32,'Maria Torres',16,'Amarillo',190,8),
(33,'Pedro Rojas',17,'Verde',260,9),
(34,'Ana Martinez',18,'Azul',340,9),
(35,'Luis Gomez',15,'Blanco',120,9),
(36,'Carlos Silva',16,'Amarillo',180,9),
(37,'Juliana Ruiz',17,'Verde',250,10),
(38,'Felipe Diaz',18,'Azul',360,10),
(39,'Paula Castro',15,'Blanco',110,10),
(40,'Daniel Leon',16,'Amarillo',190,10),
(41,'Sandra Mora',17,'Verde',240,11),
(42,'Diego Torres',18,'Azul',330,11),
(43,'Nicolas Perez',15,'Blanco',140,11),
(44,'Carolina Gil',16,'Amarillo',200,11),
(45,'Mateo Rojas',17,'Verde',260,12),
(46,'Laura Diaz',18,'Azul',350,12),
(47,'Samuel Ruiz',15,'Blanco',120,12),
(48,'Karen Castro',16,'Amarillo',180,12),
(49,'Jhon Lopez',17,'Verde',270,13),
(50,'Sofia Medina',18,'Azul',340,13),
(51,'Cristian Torres',15,'Blanco',130,13),
(52,'Valentina Ruiz',16,'Amarillo',210,13),
(53,'Miguel Castro',17,'Verde',250,14),
(54,'Paola Herrera',18,'Azul',360,14),
(55,'Andres Leon',15,'Blanco',150,14),
(56,'Natalia Diaz',16,'Amarillo',200,14),
(57,'Daniel Silva',17,'Verde',280,15),
(58,'Luciana Torres',18,'Azul',370,15),
(59,'Kevin Medina',15,'Blanco',120,15),
(60,'Melissa Ruiz',16,'Amarillo',190,15),
(61,'Jorge Diaz',17,'Verde',260,16),
(62,'Camilo Perez',18,'Azul',350,16),
(63,'Andrea Silva',15,'Blanco',140,16),
(64,'Tatiana Gomez',16,'Amarillo',210,16),
(65,'Felipe Rojas',17,'Verde',270,17),
(66,'Laura Medina',18,'Azul',330,17),
(67,'Oscar Torres',15,'Blanco',130,17),
(68,'Sara Diaz',16,'Amarillo',200,17),
(69,'Juan Esteban',17,'Verde',250,18),
(70,'Valeria Castro',18,'Azul',360,18),
(71,'Miguel Angel',15,'Blanco',150,18),
(72,'Paula Moreno',16,'Amarillo',220,18),
(73,'Cristian Herrera',17,'Verde',280,19),
(74,'Natalia Torres',18,'Azul',370,19),
(75,'Sebastian Diaz',15,'Blanco',120,19),
(76,'Daniela Rojas',16,'Amarillo',190,19),
(77,'Mateo Vargas',17,'Verde',260,19),
(78,'Laura Silva',18,'Azul',340,19),
(79,'Andres Medina',15,'Blanco',140,19),
(80,'Camila Perez',16,'Amarillo',210,19);

-- ============================================
-- CONSULTA 1: INNER JOIN
-- ============================================

SELECT
    s.name AS estudiante,
    c.class_name AS clase,
    c.level AS nivel
FROM students s
INNER JOIN classes c
ON s.class_id = c.id;

-- ============================================
-- CONSULTA 2: JOIN CON 3 TABLAS
-- ============================================

SELECT
    s.name AS estudiante,
    c.class_name AS clase,
    i.name AS instructor,
    i.experience_years AS experiencia
FROM students s
INNER JOIN classes c
    ON s.class_id = c.id
INNER JOIN instructors i
    ON c.instructor_id = i.id;

-- ============================================
-- CONSULTA 3: LEFT JOIN
-- ============================================

SELECT
    c.class_name AS clase,
    s.name AS estudiante
FROM classes c
LEFT JOIN students s
    ON s.class_id = c.id;

-- ============================================
-- CONSULTA 4: DETECTAR HUÉRFANOS
-- ============================================

SELECT
    c.class_name AS clase_sin_estudiantes
FROM classes c
LEFT JOIN students s
    ON s.class_id = c.id
WHERE s.id IS NULL;

-- ============================================
-- CONSULTA 5: REPORTE AGREGADO
-- ============================================

SELECT
    c.class_name AS clase,
    COUNT(s.id) AS total_estudiantes
FROM classes c
LEFT JOIN students s
    ON s.class_id = c.id
GROUP BY c.class_name
ORDER BY total_estudiantes DESC;