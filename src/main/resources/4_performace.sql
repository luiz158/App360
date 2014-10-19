
BEGIN;
------------------
-- INDEX START ---
------------------

-- Table: roles
-- Improves performace by preventing a full table scan.
CREATE INDEX ON app_roles (system_user);

-- Table: users
-- Improves performace by preventing a full table scan.
CREATE INDEX ON app_users (active);
CREATE INDEX ON app_users (employee);
CREATE INDEX ON app_users (password);
CREATE INDEX ON app_users (username);

-------- APPLICATION --------
-- Index creation for Answers.
CREATE INDEX ON answers (evaluation);
CREATE INDEX ON answers (nvalue);
CREATE INDEX ON answers (qindex);
CREATE INDEX ON answers (question);
CREATE INDEX ON answers (tvalue);
CREATE INDEX ON answers (length(tvalue));

-- Index creation for Behaviors.
CREATE INDEX ON behaviors (competence);
CREATE INDEX ON behaviors (name);

-- Index creation for Brands.
CREATE INDEX ON brands (name);

-- Index creation for Competencies.
CREATE INDEX ON competencies (name);

-- Index creation for Countries.
CREATE INDEX ON countries (name);

-- Index creation for Employees.
-- Internal Indexes
CREATE INDEX employees_lname_1st_letter ON employees (upper(substr(lname,1,1)));
CREATE INDEX ON employees (active);
CREATE INDEX ON employees (boss);
CREATE INDEX ON employees (doc_id);
CREATE INDEX ON employees (fname);
CREATE INDEX ON employees (lname);
-- Foreign Indexes
CREATE INDEX ON employees (brand);
CREATE INDEX ON employees (country);

-- Index creation for Evaluations.
CREATE INDEX ON evaluations (completed);
CREATE INDEX ON evaluations (evaluand);
CREATE INDEX ON evaluations (evaluator);
CREATE INDEX ON evaluations (survey);

-- Index creation for Questions.
CREATE INDEX ON questions (behavior);
CREATE INDEX ON questions (qindex);
CREATE INDEX ON questions (survey);

-- Index creation for Surveys.
CREATE INDEX ON surveys (active);
CREATE INDEX ON surveys (name);

------------------
-- INDEX END -----
------------------

COMMIT;
