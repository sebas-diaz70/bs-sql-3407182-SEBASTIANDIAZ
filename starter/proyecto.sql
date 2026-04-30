-- ============================================
-- PROYECTO: Academia de Artes Marciales
-- ============================================

-- ============================================
-- PASO 1: Tabla principal → students
-- ============================================

CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    age INTEGER,
    belt TEXT
);

-- ============================================
-- PASO 2: Segunda tabla → instructors
-- ============================================

CREATE TABLE instructors (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    experience_years INTEGER
);

-- ============================================
-- PASO 3: Insertar datos
-- ============================================

-- 15 estudiantes (OBLIGATORIO)
INSERT INTO students (id, name, age, belt) VALUES
(1, 'Juan López', 15, 'Blanco'),
(2, 'María Díaz', 16, 'Amarillo'),
(3, 'Pedro Sánchez', 14, 'Blanco'),
(4, 'Laura Castro', 17, 'Naranja'),
(5, 'Andrés Ruiz', 18, 'Verde'),
(6, 'Camila Vega', 15, 'Amarillo'),
(7, 'David Moreno', 16, 'Naranja'),
(8, 'Paula Herrera', 17, 'Verde'),
(9, 'Jorge Ramírez', 19, 'Azul'),
(10, 'Valentina Cruz', 14, 'Blanco'),
(11, 'Sebastián Torres', 18, 'Amarillo'),
(12, 'Daniela Ortiz', 16, 'Naranja'),
(13, 'Mateo Silva', 17, 'Verde'),
(14, 'Lucía Mendoza', 15, 'Amarillo'),
(15, 'Felipe Navarro', 18, 'Azul');

-- 5 instructores
INSERT INTO instructors (id, name, experience_years) VALUES
(1, 'Carlos Pérez', 10),
(2, 'Ana Gómez', 8),
(3, 'Luis Martínez', 12),
(4, 'Sofía Torres', 6),
(5, 'Miguel Rojas', 15);

-- ============================================
-- PASO 4: Consultas SELECT
-- ============================================

-- Ver todos los estudiantes
SELECT * FROM students;

-- Ver nombres ordenados
SELECT name FROM students ORDER BY name;

-- Contar estudiantes
SELECT COUNT(*) AS total_students FROM students;