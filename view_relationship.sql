USE curso_sql;

SELECT * FROM funcionarios;
SELECT * FROM veiculos;

SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;
SELECT * FROM funcionarios f INNER JOIN veiculos ON funcionario_id = f.id;

SELECT * FROM funcionarios f LEFT JOIN veiculos ON funcionario_id = f.id;

INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, "Moto", "SB-0003");


SELECT * FROM funcionarios f RIGHT JOIN veiculos ON funcionario_id = f.id;
SELECT * FROM funcionarios f LEFT JOIN veiculos ON funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos ON funcionario_id = f.id;  /* FULL JOIN */

CREATE TABLE cpfs (
	id int unsigned not null,
    cpf varchar(14) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_cpf FOREIGN KEY (id) REFERENCES funcionarios (id)
);

INSERT INTO cpfs (id, cpf) VALUES (1, '111');
INSERT INTO cpfs (id, cpf) VALUES (2, '222');
INSERT INTO cpfs (id, cpf) VALUES (3, '333');

SELECT * FROM cpfs;

SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING (id); 


CREATE TABLE clientes
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    quem_indicou int unsigned,
    PRIMARY KEY (id),
    CONSTRAINT fk_quem_indicou FOREIGN KEY (quem_indicou) REFERENCES clientes (id)
);

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

SELECT * FROM clientes;

SELECT c1.nome AS Nome, c2.nome AS Quem_indicou FROM clientes c1 join clientes c2 ON c1.quem_indicou = c2.id;

SELECT * FROM funcionarios f
 INNER JOIN veiculos v ON v.funcionario_id = f.id
 INNER JOIN cpfs ON cpfs.id = f.id;

CREATE VIEW funcionarios_alto_salario AS SELECT * FROM funcionarios WHERE salario >= 1700;
SELECT * FROM funcionarios_alto_salario;

DROP VIEW funcionarios_alto_salario;
CREATE VIEW funcionarios_alto_salario AS SELECT * FROM funcionarios WHERE salario >= 2000; /* View é similar à uma função*/
