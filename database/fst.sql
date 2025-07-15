DROP FUNCTION IF EXISTS isPresent;
DROP PROCEDURE IF EXISTS book;
DROP PROCEDURE IF EXISTS CANCEL;
DROP TRIGGER IF EXISTS after_booking_cancel;
CREATE FUNCTION isPresent(t VARCHAR(10))
RETURNS TINYINT(1) DETERMINISTIC
BEGIN
    DECLARE Present TINYINT(1);
    SELECT EXISTS(
        SELECT 1 FROM USERS WHERE USERNAME = t
    ) INTO Present;
    RETURN Present;
END;
CREATE PROCEDURE book(
    IN uname VARCHAR(30),
    IN c_id VARCHAR(30),
    IN b_id VARCHAR(30),
    IN e_id VARCHAR(30),
    IN DIR VARCHAR(100),
    IN seat_count INT
)
BEGIN
    DECLARE a INT;  
    DECLARE b INT;  
    DECLARE c INT;  

    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;

    SELECT COUNT(*) INTO a
    FROM CLASS
    WHERE CLASS_ID = c_id AND EVENT_ID = e_id;

    IF a > 0 THEN
        SELECT COST INTO c
        FROM CLASS
        WHERE CLASS_ID = c_id AND EVENT_ID = e_id;

        SET c = c * seat_count;

        SELECT TOTAL_SEATS_AVAILABLE INTO b
        FROM CLASS
        WHERE CLASS_ID = c_id AND EVENT_ID = e_id;

        IF b IS NOT NULL AND b >= seat_count THEN
            UPDATE CLASS
            SET TOTAL_SEATS_AVAILABLE = TOTAL_SEATS_AVAILABLE - seat_count
            WHERE CLASS_ID = c_id AND EVENT_ID = e_id;

            INSERT INTO BOOKINGS (
                USERNAME,
                BOOKING_ID,
                EVENT_ID,
                TICKET_COUNT,
                TICKETS_VALUE,
                STATUS,
                CLASS_ID,
                DATE_AND_TIME
            ) VALUES (uname, b_id, e_id, seat_count, c,1,c_id, NOW());
            INSERT INTO TRANSACTION_DETAILS(
                TRANSACTION_ID,
                BOOKING_ID,
                AMOUNT_PAID,
                STATUS,
                DIR,
                TRANSACTION_TIMESTAMP
            )VALUES(CONCAT(b_id, '0'),b_id,c,1,DIR,NOW());
        END IF;
    END IF;

    COMMIT;
END;
CREATE PROCEDURE CANCEL(in BOOK_id VARCHAR(30))
BEGIN
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
    START TRANSACTION;
   UPDATE BOOKINGS 
    SET status =0
    WHERE BOOKING_ID = BOOK_id;
    COMMIT;

END;
CREATE TRIGGER after_booking_cancel
AFTER DELETE ON BOOKINGS
FOR EACH ROW
BEGIN
 IF NEW.status = 0 AND OLD.status != 0 THEN
        UPDATE CLASS
        SET TOTAL_SEATS_AVAILABLE = TOTAL_SEATS_AVAILABLE + OLD.TICKET_COUNT
        WHERE CLASS_ID = OLD.CLASS_ID;  
    END IF;
END;

-- create procedure cancel(
--     IN book_id varchar(30)
-- )
-- BEGIN
--     SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--     START TRANSACTION;
--     UPDATE BOOKINGS
--     SET STAT =0
--     WHERE BOOKING_ID=book_id;
--     UPDATE BOOKINGS NATURAL JOIN CLASS
--     SET CLASS.TOTAL_SEATS_AVAILABLE = CLASS.TOTAL_SEATS_AVAILABLE + BOOKINGS.TICKET_COUNT
--     WHERE CLASS.BOOKING_ID=book_id;
--     COMMIT;
-- END;
-- create procedure your_tickets(
--     IN uname VARCHAR(30)
-- )
-- BEGIN
--     SELECT *
--     FROM BOOKINGS
--     WHERE USERNAME=uname;
-- END