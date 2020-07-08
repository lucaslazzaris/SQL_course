CREATE USER 'andre'@'localhost' IDENTIFIED BY 'milani123456'; /* local pode ser um ip */
/* CREATE USER 'andre'@'%' IDENTIFIED BY 'milani123456';  */

GRANT ALL ON curso_sql.* TO 'andre'@'localhost';

CREATE USER 'andre'@'%' IDENTIFIED BY 'milani123456';
GRANT SELECT ON curso_sql.* TO 'andre'@'%'; /* Não pode fazer revoke em curso_sql.funcionarios, precisa fazer em tudo */
GRANT INSERT ON curso_sql.funcionarios TO 'andre'@'%';


REVOKE INSERT ON curso_sql.funcionarios FROM 'andre'@'%';

DROP USER 'andre'@'%';

SELECT USER FROM mysql.USER;
SHOW GRANTS FOR 'andre'@'localhost';