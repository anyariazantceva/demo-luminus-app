BEGIN;
-- Rename the old table (atomic operation)
ALTER TABLE users RENAME TO users_temp;

-- Rename the new table to the original table name (atomic operation)
ALTER TABLE new_users RENAME TO users;

COMMIT;