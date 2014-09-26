-- Load survey related objects into PostgreSQL DB

BEGIN;

-- TRUNCATE Data on tables
TRUNCATE TABLE questions;
TRUNCATE TABLE surveys;
TRUNCATE TABLE behaviors;
TRUNCATE TABLE competencies;

-- RESET Sequence on tables
ALTER SEQUENCE questions_id_seq RESTART WITH 1;
ALTER SEQUENCE surveys_id_seq RESTART WITH 1;
ALTER SEQUENCE behaviors_id_seq RESTART WITH 1;
ALTER SEQUENCE competencies_id_seq RESTART WITH 1;

-------------------------
-- DATA INSERT - START --
-------------------------

-- Insert Competences
-- INSERT INTO compentecies (name, description) VALUES ('x','y');
INSERT INTO competencies (name, description) VALUES
	('Vive con ética y valores','Se rige bajo principios de integridad con valores'),
	('Modela que el cliente es primero','Se enfoca en descubrir, satisfacer y superarar las necesidades del cliente'),
	('Establece relaciones armoniosas','Fundamenta sus relaciones en el respeto, armonía y consideración'),
	('Lidera con propósito y pasión','Genera compromiso en su equipo y los inspira a conseguir los mejores resultados'),
	('Asume su desarrollo','Se interesa por crecer personal y profesionalmente'),
	('Logra resultados con visión','Enfoca su esfuerzo y recursos para lograr resultados extraordinarios'),
	('Categoría Abierta','Categoría Abierta');
UPDATE competencies SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0;
-- UPDATE competencies SET html_style='background-color: rgba(0, 0, 0, 0.5);' WHERE id > 0;
UPDATE competencies SET html_style='background-color: rgba(0, 176, 80, 0.8);' WHERE id = 1;
UPDATE competencies SET html_style='background-color: rgba(112, 48, 160, 0.8);' WHERE id = 2;
UPDATE competencies SET html_style='background-color: rgba(255, 48, 102, 0.8);' WHERE id = 3;
UPDATE competencies SET html_style='background-color: rgba(255, 205, 0, 0.8);' WHERE id = 4;
UPDATE competencies SET html_style='background-color: rgba(0, 112, 192, 0.8);' WHERE id = 5;
UPDATE competencies SET html_style='background-color: rgba(255, 0, 0, 0.8);' WHERE id = 6;
UPDATE competencies SET html_style='background-color: rgba(83, 142, 213, 0.8);' WHERE id = 7;


-- Insert Behaviors
-- INSERT INTO behaviors (competence, name) VALUES (x,'y');
INSERT INTO behaviors (competence, name) VALUES
-- COMP 1: Vive con ética y valores
	(1,'Es honesto'),
	(1,'Vive y trabaja con humanidad'),
	(1,'Actúa con responsabilidad'),
	(1,'Es justo y equitativo'),
	(1,'Comentario abierto'),
-- COMP 2: Modela que el cliente es primero
	(2,'Demuestra enfoque en el servicio'),
	(2,'Trabaja con orgullo y entusiasmo'),
	(2,'Comentario abierto'),
-- COMP 3: Establece relaciones armoniosas
	(3,'Trata a todos con respeto'),
	(3,'Genera armonía'),
	(3,'Comunica efectivamente'),
	(3,'Trabaja en equipo'),
	(3,'Comentario abierto'),
-- COMP 4: Lidera con propósito y pasión
	(4,'Construye un equipo ganador'),
	(4,'Desarrolla a su equipo'),
	(4,'Es un líder que inspira'),
	(4,'Brinda reconocimiento oportuno'),
	(4,'Ejerce autoridad con respeto'),
	(4,'Comentario abierto'),
-- COMP 5: Asume su desarrollo
	(5,'Muestra interés por su crecimiento y aprendizaje'),
	(5,'Mantiene estabilidad emocional'),
	(5,'Comentario abierto'),
-- COMP 6: Logra resultados con visión
	(6,'Busca la excelencia'),
	(6,'Conoce el negocio'),
	(6,'Construye y encausa una visión'),
	(6,'Toma decisiones acertadas'),
	(6,'Es organizado'),
	(6,'Comentario abierto'),
-- COMP 7: Categoría Abierta
	(7,'Preguntas abiertas');
UPDATE behaviors SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0;

-- Insert Surveys
INSERT INTO surveys (name, description, active) VALUES
	('Evaluación 360L [2014]','Evaluación 360L [2014]',TRUE),
	('Evaluación 360N [2014]','Evaluación 360N [2014]',TRUE),
UPDATE surveys SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0;

---------------------
-- Survey No. 1 -----
-- Leaders ----------
---------------------

-- Insert Questions
-- INSERT INTO questions (behavior, qindex, weight, qtext) VALUES (x, y, 'z');
INSERT INTO questions (behavior, qindex, weight, qtext) VALUES
-- Comp:1
	(1,0,3,'Utiliza adecuadamente su tiempo y los recursos asignados'),
	(1,1,3,'Actúa con ética de acuerdo a valores'),
	(2,2,1,'Valora y aprecia como personas a los integrantes del equipo'),
	(2,3,1,'Se interesa por conocer individualmente a los integrantes del equipo'),
	(2,4,2,'Demuestra sensibilidad humana y solidaridad en el trato diario'),
	(3,5,'Se adueña de los objetivos de la empresa cumpliendo sus compromisos'),
	(3,6,'Es confiable y asume las consecuencias de sus decisiones y acciones'),
	(4,7,'Consistentemente toma decisiones relacionadas con las personas de forma justa, equilibrada y sin discriminación'),
	(5,8,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:2
	(6,9,'Muestra genuino interés por conocer y superar las expectativas de los clientes internos/externos'),
	(6,10,'Siempre sonríe genuinamente '),
	(6,11,'En cada acción modela que el cliente es primero'),
	(7,12,'Es un embajador apasionado de la empresa'),
	(7,13,'Disfruta lo que hace y trabaja con entusiasmo'),
	(8,14,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:3
	(9,15,'Respeta opiniones, no se burla ni juzga'),
	(9,16,'Trata con dignidad, consideración y tolerancia a todas las personas'),
	(10,17,'Promueve integración, compañerismo y buenas relaciones'),
	(10,18,'Identifica de manera ágil la existencia de conflictos y los resuelve de la mejor manera'),
	(11,19,'Es accesible; conversa, comunica, escucha y responde'),
	(11,20,'Busca activamente la opinión de otros y se asegura de transmitir oportunamente la información'),
	(12,21,'Se integra y colabora con todos los equipos a los que pertenece para lograr mejores resultados '),
	(13,22,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:4
	(14,23,'Promueve la incorporación y permanencia de la mejor gente en cada posición'),
	(15,24,'Comparte sus conocimientos'),
	(15,25,'Asume con responsabilidad el desarrollo de cada integrante de su equipo a través de retos, retroalimentación continua, guía individual y monitoreo de progreso'),
	(16,26,'Sirve y dirige al equipo, los reta y apoya para desarrollar su máximo potencial'),
	(17,27,'Reconoce genuinamente las acciones de su equipo'),
	(17,28,'Promueve el buen desempeño y ambiente con palabras, ejemplo y acciones'),
	(17,29,'Otorga mérito a quienes lo merecen'),
	(18,30,'Afronta oportunamente retos de disciplina o desempeño con respeto y consideración'),
	(18,31,' Logra convicción por mejorar'),
	(19,32,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:5
	(20,33,'Es consciente de sus fortalezas personales y áreas de oportunidad'),
	(20,34,'Explora nuevas formas de mejorar en el trabajo incorporando los aprendizajes a su práctica diaria'),
	(21,35,'Actúa con  inteligencia emocional frente a cualquier circunstancia y modela compostura en toda circunstancia'),
	(22,36,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:6
	(23,37,'Logra resultados de máxima calidad'),
	(23,38,'Cumple con los procedimientos y estándares establecidos'),
	(23,39,'No tolera la mediocridad y busca la mejor manera de hacer las cosas'),
	(24,40,'Domina los conocimientos de su área de trabajo y entorno'),
	(25,41,'Identifica los escenarios futuros y los comunica al equipo de manera sencilla, comprensible e inspiradora para tener una dirección compartida'),
	(26,42,'En todas las situaciones, toma decisiones acertadas y se responsabiliza del seguimiento y las consecuencias'),
	(27,43,'Planifica sus actividades con base en prioridades'),
	(27,44,'Trabaja de forma ordenada y organizada'),
	(28,45,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:7
	(29,46,'Enumere las 3 cualidades del evaluado (a) que le permiten ser efectivo'),
	(29,47,'Desde su punto de vista, en qué aspectos debe enfocarse el evaluado para elevar sus resultados'),
	(29,48,'Si desea ampliar sus aportes, a continuación puede hacerlo');
UPDATE questions SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0;
UPDATE questions SET open=FALSE, required=TRUE, scale=0, survey=1  WHERE id > 0;
UPDATE questions SET open=TRUE, required=FALSE, scale=NULL WHERE behavior IN (5,8,13,19,22,28,29);

---------------------
-- Survey No. 2 -----
-- Non-Leaders ------
---------------------

INSERT INTO questions (behavior, qindex, weight, qtext) VALUES
-- Comp:1
	(1,0,'Utiliza adecuadamente su tiempo y los recursos asignados'),
	(1,1,'Actúa con ética de acuerdo a valores'),
	(2,2,'Valora y aprecia como personas a los integrantes del equipo'),
	(2,3,'Se interesa por conocer individualmente a los integrantes del equipo'),
	(2,4,'Demuestra sensibilidad humana y solidaridad en el trato diario'),
	(3,5,'Se adueña de los objetivos de la empresa cumpliendo sus compromisos'),
	(3,6,'Es confiable y asume las consecuencias de sus decisiones y acciones'),
	(4,7,'Consistentemente toma decisiones relacionadas con las personas de forma justa, equilibrada y sin discriminación'),
	(5,8,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:2
	(6,9,'Muestra genuino interés por conocer y superar las expectativas de los clientes internos/externos'),
	(6,10,'Siempre sonríe genuinamente '),
	(6,11,'En cada acción modela que el cliente es primero'),
	(7,12,'Es un embajador apasionado de la empresa'),
	(7,13,'Disfruta lo que hace y trabaja con entusiasmo'),
	(8,14,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:3
	(9,15,'Respeta opiniones, no se burla ni juzga'),
	(9,16,'Trata con dignidad, consideración y tolerancia a todas las personas'),
	(10,17,'Promueve integración, compañerismo y buenas relaciones'),
	(10,18,'Identifica de manera ágil la existencia de conflictos y los resuelve de la mejor manera'),
	(11,19,'Es accesible; conversa, comunica, escucha y responde'),
	(11,20,'Busca activamente la opinión de otros y se asegura de transmitir oportunamente la información'),
	(12,21,'Se integra y colabora con todos los equipos a los que pertenece para lograr mejores resultados '),
	(13,22,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:4
	(14,23,'Promueve la incorporación y permanencia de la mejor gente en cada posición'),
	(15,24,'Comparte sus conocimientos'),
	(15,25,'Asume con responsabilidad el desarrollo de cada integrante de su equipo a través de retos, retroalimentación continua, guía individual y monitoreo de progreso'),
	(16,26,'Sirve y dirige al equipo, los reta y apoya para desarrollar su máximo potencial'),
	(17,27,'Reconoce genuinamente las acciones de su equipo'),
	(17,28,'Promueve el buen desempeño y ambiente con palabras, ejemplo y acciones'),
	(17,29,'Otorga mérito a quienes lo merecen'),
	(18,30,'Afronta oportunamente retos de disciplina o desempeño con respeto y consideración'),
	(18,31,' Logra convicción por mejorar'),
	(19,32,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:5
	(20,33,'Es consciente de sus fortalezas personales y áreas de oportunidad'),
	(20,34,'Explora nuevas formas de mejorar en el trabajo incorporando los aprendizajes a su práctica diaria'),
	(21,35,'Actúa con  inteligencia emocional frente a cualquier circunstancia y modela compostura en toda circunstancia'),
	(22,36,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:6
	(23,37,'Logra resultados de máxima calidad'),
	(23,38,'Cumple con los procedimientos y estándares establecidos'),
	(23,39,'No tolera la mediocridad y busca la mejor manera de hacer las cosas'),
	(24,40,'Domina los conocimientos de su área de trabajo y entorno'),
	(25,41,'Identifica los escenarios futuros y los comunica al equipo de manera sencilla, comprensible e inspiradora para tener una dirección compartida'),
	(26,42,'En todas las situaciones, toma decisiones acertadas y se responsabiliza del seguimiento y las consecuencias'),
	(27,43,'Planifica sus actividades con base en prioridades'),
	(27,44,'Trabaja de forma ordenada y organizada'),
	(28,45,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
-- Comp:7
	(29,46,'Enumere las 3 cualidades del evaluado (a) que le permiten ser efectivo'),
	(29,47,'Desde su punto de vista, en qué aspectos debe enfocarse el evaluado para elevar sus resultados'),
	(29,48,'Si desea ampliar sus aportes, a continuación puede hacerlo');
UPDATE questions SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0 AND survey IS NULL;
UPDATE questions SET open=FALSE, required=TRUE, scale=0, survey=2  WHERE id > 0 AND survey IS NULL;
UPDATE questions SET open=TRUE, required=FALSE, scale=NULL WHERE behavior IN (5,8,13,19,22,28,29);




COMMIT;