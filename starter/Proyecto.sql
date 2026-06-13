-- ============================================
-- PROYECTO INTEGRADOR: Etapa 0 — Capstone
-- Semana 08 — DDL + DML + SELECT completo
-- Academia de Artes Marciales
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;

-- ============================================
-- PARTE 1: ESQUEMA (DDL)
-- ============================================

CREATE TABLE instructors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE classes (
    id INTEGER PRIMARY KEY,
    class_name TEXT NOT NULL,
    capacity INTEGER NOT NULL
        CHECK(capacity > 0),
    schedule TEXT NOT NULL DEFAULT 'Por definir',

    instructor_id INTEGER NOT NULL
        REFERENCES instructors(id)
        ON DELETE RESTRICT
);

CREATE TABLE students (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    student_code TEXT NOT NULL UNIQUE,

    phone TEXT,

    age INTEGER NOT NULL
        CHECK(age >= 5 AND age <= 60),

    is_active INTEGER NOT NULL DEFAULT 1,

    class_id INTEGER NOT NULL
        REFERENCES classes(id)
        ON DELETE RESTRICT
);

-- ============================================
-- PARTE 2: DATOS (DML)
-- ============================================

INSERT INTO instructors VALUES
(1,'Carlos Perez','carlos@gmail.com'),
(2,'Ana Gomez','ana@gmail.com'),
(3,'Luis Martinez','luis@gmail.com');

INSERT INTO classes VALUES
(1,'Karate Basico',20,'Lunes 4PM',1),
(2,'Taekwondo Intermedio',15,'Martes 5PM',2),
(3,'Judo Avanzado',10,'Miercoles 6PM',3);

INSERT INTO students VALUES
(1,'Juan Lopez','EST001','3011111111',15,1,1),
(2,'Maria Diaz','EST002',NULL,16,1,1),
(3,'Pedro Sanchez','EST003',NULL,14,1,1),
(4,'Laura Castro','EST004','3014444444',17,1,2),
(5,'Andres Ruiz','EST005',NULL,18,1,2),
(6,'Camila Vega','EST006','3016666666',15,1,2),
(7,'David Moreno','EST007','3017777777',16,1,2),
(8,'Paula Herrera','EST008',NULL,17,1,3),
(9,'Jorge Ramirez','EST009','3019999999',19,1,3),
(10,'Valentina Cruz','EST010','3021111111',14,1,3),
(11,'Sebastian Torres','EST011',NULL,18,1,1),
(12,'Daniela Ortiz','EST012','3023333333',16,1,1),
(13,'Mateo Silva','EST013','3024444444',17,1,1),
(14,'Lucia Mendoza','EST014',NULL,15,1,2),
(15,'Felipe Navarro','EST015','3026666666',18,1,2),
(16,'Sara Rojas','EST016','3027777777',15,1,2),
(17,'Miguel Leon','EST017',NULL,16,1,2),
(18,'Karen Gil','EST018','3029999999',17,1,3),
(19,'Julian Perez','EST019','3031111111',18,1,3),
(20,'Natalia Mora','EST020',NULL,15,1,3),
(21,'Kevin Suarez','EST021','3033333333',16,1,1),
(22,'Tatiana Ruiz','EST022','3034444444',17,1,1),
(23,'Oscar Medina','EST023',NULL,18,1,1),
(24,'Andrea Lopez','EST024','3036666666',15,1,2),
(25,'Ricardo Vargas','EST025','3037777777',16,1,2),
(26,'Paola Diaz','EST026',NULL,17,1,2),
(27,'Esteban Torres','EST027','3039999999',18,1,3),
(28,'Melissa Gomez','EST028','3041111111',15,1,3),
(29,'Santiago Castro','EST029',NULL,16,1,3),
(30,'Valeria Herrera','EST030','3043333333',17,1,3);

-- ============================================
-- PARTE 3: REPORTES (SELECT)
-- ============================================

-- REPORTE 1: Totales globales

SELECT
    COUNT(*) AS total_estudiantes,
    AVG(age) AS promedio_edad
FROM students;

-- REPORTE 2: Totales por clase

SELECT
    class_id,
    COUNT(*) AS total_estudiantes,
    AVG(age) AS promedio_edad
FROM students
WHERE is_active = 1
GROUP BY class_id
ORDER BY total_estudiantes DESC;

-- REPORTE 3: Clases con más de 8 estudiantes

SELECT
    class_id,
    COUNT(*) AS total_estudiantes
FROM students
GROUP BY class_id
HAVING COUNT(*) > 8;

-- REPORTE 4: Manejo de NULL

SELECT
    name,
    COALESCE(phone,'Sin telefono registrado') AS telefono
FROM students
WHERE phone IS NULL;

-- REPORTE 5: Búsqueda combinada

SELECT
    name,
    age
FROM students
WHERE age BETWEEN 15 AND 18
    AND name LIKE '%a%'
    AND is_active = 1
ORDER BY age DESC
LIMIT 5;