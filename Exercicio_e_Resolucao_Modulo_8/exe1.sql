CREATE DATABASE modulo9;
USE modulo9;
CREATE TABLE CONTA_BANCARIA(
	ID INT UNSIGNED NOT NULL AUTO_INCREMENT,
    TITULAR VARCHAR(45) NOT NULL,
    SALDO DOUBLE NOT NULL,
    PRIMARY KEY (ID)
)ENGINE=InnoDB;

INSERT INTO CONTA_BANCARIA VALUES (1, 'André', 213);
INSERT INTO CONTA_BANCARIA VALUES (2, 'Diogo', 489);
INSERT INTO CONTA_BANCARIA VALUES (3, 'Rafael', 568);
INSERT INTO CONTA_BANCARIA VALUES (4, 'Carlos', 712);
INSERT INTO CONTA_BANCARIA VALUES (5, 'Peter', -38);


SELECT * FROM CONTA_BANCARIA;

SET SQL_SAFE_UPDATES = 0;
START TRANSACTION;
UPDATE CONTA_BANCARIA SET SALDO = SALDO * 1.03 WHERE SALDO > 0;
COMMIT;
SET SQL_SAFE_UPDATES = 1;