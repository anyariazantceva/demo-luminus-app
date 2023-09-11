CREATE TABLE users
(
    id BIGINT PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    admin BOOLEAN,
    last_login timestamptz,
    is_active BOOLEAN,
    pass TEXT
);;





