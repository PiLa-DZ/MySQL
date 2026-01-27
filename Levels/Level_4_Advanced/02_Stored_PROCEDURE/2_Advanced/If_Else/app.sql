DELIMITER //

CREATE PROCEDURE CheckUserStatus(IN p_user_id INT)
BEGIN
    DECLARE post_count INT;
    DECLARE user_status VARCHAR(20);

    -- 1. Get the number of posts for this user
    SELECT COUNT(*) INTO post_count FROM posts WHERE user_id = p_user_id;

    -- 2. Logic to decide status
    IF post_count > 50 THEN
        SET user_status = 'Elite';
    ELSEIF post_count > 10 THEN
        SET user_status = 'Active';
    ELSE
        SET user_status = 'Newbie';
    END IF;

    -- 3. Return the result
    SELECT CONCAT('User level is: ', user_status) AS result;
END //

DELIMITER ;
