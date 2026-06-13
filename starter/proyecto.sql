-- ============================================
-- PROYECTO SEMANAL: NULL y Constraints
-- Semana 07 — NOT NULL, UNIQUE, CHECK, FK
-- Academia de Artes Marciales
-- ============================================

PRAGMA foreign_keys = ON;

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS instructors;

-- ============================================
-- PARTE 1: ESQUEMA CON CONSTRAINTS
-- ============================================

CREATE TABLE instructors (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    email TEXT NOT NULL UNIQUE,

    experience_years INTEGER NOT NULL
        CHECK(experience_years >= 0),

    phone TEXT,

    is_active INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE students (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    email TEXT NOT NULL UNIQUE,

    age INTEGER NOT NULL
        CHECK(age >= 5 AND age <= 60),

    phone TEXT,

    belt TEXT NOT NULL DEFAULT 'Blanco',

    is_active INTEGER NOT NULL DEFAULT 1
);

CREATE TABLE classes (
    id INTEGER PRIMARY KEY,

    class_name TEXT NOT NULL UNIQUE,

    schedule TEXT NOT NULL,

    capacity INTEGER NOT NULL
        CHECK(capacity > 0),

    description TEXT,

    instructor_id INTEGER NOT NULL,

    FOREIGN KEY (instructor_id)
        REFERENCES instructors(id)
        ON DELETE RESTRICT
);

-- ============================================
-- PARTE 2: DATOS DE PRUEBA
-- ============================================

INSERT INTO instructors
(id, name, email, experience_years, phone, is_active)
VALUES
(1, 'Carlos Perez', 'carlos@gmail.com', 10, '3001111111', 1),
(2, 'Ana Gomez', 'ana@gmail.com', 8, NULL, 1),
(3, 'Luis Martinez', 'luis@gmail.com', 12, '3003333333', 1);

INSERT INTO students
(id, name, email, age, phone, belt, is_active)
VALUES
(1, 'Juan Lopez', 'juan@gmail.com', 15, '3011111111', 'Blanco', 1),
(2, 'Maria Diaz', 'maria@gmail.com', 16, NULL, 'Amarillo', 1),
(3, 'Pedro Sanchez', 'pedro@gmail.com', 14, NULL, 'Blanco', 1),
(4, 'Laura Castro', 'laura@gmail.com', 17, '3014444444', 'Verde', 1),
(5, 'Andres Ruiz', 'andres@gmail.com', 18, NULL, 'Azul', 1),
(6, 'Camila Vega', 'camila@gmail.com', 15, '3016666666', 'Verde', 1),
(7, 'David Moreno', 'david@gmail.com', 16, '3017777777', 'Naranja', 1),
(8, 'Paula Herrera', 'paula@gmail.com', 17, NULL, 'Verde', 1),
(9, 'Jorge Ramirez', 'jorge@gmail.com', 19, '3019999999', 'Azul', 1),
(10, 'Valentina Cruz', 'valentina@gmail.com', 14, '3021111111', 'Blanco', 1),
(11, 'Sebastian Torres', 'sebastian@gmail.com', 18, NULL, 'Amarillo', 1),
(12, 'Daniela Ortiz', 'daniela@gmail.com', 16, '3023333333', 'Naranja', 1),
(13, 'Mateo Silva', 'mateo@gmail.com', 17, '3024444444', 'Verde', 1),
(14, 'Lucia Mendoza', 'lucia@gmail.com', 15, NULL, 'Amarillo', 1),
(15, 'Felipe Navarro', 'felipe@gmail.com', 18, '3026666666', 'Azul', 1),
(16, 'Sara Rojas', 'sara@gmail.com', 15, '3027777777', 'Blanco', 1),
(17, 'Miguel Leon', 'miguel@gmail.com', 16, NULL, 'Amarillo', 1),
(18, 'Karen Gil', 'karen@gmail.com', 17, '3029999999', 'Verde', 1),
(19, 'Julian Perez', 'julian@gmail.com', 18, '3031111111', 'Azul', 1),
(20, 'Natalia Mora', 'natalia@gmail.com', 15, NULL, 'Naranja', 1),
(21, 'Kevin Suarez', 'kevin@gmail.com', 16, '3033333333', 'Verde', 1),
(22, 'Tatiana Ruiz', 'tatiana@gmail.com', 17, '3034444444', 'Amarillo', 1),
(23, 'Oscar Medina', 'oscar@gmail.com', 18, NULL, 'Azul', 1),
(24, 'Andrea Lopez', 'andrea@gmail.com', 15, '3036666666', 'Blanco', 1),
(25, 'Ricardo Vargas', 'ricardo@gmail.com', 16, '3037777777', 'Naranja', 1),
(26, 'Paola Diaz', 'paola@gmail.com', 17, NULL, 'Verde', 1),
(27, 'Esteban Torres', 'esteban@gmail.com', 18, '3039999999', 'Azul', 1),
(28, 'Melissa Gomez', 'melissa@gmail.com', 15, '3041111111', 'Amarillo', 1),
(29, 'Santiago Castro', 'santiago@gmail.com', 16, NULL, 'Verde', 1),
(30, 'Valeria Herrera', 'valeria@gmail.com', 17, '3043333333', 'Azul', 1);
INSERT INTO classes
(id, class_name, schedule, capacity, description, instructor_id)
VALUES
(1, 'Karate Basico', 'Lunes 4PM', 20, NULL, 1),

(2, 'Taekwondo Intermedio', 'Martes 5PM', 15,
'Preparacion para competencias', 2),

(3, 'Judo Avanzado', 'Miercoles 6PM', 10,
NULL, 3);

-- ============================================
-- PARTE 3: CONSULTAS CON NULL
-- ============================================

-- Estudiantes sin telefono

SELECT
    id,
    name,
    phone
FROM students
WHERE phone IS NULL;

-- Instructores sin telefono

SELECT
    id,
    name,
    phone
FROM instructors
WHERE phone IS NULL;

-- Clases sin descripcion

SELECT
    id,
    class_name
FROM classes
WHERE description IS NULL;

-- ============================================
-- CONSULTAS CON COALESCE
-- ============================================

-- Mostrar telefono de estudiantes

SELECT
    name,
    COALESCE(phone, 'Sin telefono registrado') AS telefono
FROM students;

-- Mostrar telefono de instructores

SELECT
    name,
    COALESCE(phone, 'Sin telefono registrado') AS telefono
FROM instructors;

-- Mostrar descripcion de clases

SELECT
    class_name,
    COALESCE(description, 'Sin descripcion')
        AS descripcion
FROM classes;