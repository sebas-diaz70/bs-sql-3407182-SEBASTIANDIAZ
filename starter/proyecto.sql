-- ============================================
-- PROYECTO SEMANAL: DDL de tu Dominio
-- Semana 02 — DDL: Diseño de Esquemas
-- Academia de Artes Marciales
-- ============================================

-- ============================================
-- LIMPIEZA: eliminar tablas si existen
-- ============================================

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

-- ============================================
-- TABLA 1: students
-- ============================================

CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    age INTEGER NOT NULL
        CHECK(age >= 5 AND age <= 60),

    belt TEXT NOT NULL
        DEFAULT 'Blanco',

    email TEXT UNIQUE,

    is_active INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 2: instructors
-- ============================================

CREATE TABLE IF NOT EXISTS instructors (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    experience_years INTEGER NOT NULL
        CHECK(experience_years >= 0),

    phone TEXT UNIQUE,

    is_active INTEGER NOT NULL DEFAULT 1
);

-- ============================================
-- TABLA 3: classes
-- ============================================

CREATE TABLE IF NOT EXISTS classes (
    id INTEGER PRIMARY KEY,

    class_name TEXT NOT NULL,

    schedule TEXT NOT NULL,

    capacity INTEGER DEFAULT 20
        CHECK(capacity > 0),

    instructor_id INTEGER NOT NULL,

    FOREIGN KEY (instructor_id)
        REFERENCES instructors(id)
);

-- ============================================
-- INSERTAR DATOS STUDENTS
-- ============================================

INSERT INTO students VALUES
(1, 'Juan López', 15, 'Blanco', 'juan@gmail.com', 1),
(2, 'María Díaz', 16, 'Amarillo', 'maria@gmail.com', 1),
(3, 'Pedro Sánchez', 14, 'Blanco', 'pedro@gmail.com', 1),
(4, 'Laura Castro', 17, 'Naranja', 'laura@gmail.com', 1),
(5, 'Andrés Ruiz', 18, 'Verde', 'andres@gmail.com', 1),
(6, 'Camila Vega', 15, 'Amarillo', 'camila@gmail.com', 1),
(7, 'David Moreno', 16, 'Naranja', 'david@gmail.com', 1),
(8, 'Paula Herrera', 17, 'Verde', 'paula@gmail.com', 1),
(9, 'Jorge Ramírez', 19, 'Azul', 'jorge@gmail.com', 1),
(10, 'Valentina Cruz', 14, 'Blanco', 'valentina@gmail.com', 1),
(11, 'Sebastián Torres', 18, 'Amarillo', 'sebastian@gmail.com', 1),
(12, 'Daniela Ortiz', 16, 'Naranja', 'daniela@gmail.com', 1),
(13, 'Mateo Silva', 17, 'Verde', 'mateo@gmail.com', 1),
(14, 'Lucía Mendoza', 15, 'Amarillo', 'lucia@gmail.com', 1),
(15, 'Felipe Navarro', 18, 'Azul', 'felipe@gmail.com', 1);

-- ============================================
-- INSERTAR DATOS INSTRUCTORS
-- ============================================

INSERT INTO instructors VALUES
(1, 'Carlos Pérez', 10, '3001111111', 1),
(2, 'Ana Gómez', 8, '3002222222', 1),
(3, 'Luis Martínez', 12, '3003333333', 1),
(4, 'Sofía Torres', 6, '3004444444', 1),
(5, 'Miguel Rojas', 15, '3005555555', 1);

-- ============================================
-- INSERTAR DATOS CLASSES
-- ============================================

INSERT INTO classes VALUES
(1, 'Karate Básico', 'Lunes 4PM', 20, 1),
(2, 'Taekwondo Intermedio', 'Martes 5PM', 15, 2),
(3, 'Judo Avanzado', 'Miércoles 6PM', 10, 3),
(4, 'Kung Fu Infantil', 'Jueves 3PM', 25, 4),
(5, 'Defensa Personal', 'Viernes 7PM', 30, 5);

-- ============================================
-- VERIFICACIÓN
-- ============================================
-- ============================================
-- VERIFICACIÓN
-- ============================================

-- Mostrar nombres y cinturones de estudiantes
SELECT name, belt
FROM students;

-- Mostrar instructores y años de experiencia
SELECT name, experience_years
FROM instructors;

-- Mostrar clases y horarios
SELECT class_name, schedule
FROM classes;

-- Mostrar estudiantes mayores de 16 años
SELECT name, age
FROM students
WHERE age > 16;

-- Contar total de estudiantes
SELECT COUNT(id) AS total_students
FROM students;

-- Mostrar clases con capacidad mayor a 15
SELECT class_name, capacity
FROM classes
WHERE capacity > 15;