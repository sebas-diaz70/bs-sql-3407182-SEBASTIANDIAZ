-- ============================================
-- PROYECTO SEMANAL: Operadores y Filtros
-- Semana 05 — BETWEEN, IN, LIKE
-- Academia de Artes Marciales
-- ============================================

-- ============================================
-- LIMPIEZA
-- ============================================

DROP TABLE IF EXISTS classes;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;

-- ============================================
-- CREACIÓN DE TABLAS
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
-- INSERTAR ESTUDIANTES (30 REGISTROS)
-- ============================================

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
(15, 'Felipe Navarro', 18, 'Azul', 'felipe@gmail.com'),
(16, 'Kevin Rojas', 20, 'Negro', 'kevin@gmail.com'),
(17, 'Sara Méndez', 13, 'Blanco', 'sara@gmail.com'),
(18, 'Juliana Peña', 21, 'Verde', 'juliana@gmail.com'),
(19, 'Oscar Medina', 22, 'Azul', 'oscar@gmail.com'),
(20, 'Tatiana Cruz', 16, 'Naranja', 'tatiana@gmail.com'),
(21, 'Ricardo León', 15, 'Amarillo', 'ricardo@gmail.com'),
(22, 'Natalia Mora', 17, 'Verde', 'natalia@gmail.com'),
(23, 'Mauricio Gil', 19, 'Azul', 'mauricio@gmail.com'),
(24, 'Andrea Ruiz', 18, 'Negro', 'andrea@gmail.com'),
(25, 'Javier Peña', 14, 'Blanco', 'javier@gmail.com'),
(26, 'Sandra Gómez', 16, 'Amarillo', 'sandra@gmail.com'),
(27, 'Felipe Soto', 20, 'Verde', 'fsoto@gmail.com'),
(28, 'Diana Torres', 21, 'Azul', 'diana@gmail.com'),
(29, 'Miguel Herrera', 18, 'Negro', 'miguel@gmail.com'),
(30, 'Carolina Vega', 15, 'Naranja', 'carolina@gmail.com');

-- ============================================
-- INSERTAR INSTRUCTORES (10 REGISTROS)
-- ============================================

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
(10, 'Mauricio Vega', 14, '3011111111');

-- ============================================
-- INSERTAR CLASES (10 REGISTROS)
-- ============================================

INSERT INTO classes VALUES
(1, 'Karate Básico', 'Lunes 4PM', 20, 1),
(2, 'Taekwondo Intermedio', 'Martes 5PM', 15, 2),
(3, 'Judo Avanzado', 'Miércoles 6PM', 10, 3),
(4, 'Kung Fu Infantil', 'Jueves 3PM', 25, 4),
(5, 'Defensa Personal', 'Viernes 7PM', 30, 5),
(6, 'Muay Thai', 'Sábado 9AM', 18, 6),
(7, 'Kick Boxing', 'Lunes 6PM', 20, 7),
(8, 'Jiu Jitsu', 'Martes 7PM', 12, 8),
(9, 'Boxeo Juvenil', 'Miércoles 5PM', 16, 9),
(10, 'Karate Avanzado', 'Viernes 6PM', 14, 10);

-- ============================================
-- CONSULTA 1: Filtro con BETWEEN
-- ============================================

-- Mostrar estudiantes entre 15 y 18 años

SELECT id, name, age, belt
FROM students
WHERE age BETWEEN 15 AND 18;

-- ============================================
-- CONSULTA 2: Filtro con IN
-- ============================================

-- Mostrar estudiantes con cinturón
-- Amarillo, Verde o Azul

SELECT id, name, belt
FROM students
WHERE belt IN ('Amarillo', 'Verde', 'Azul');

-- ============================================
-- CONSULTA 3: Búsqueda con LIKE
-- ============================================

|

SELECT id, name
FROM students
WHERE name LIKE '%a%';

-- ============================================
-- CONSULTA 4: Filtro combinado
-- ============================================

-- Mostrar estudiantes:
-- entre 15 y 18 años,
-- con cinturón Verde o Azul,
-- y cuyo nombre contenga la letra "o"

SELECT id, name, age, belt
FROM students
WHERE age BETWEEN 15 AND 18
  AND belt IN ('Verde', 'Azul')
  AND name LIKE '%o%'
ORDER BY age;