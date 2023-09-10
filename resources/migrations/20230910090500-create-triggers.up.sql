--;;
BEGIN;
CREATE OR REPLACE FUNCTION insert_trigger_function()
    RETURNS TRIGGER AS $$
BEGIN
    -- Add error handling and validation here if needed
    INSERT INTO new_users (id, user_email)
    VALUES (NEW.id, NEW.email);
    RETURN NEW;
EXCEPTION
    WHEN others THEN
        INSERT INTO error_logs (timestamp, message) VALUES (now(), SQLERRM);
END;
$$ LANGUAGE plpgsql;

--;;
CREATE TRIGGER insert_trigger
    AFTER INSERT ON users
    FOR EACH ROW
EXECUTE FUNCTION insert_trigger_function();

-- Create the UPDATE trigger function
--;;
CREATE OR REPLACE FUNCTION update_trigger_function()
    RETURNS TRIGGER AS $$
BEGIN
    -- Add error handling and validation here if needed
    -- Update the corresponding row in the new table based on the NEW values
    UPDATE new_users
    SET user_email = NEW.email
    WHERE id = NEW.id;

    RETURN NEW;
EXCEPTION
    WHEN others THEN
        INSERT INTO error_logs (timestamp, message) VALUES (now(), SQLERRM);
END;
$$ LANGUAGE plpgsql;

-- Create the UPDATE trigger
--;;
CREATE TRIGGER update_trigger
    AFTER UPDATE ON users
    FOR EACH ROW
EXECUTE FUNCTION update_trigger_function();
COMMIT;