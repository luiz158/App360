-- Load strucuture related objects into PostgreSQL DB

BEGIN;

TRUNCATE TABLE evaluations CASCADE;


UPDATE employees SET create_time=now(), create_User='0 - System', version=0 WHERE id IS NOT NULL;

COMMIT;