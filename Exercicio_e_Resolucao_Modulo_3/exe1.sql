CREATE DATABASE exercicio1;
USE exercicio1;

CREATE TABLE clientes (
	codigo varchar(10) unique not null,
    cliente varchar(50) not null,
    telefone varchar(10) not null,
    saldo float not null default 0,
    PRIMARY KEY (codigo)
);

CREATE TABLE locacoes (
	codigo varchar(10) unique not null, 
    codigo_cliente varchar(10) not null,
	pagamento varchar(20) not null,
    PRIMARY KEY (codigo),
    CONSTRAINT codigo_cliente_loc FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo) 
);

CREATE TABLE filmes (
	codigo varchar(10) unique not null,
    filme varchar(50) not null,
    categoria varchar(20) not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE detalhes (
	codigo varchar(10) unique not null,  
    codigo_filme varchar(10) unique not null
);

