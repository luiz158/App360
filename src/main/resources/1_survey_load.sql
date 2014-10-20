-- Load survey related objects into PostgreSQL DB

BEGIN;

-- TRUNCATE Data on tables
TRUNCATE TABLE questions CASCADE;
TRUNCATE TABLE surveys CASCADE;
TRUNCATE TABLE behaviors CASCADE;
TRUNCATE TABLE competencies CASCADE;

-- RESET Sequence on tables
--ALTER SEQUENCE questions_id_seq RESTART WITH 1;
--ALTER SEQUENCE surveys_id_seq RESTART WITH 1;
--ALTER SEQUENCE behaviors_id_seq RESTART WITH 1;
--ALTER SEQUENCE competencies_id_seq RESTART WITH 1;

-------------------------
-- DATA INSERT - START --
-------------------------

-- Insert Competences
-- INSERT INTO compentecies (name, description) VALUES ('x','y');
INSERT INTO competencies (css, name, description) VALUES
	('background-color: rgba(000, 176, 080, 0.8);','Vive con ética y valores','Se rige bajo principios de integridad con valores'),
	('background-color: rgba(112, 048, 160, 0.8);','Modela que el cliente es primero','Se enfoca en descubrir, satisfacer y superarar las necesidades del cliente'),
	('background-color: rgba(255, 048, 102, 0.8);','Establece relaciones armoniosas','Fundamenta sus relaciones en el respeto, armonía y consideración'),
	('background-color: rgba(255, 205, 000, 0.8);','Lidera con propósito y pasión','Genera compromiso en su equipo y los inspira a conseguir los mejores resultados'),
	('background-color: rgba(000, 112, 192, 0.8);','Asume su desarrollo','Se interesa por crecer personal y profesionalmente'),
	('background-color: rgba(255, 000, 000, 0.8);','Logra resultados con visión','Enfoca su esfuerzo y recursos para lograr resultados extraordinarios'),
	('background-color: rgba(083, 142, 213, 0.8);','Categoría Abierta','Categoría Abierta');
UPDATE competencies SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0;

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

---------------------------------------
-- START: Surveys ---------------------
---------------------------------------

-- Insert Surveys
INSERT INTO surveys (name, description, active) VALUES
	('Evaluación 360L [2014]','Evaluación 360L [2014]',TRUE),
	('Evaluación 360N [2014]','Evaluación 360N [2014]',TRUE);
UPDATE surveys SET create_time=now(), create_User='0 - System', version=0 WHERE id > 0;

---------------------------------------
-- START: 1st Survey (Non-Leads) ------
---------------------------------------
-- INSERT INTO questions (behavior, qindex, weight, qtext) VALUES (x, y, 'z');
INSERT INTO questions (behavior, qindex, weight, qtext) VALUES
(1,1,3,'Utiliza adecuadamente su tiempo y los recursos asignados'),
(1,2,3,'Actúa con ética de acuerdo a valores'),
(2,3,1,'Valora y aprecia como personas a los integrantes del equipo donde trabaja'),
(2,4,1,'Se interesa por conocer individualmente a los integrantes del equipo'),
(2,5,2,'Cuando brinda retroalimentación, lo hace con respeto hacia las personas'),
(2,6,1,'Se interesa sinceramente en los demás'),
(2,7,2,'Demuestra sensibilidad humana y solidaridad en el trato diario'),
(3,8,2,'Se adueña de los objetivos de la empresa cumpliendo sus compromisos'),
(3,9,1,'No se detiene hasta que termina el trabajo que ha iniciado'),
(3,10,2,'Es confiable y asume las consecuencias de sus decisiones y acciones'),
(4,11,2,'Lucha por alcanzar resultados beneficiosos para ambas partes'),
(4,12,2,'Consistentemente toma decisiones relacionadas con las personas de forma justa, equilibrada y sin discriminación'),
(5,13,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(6,14,3,'Muestra genuino interés por conocer y superar las expectativas de los clientes internos/externos'),
(6,15,1,'Sonríe genuinamente '),
(6,16,2,'Es accesible aún cuando está bajo presión'),
(6,17,3,'En cada acción modela que el cliente es primero'),
(7,18,1,'Es un embajador apasionado de la empresa'),
(7,19,1,'Mantiene un alto nivel de entusiasmo y es capaz de trabajar por su cuenta'),
(7,20,2,'Demuestra que su trabajo le brinda realización personal'),
(7,21,2,'Mantiene un balance en su vida personal'),
(7,22,2,'Disfruta lo que hace y trabaja con entusiasmo'),
(8,23,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(9,24,3,'Respeta opiniones, no se burla ni juzga'),
(9,25,2,'Escucha con atención y sin prejuicio a las personas'),
(9,26,3,'Trata con dignidad, consideración y tolerancia a todas las personas'),
(10,27,2,'Promueve integración, compañerismo y buenas relaciones'),
(10,28,2,'Contribuye a crear una atmósfera de confianza'),
(10,29,2,'Identifica de manera ágil, la existencia de conflictos y los resuelve de la mejor manera'),
(11,30,1,'Es persuasivo al comunicar sus puntos de vista'),
(11,31,1,'Es accesible; conversa, comunica, escucha y responde'),
(11,32,1,'Trabaja en armonía con otros, aun cuando no esté completamente de acuerdo'),
(11,33,1,'Busca activamente la opinión de otros y se asegura de transmitir oportunamente la información'),
(12,34,1,'Reconoce y valora la colaboración de los demás'),
(12,35,1,'Se integra y colabora con todos los equipos a los que pertenece para lograr mejores resultados '),
(13,36,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(14,37,2,'Promueve la incorporación y permanencia de la mejor gente en cada posición'),
(14,38,2,'Guía a otros hacia el logro de niveles más altos de rendimiento'),
(14,39,1,'Brinda acompañamiento a nuevos integrantes de su equipo'),
(15,40,1,'Comparte sus conocimientos'),
(15,41,2,'Asume con responsabilidad el desarrollo de cada integrante de su equipo a través de retos, retroalimentación continua, guía individual y monitoreo de progreso'),
(16,42,1,'Ayuda a los demás a ver el cambio como una oportunidad de crecimiento'),
(16,43,3,'Sirve y dirige al equipo, los reta y apoya para desarrollar su máximo potencial'),
(17,44,1,'Reconoce genuinamente las acciones de su equipo'),
(17,45,2,'Promueve el buen desempeño y ambiente con palabras, ejemplo y acciones'),
(17,46,1,'Otorga mérito a quienes lo merecen'),
(18,47,2,'Afronta oportunamente retos de disciplina o desempeño con respeto y consideración'),
(18,48,2,' Logra convicción por mejorar'),
(19,49,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(20,50,1,'Aprende de sus errores, busca y valora la retroalimentación sobre su desempeño'),
(20,51,2,'Explora nuevas formas de mejorar en el trabajo incorporando los aprendizajes a su práctica diaria'),
(21,52,1,'Muestra autocontrol de sus impulsos, lenguaje y emociones'),
(21,53,2,'Mantiene el enfoque cuando la situación se torna caótica'),
(21,54,1,'Está consciente de que sus emociones y comportamientos afectan a los demás'),
(21,55,1,'Actúa con  inteligencia emocional frente a cualquier evento y modela compostura en toda circunstancia'),
(22,56,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(23,57,1,'Logra resultados de máxima calidad'),
(23,58,1,'Cumple con los procedimientos y estándares establecidos'),
(23,59,1,'Aplica nuevas formas o medios de innovación'),
(23,60,1,'No tolera la mediocridad y busca la mejor manera de hacer las cosas'),
(24,61,1,'Su experiencia es relevante y de mucha ayuda  para el trabajo actual'),
(24,62,1,'Domina los conocimientos de su área de trabajo y entorno'),
(24,63,1,'Se orienta hacia el futuro y hacia la mejora continua. Busca nuevas y mejores formas de hacer las tareas'),
(25,64,1,'Involucra a otros en la persecución de un fin comun'),
(25,65,1,'Identifica los escenarios futuros y los comunica al equipo de manera sencilla, comprensible e inspiradora para tener una dirección compartida'),
(26,66,1,'Toma las decisiones correctas en el tiempo correcto'),
(26,67,1,'En todas las situaciones, toma decisiones acertadas y se responsabiliza del seguimiento y las consecuencias'),
(27,68,1,'Planifica sus actividades con base en prioridades'),
(27,69,1,'Trabaja de forma ordenada y organizada'),
(28,70,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(29,71,0,'Mencione las fortalezas que permiten al evaluado ser efectivo en su trabajo.'),
(29,72,0,'Cuáles son las áreas de oportunidad en que deberá enfocarse el evaluado para mejorar su gestión');

-- Set survey for 1st set of questions.
UPDATE questions SET open=FALSE, required=TRUE, scale=0, survey=1  WHERE id > 0;
---------------------------------------
-- END: 1st Survey (Non-Leads) --------
---------------------------------------

---------------------------------------
-- START: 2nd Survey (Non-Leads) ------
---------------------------------------
-- INSERT INTO questions (behavior, qindex, weight, qtext) VALUES (x, y, 'z');
INSERT INTO questions (behavior, qindex, weight, qtext) VALUES
(1,1,3,'Utiliza adecuadamente su tiempo y los recursos asignados'),
(1,2,3,'Actúa con ética de acuerdo a valores'),
(2,3,2,'Valora y aprecia como personas a los integrantes del equipo donde trabaja'),
(2,4,2,'Se interesa por conocer individualmente a los integrantes del equipo'),
(2,5,2,'Se interesa sinceramente en los demás'),
(2,6,2,'Demuestra sensibilidad humana y solidaridad en el trato diario'),
(3,7,2,'Se adueña de los objetivos de la empresa cumpliendo sus compromisos'),
(3,8,2,'No se detiene hasta que termina el trabajo que ha iniciado'),
(3,9,3,'Es confiable y asume las consecuencias de sus decisiones y acciones'),
(4,10,3,'Se relaciona con las personas de forma justa, equilibrada y sin discriminación'),
(5,11,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(6,12,3,'Muestra genuino interés por conocer y superar las expectativas de los clientes internos/externos'),
(6,13,1,'Sonríe genuinamente '),
(6,14,2,'Es accesible aún cuando está bajo presión'),
(6,15,3,'En cada acción modela que el cliente es primero'),
(7,16,2,'Es un embajador apasionado de la empresa'),
(7,17,2,'Mantiene un alto nivel de entusiasmo y es capaz de trabajar por su cuenta'),
(7,18,2,'Demuestra que su trabajo le brinda realización personal'),
(7,19,2,'Mantiene un balance en su vida personal'),
(7,20,2,'Disfruta lo que hace y trabaja con entusiasmo'),
(8,21,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(9,22,3,'Respeta opiniones, no se burla ni juzga'),
(9,23,2,'Escucha con atención y sin prejuicio a las personas'),
(9,24,2,'Trata con dignidad, consideración y tolerancia a todas las personas'),
(10,25,1,'Promueve integración, compañerismo y buenas relaciones'),
(10,26,2,'Contribuye a crear una atmósfera de confianza'),
(10,27,2,'Identifica de manera ágil, la existencia de conflictos y los resuelve de la mejor manera'),
(11,28,1,'Es persuasivo al comunicar sus puntos de vista'),
(11,29,2,'Es accesible; conversa, comunica, escucha y responde'),
(11,30,2,'Trabaja en armonía con otros, aun cuando no esté completamente de acuerdo'),
(11,31,2,'Busca activamente la opinión de otros y se asegura de transmitir oportunamente la información'),
(12,32,2,'Reconoce y valora la colaboración de los demás'),
(12,33,2,'Se integra y colabora con todos los equipos a los que pertenece para lograr mejores resultados '),
(13,34,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(20,35,2,'Aprende de sus errores, busca y valora la retroalimentación sobre su desempeño'),
(20,36,2,'Explora nuevas formas de mejorar en el trabajo incorporando los aprendizajes a su práctica diaria'),
(21,37,2,'Muestra autocontrol de sus impulsos, lenguaje y emociones'),
(21,38,1,'Mantiene el enfoque cuando la situación se torna caótica'),
(21,39,2,'Está consciente de que sus emociones y comportamientos afectan a los demás'),
(21,40,1,'Actúa con  inteligencia emocional frente a cualquier evento y modela compostura en toda circunstancia'),
(22,41,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(23,42,3,'Logra resultados de máxima calidad'),
(23,43,2,'Cumple con los procedimientos y estándares establecidos'),
(23,44,2,'Aplica nuevas formas o medios de innovación'),
(23,45,2,'No tolera la mediocridad y busca la mejor manera de hacer las cosas'),
(24,46,2,'Su experiencia es relevante y de mucha ayuda  para el trabajo actual'),
(24,47,3,'Domina los conocimientos de su área de trabajo y entorno'),
(24,48,3,'Se orienta hacia el futuro y hacia la mejora continua. Busca nuevas y mejores formas de hacer las tareas'),
(26,49,2,'Toma las decisiones correctas en el tiempo correcto'),
(27,50,2,'Planifica sus actividades con base en prioridades'),
(27,51,3,'Trabaja de forma ordenada y organizada'),
(28,52,0,'Cometarios y/o sugerencias con respecto a esta competencia evaluada'),
(29,53,0,'Mencione las fortalezas que permiten al evaluado ser efectivo en su trabajo.'),
(29,54,0,'Cuáles son las áreas de oportunidad en que deberá enfocarse el evaluado para mejorar su gestión');

-- Set survey for 2nd set of questions.
UPDATE questions SET open=FALSE, required=TRUE, scale=0, survey=2  WHERE survey IS NULL;
---------------------------------------
-- END: 2nd Survey (Non-Leads) --------
---------------------------------------

-- For all questions set create_user, create_time & versions
UPDATE questions SET create_time=now(), create_user='0 - System', version=0 WHERE id > 0;
-- For all open questions set open, required & scale
UPDATE questions SET open=TRUE, required=FALSE, scale=NULL WHERE behavior IN (5,8,13,19,22,28,29);

---------------------------------------
-- END: Surveys -----------------------
---------------------------------------

COMMIT;