--;;
INSERT INTO new_users (id, first_name, last_name, user_email, admin, last_login, is_active, pass)
SELECT id, first_name, last_name, email, admin, last_login, is_active, pass
FROM users;

