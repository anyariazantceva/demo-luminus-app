--;;
BEGIN;
CREATE TABLE new_users (
                           id BIGINT PRIMARY KEY,
                           first_name TEXT,
                           last_name TEXT,
                           user_email TEXT,
                           admin BOOLEAN,
                           last_login timestamptz,
                           is_active BOOLEAN,
                           pass TEXT
);
--;;
ALTER TABLE new_users ADD CONSTRAINT text_size CHECK (LENGTH(user_email) <= 100);
COMMIT;