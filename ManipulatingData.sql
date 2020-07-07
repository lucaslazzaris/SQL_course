USE curso_sql;

CREATE TABLE salarios (
	faixa varchar(45) not null,
    inicio double not null,
    fim double not null,
	PRIMARY KEY (faixa)
);

INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (1, 'Fernando', 1400, 'TI');
INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (2, 'Guilherme', 2500, 'Jurídico');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('João', 1800, 'Financeiro'); /* ID foi auto incrementado */
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Isabela', 2200, 'Marketing'); /* ID foi auto incrementado */

SELECT * FROM funcionarios;
SELECT * FROM funcionarios WHERE salario > 2000;
SELECT nome AS 'Funcionário', salario FROM funcionarios f WHERE f.salario > 2000; /* funcionarios f, f é o apelido */
SELECT * FROM funcionarios WHERE nome = "João";
SELECT * FROM veiculos;
SELECT * FROM salarios;

SELECT * FROM funcionarios WHERE nome = "Guilherme"
UNION
SELECT * FROM funcionarios WHERE id = 3;

SELECT * FROM funcionarios WHERE nome = "Guilherme"
UNION ALL
SELECT * FROM funcionarios WHERE id = 2;

SET SQL_SAFE_UPDATES = 0;
UPDATE funcionarios SET salario = salario * 1.1;
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);
DELETE FROM funcionarios WHERE id = 4;
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES(1, 'Carro', 'SB-0001');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES(1, 'Carro', 'SB-0002');
UPDATE veiculos SET funcionario_id = 3 WHERE id= 2;
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 1000, 2000);
INSERT INTO salarios (faixa, inicio, fim) VAlues ('Analista Pleno', 2000, 4000);

SET SQL_SAFE_UPDATES = 1;
