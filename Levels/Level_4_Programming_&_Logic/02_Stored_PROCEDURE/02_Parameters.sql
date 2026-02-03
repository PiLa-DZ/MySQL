DELIMITER //
CREATE PROCEDURE AddUser(
    IN p_name VARCHAR(50), 
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO users (name, email) VALUES (p_name, p_email);
END //
DELIMITER ;

CALL AddUser("Amin", "Amin@gmail.com");
