USE curso_sql;

SELECT * FROM funcionarios;

SELECT COUNT(*) FROM funcionarios;
SELECT COUNT(*) FROM funcionarios WHERE salario > 2000 AND departamento = 'Financeiro';

SELECT SUM(salario) FROM funcionarios;
SELECT SUM(salario) FROM funcionarios WHERE departamento = "TI";

SELECT AVG(salario) FROM funcionarios;

SELECT DISTINCT(departamento) from funcionarios;

SELECT * FROM funcionarios ORDER BY salario;
SELECT * FROM funcionarios ORDER BY salario DESC;

SELECT * FROM funcionarios ORDER BY departamento DESC, salario DESC;

SELECT * FROM funcionarios LIMIT 2 OFFSET 2;
SELECT * FROM funcionarios LIMIT 1, 2; /* pula 1 e mostre até 2 */

SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 1700;
SELECT departamento, count(*) FROM funcionarios GROUP BY departamento;

SELECT nome FROM funcionarios WHERE departamento IN ('TI', 'Financeiro');

SELECT nome FROM funcionarios WHERE departamento IN (
SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 2000);

SELECT * FROM funcionarios;