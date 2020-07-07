-- Programe o código SQL necessário para gerar a estrutura do banco de dados criado
-- no módulo Normalização de Dados (Formas Normais).
-- 
-- Observação: Não é necessário criar o código que popula as tabelas, pois este é o 
-- tema do próximo módulo.

--
-- Cria o banco de dados e acessa o mesmo
--
CREATE DATABASE SOFTBLUE DEFAULT CHARSET=latin1;
USE SOFTBLUE;

--
-- Cria a tabela TIPO
--
CREATE TABLE TIPO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	TIPO VARCHAR(32) NOT NULL,				-- Descrição
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela INSTRUTOR
--
CREATE TABLE INSTRUTOR (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	INSTRUTOR VARCHAR(64) NOT NULL,				-- Nome com até 64 caracteres
	TELEFONE VARCHAR(9) NULL,				-- Telefone, podendo ser nulo caso não tenha
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela CURSO
--
CREATE TABLE CURSO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	CURSO VARCHAR(64) NOT NULL,				-- Título com até 64 caracteres
	TIPO INTEGER UNSIGNED NOT NULL,				-- Código do tipo de curso (idêntico a PK em CURSO)
	INSTRUTOR INTEGER UNSIGNED NOT NULL,			-- Código do instrutor (idêntico a PK em INSTRUTOR)
	VALOR DOUBLE NOT NULL,					-- Valor do curso
	PRIMARY KEY(CODIGO),					-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_TIPO(TIPO),					-- Define o campo TIPO como um índice
	INDEX FK_INSTRUTOR(INSTRUTOR),				-- Define o campo INSTRUTOR como um índice
	FOREIGN KEY(TIPO) REFERENCES TIPO(CODIGO),		-- Cria o relacionamento (FK) com a tabela TIPO
	FOREIGN KEY(INSTRUTOR) REFERENCES INSTRUTOR(CODIGO)	-- Cria o relacionamento (FK) com a tabela INSTRUTOR
);								

--
-- Cria a tabela ALUNO
--
CREATE TABLE ALUNO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO VARCHAR(64) NOT NULL,				-- Nome com até 64 caracteres
	ENDERECO VARCHAR(230) NOT NULL,				-- Endereço com até 230 caracteres
	EMAIL VARCHAR(128) NOT NULL,				-- E-mail com até 128 caracteres
	PRIMARY KEY(CODIGO)					-- Define o campo CODIGO como PK (Primary Key)
);

--
-- Cria a tabela PEDIDO
--
CREATE TABLE PEDIDO (
	CODIGO INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,	-- Código interno (PK)
	ALUNO INTEGER UNSIGNED NOT NULL,			-- Código do aluno (idêntico a PK em ALUNO)
	DATAHORA DATETIME NOT NULL,				-- Armazena data e hora em uma única coluna
	PRIMARY KEY(CODIGO),					-- Define o campo CODIGO como PK (Primary Key)
	INDEX FK_ALUNO(ALUNO),					-- Define o campo ALUNO como um índice
	FOREIGN KEY(ALUNO) REFERENCES ALUNO(CODIGO)		-- Cria o relacionamento (FK) com a tabela ALUNO
);

--
-- Cria a tabela PEDIDO_DETALHE
--
CREATE TABLE PEDIDO_DETALHE (
	PEDIDO INTEGER UNSIGNED NOT NULL,			-- Código do pedido (idêntico a PK em PEDIDO)
	CURSO INTEGER UNSIGNED NOT NULL,			-- Código do curso (idêntico a PK em CURSO)
	VALOR DOUBLE NOT NULL,					-- Valor do curso
	INDEX FK_PEDIDO(PEDIDO),				-- Define o campo ALUNO como um índice
	INDEX FK_CURSO(CURSO),					-- Define o campo ALUNO como um índice
	PRIMARY KEY(PEDIDO, CURSO),				-- Define a chave primária composta
	FOREIGN KEY(PEDIDO) REFERENCES PEDIDO(CODIGO),		-- Cria o relacionamento (FK) com a tabela PEDIDO
	FOREIGN KEY(CURSO) REFERENCES CURSO(CODIGO)		-- Cria o relacionamento (FK) com a tabela CURSO
);


 
INSERT INTO TIPO VALUES (1, 'Banco de Dados');
INSERT INTO TIPO VALUES (2, 'Programação');
INSERT INTO TIPO VALUES (3, 'Modelagem de dados');

INSERT INTO INSTRUTOR (INSTRUTOR, TELEFONE) VALUES ('André Milani', '1111-1111');
INSERT INTO INSTRUTOR (INSTRUTOR, TELEFONE) VALUES ('Carlos Tosin', '1212-1212');

INSERT INTO CURSO (CURSO, TIPO, INSTRUTOR, VALOR) VALUES ('Java Fundamentos', 2, 2, 270);
INSERT INTO CURSO (CURSO, TIPO, INSTRUTOR, VALOR) VALUES ('Java Avançado', 2, 2, 330);
INSERT INTO CURSO (CURSO, TIPO, INSTRUTOR, VALOR) VALUES ('SQL Completo', 1, 1, 170);
INSERT INTO CURSO (CURSO, TIPO, INSTRUTOR, VALOR) VALUES ('PHP Básico', 2, 1, 270);

INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL) VALUES ("José", "Rua XV de Novembro 72", "jose@softblue.com.br");
INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL) VALUES ("Wagner", "Av. Paulista", "wagner@softblue.com.br");
INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL) VALUES ("Emílio", "Rua Lajes 103, ap: 701"," emilio@softblue.com.br");
INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL) VALUES ("Cris", "Rua Tauney 22", "cris@softblue.com.br");
INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL) VALUES ("Regina", " Rua Salles 305", "regina@softblue.com.br");
INSERT INTO ALUNO (ALUNO, ENDERECO, EMAIL) VALUES ("Fernando", "Av. Central 30", "fernando@softblue.com.br");

INSERT INTO PEDIDO (CODIGO, ALUNO, DATAHORA) VALUES (1, 2, '2010-04-15 11:23:32');
INSERT INTO PEDIDO VALUES (2, 2, '2010-04-15 14:36:21');
INSERT INTO PEDIDO VALUES (3, 3, '2010-04-16 11:17:45');
INSERT INTO PEDIDO VALUES (4, 4, '2010-04-17 14:27:22');
INSERT INTO PEDIDO VALUES (5, 5, '2010-04-18 11:18:19');
INSERT INTO PEDIDO VALUES (6, 6, '2010-04-19 13:47:35');
INSERT INTO PEDIDO VALUES (7, 6, '2010-04-20 18:13:44');

INSERT INTO PEDIDO_DETALHE (PEDIDO, CURSO, VALOR) VALUES (1, 1, 270);
INSERT INTO PEDIDO_DETALHE VALUES (1, 2, 330);
INSERT INTO PEDIDO_DETALHE VALUES (2, 1, 270);
INSERT INTO PEDIDO_DETALHE VALUES (2, 2, 330);
INSERT INTO PEDIDO_DETALHE VALUES (2, 3, 170);
INSERT INTO PEDIDO_DETALHE VALUES (3, 4, 270);
INSERT INTO PEDIDO_DETALHE VALUES (4, 2, 330);
INSERT INTO PEDIDO_DETALHE VALUES (4, 4, 270);
INSERT INTO PEDIDO_DETALHE VALUES (5, 3, 170);
INSERT INTO PEDIDO_DETALHE VALUES (6, 3, 170);
INSERT INTO PEDIDO_DETALHE VALUES (7, 4, 270);

SELECT * FROM ALUNO;
SELECT CURSO FROM CURSO;
SELECT CURSO, VALOR FROM CURSO WHERE VALOR > 200;
SELECT CURSO, VALOR FROM CURSO WHERE VALOR > 200 AND VALOR < 300;
SELECT CURSO, VALOR FROM CURSO WHERE VALOR BETWEEN 200 AND 300;
SELECT * FROM PEDIDO WHERE DATAHORA BETWEEN '2010-04-15 00:00:01' AND '2010-04-18 23:59:59';
SELECT * FROM PEDIDO WHERE DATE(DATAHORA) = '2010-04-15';


UPDATE ALUNO SET ENDERECO = "Av. Brasil 778" WHERE ALUNO='José';
UPDATE ALUNO SET EMAIL = 'cristiano@softblue.com.br' WHERE ALUNO='Cris';

UPDATE CURSO SET VALOR = ROUND(VALOR * 1.1, 2) WHERE VALOR < 300;
UPDATE CURSO SET CURSO = "Php Fundamentos" WHERE CODIGO = 4;


SELECT * FROM ALUNO;
SELECT * FROM CURSO;