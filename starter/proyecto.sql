-- ============================================
-- PROYECTO SEMANAL: DML — Manipulación de Datos
-- Semana 03
-- Academia de Artes Marciales
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

-- ============================================
-- CREAR TABLAS
-- ============================================

CREATE TABLE students (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    age INTEGER NOT NULL
        CHECK(age >= 5 AND age <= 60),

    belt TEXT NOT NULL
        DEFAULT 'Blanco',

    email TEXT UNIQUE
);

CREATE TABLE instructors (
    id INTEGER PRIMARY KEY,

    name TEXT NOT NULL,

    experience_years INTEGER NOT NULL
        CHECK(experience_years >= 0),

    phone TEXT UNIQUE
);

CREATE TABLE classes (
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
-- PARTE 1: INSERT INTO
-- ============================================

-- INSERTAR 15 ESTUDIANTES

INSERT INTO students VALUES
(1, 'Juan López', 15, 'Blanco', 'juan@gmail.com'),
(2, 'María Díaz', 16, 'Amarillo', 'maria@gmail.com'),
(3, 'Pedro Sánchez', 14, 'Blanco', 'pedro@gmail.com'),
(4, 'Laura Castro', 17, 'Naranja', 'laura@gmail.com'),
(5, 'Andrés Ruiz', 18, 'Verde', 'andres@gmail.com'),
(6, 'Camila Vega', 15, 'Amarillo', 'camila@gmail.com'),
(7, 'David Moreno', 16, 'Naranja', 'david@gmail.com'),
(8, 'Paula Herrera', 17, 'Verde', 'paula@gmail.com'),
(9, 'Jorge Ramírez', 19, 'Azul', 'jorge@gmail.com'),
(10, 'Valentina Cruz', 14, 'Blanco', 'valentina@gmail.com'),
(11, 'Sebastián Torres', 18, 'Amarillo', 'sebastian@gmail.com'),
(12, 'Daniela Ortiz', 16, 'Naranja', 'daniela@gmail.com'),
(13, 'Mateo Silva', 17, 'Verde', 'mateo@gmail.com'),
(14, 'Lucía Mendoza', 15, 'Amarillo', 'lucia@gmail.com'),
(15, 'Felipe Navarro', 18, 'Azul', 'felipe@gmail.com');

-- INSERTAR 15 INSTRUCTORES

INSERT INTO instructors VALUES
(1, 'Carlos Pérez', 10, '3001111111'),
(2, 'Ana Gómez', 8, '3002222222'),
(3, 'Luis Martínez', 12, '3003333333'),
(4, 'Sofía Torres', 6, '3004444444'),
(5, 'Miguel Rojas', 15, '3005555555'),
(6, 'Ricardo León', 7, '3006666666'),
(7, 'Natalia Mora', 9, '3007777777'),
(8, 'Javier Peña', 11, '3008888888'),
(9, 'Sandra Gil', 5, '3009999999'),
(10, 'Mauricio Vega', 14, '3011111111'),
(11, 'Andrea Ruiz', 8, '3012222222'),
(12, 'Felipe Soto', 13, '3013333333'),
(13, 'Kevin Rojas', 4, '3014444444'),
(14, 'Tatiana Cruz', 10, '3015555555'),
(15, 'Oscar Medina', 16, '3016666666');

-- INSERTAR 5 CLASES

INSERT INTO classes VALUES
(1, 'Karate Básico', 'Lunes 4PM', 20, 1),
(2, 'Taekwondo Intermedio', 'Martes 5PM', 15, 2),
(3, 'Judo Avanzado', 'Miércoles 6PM', 10, 3),
(4, 'Kung Fu Infantil', 'Jueves 3PM', 25, 4),
(5, 'Defensa Personal', 'Viernes 7PM', 30, 5);

-- ============================================
-- PARTE 2: UPDATE
-- ============================================

-- Actualizar cinturón de un estudiante específico

UPDATE students
SET belt = 'Negro'
WHERE id = 1;

-- Actualizar múltiples columnas

UPDATE students
SET age = 20,
    belt = 'Azul'
WHERE id = 5;

-- Actualizar múltiples filas

UPDATE students
SET belt = 'Verde'
WHERE age < 16;

-- ============================================
-- PARTE 3: DELETE SEGURO
-- ============================================

-- Verificar qué instructores serán eliminados

SELECT id, name
FROM instructors
WHERE experience_years < 5;

-- Eliminar instructores con menos de 5 años

DELETE FROM instructors
WHERE experience_years < 5;

-- ============================================
-- VERIFICACIÓN FINAL
-- ============================================

-- Mostrar estudiantes

SELECT id, name, age, belt
FROM students
ORDER BY id;

-- Mostrar instructores

SELECT id, name, experience_years
FROM instructors
ORDER BY id;

-- Mostrar clases

SELECT id, class_name, schedule
FROM classes
ORDER BY id;