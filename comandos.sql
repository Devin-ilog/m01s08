show databases;
create database devinhouse;
use devinhouse
show tables;


CREATE TABLE estados (
	sigla varchar(2), 
	nome varchar(200) not null,
primary key (sigla)
);

CREATE TABLE municipios (
	cod_ibge int, 
	nome varchar(255) not null,
	sigla_uf varchar(2) not null,
	data_fundacao date,
	data_cadastro timestamp not null,
primary key(cod_ibge),
foreign key(sigla_uf) references estados(sigla)
);

CREATE TABLE empregados (
	id_empregado int auto_increment,
	nome varchar(40) not null,
	salario decimal(10,2), 
	funcao varchar(100), 
primary key(id_empregado)
);

INSERT INTO empregados(nome, salario, funcao) VALUES ('James Kirk', '10000', 'Comandante');
INSERT INTO empregados(nome, salario, funcao) VALUES ('Leonard McCoy', '9000', 'Médico');
INSERT INTO empregados(nome, salario, funcao) VALUES ('Montgomeny Scott', '9000', 'Engenheiro');
INSERT INTO empregados(nome, funcao) VALUES ('Spock', 'Oficial de Ciência');


SELECT * FROM empregados;

SELECT * FROM empregados;
SELECT nome, funcao FROM empregados;
SELECT nome as 'Nome do Posto', funcao as 'Posicao na Enterprise' FROM empregados;
SELECT * FROM empregados WHERE nome = 'James Kirk';
SELECT * FROM empregados WHERE salario < 9500;
SELECT * FROM empregados WHERE salario < 9500 AND funcao = 'Médico';  
SELECT * FROM empregados WHERE nome = 'Spock' OR nome like 'Leonard%' OR nome like '%Scott';
SELECT nome FROM empregados WHERE salario IS NULL;
SELECT DISTINCT(salario) FROM empregados;
SELECT DISTINCT(salario) FROM empregados WHERE salario IS NOT NULL;
SELECT * FROM empregados WHERE LOWER(nome) = 'james kirk';
SELECT nome, salario FROM empregados WHERE salario > 2000 ORDER BY salario;
SELECT nome, salario FROM empregados WHERE salario > 2000 ORDER BY salario DESC;


SELECT * FROM empregados;

SELECT nome, funcao FROM empregados;

SELECT nome as 'Nome do Posto', funcao as 'Posicao na Enterprise' FROM empregados;

SELECT * FROM empregados WHERE nome = 'James Kirk';

SELECT * FROM empregados WHERE salario < 9500;

SELECT * FROM empregados WHERE salario < 9500 AND funcao = 'Médico';  

SELECT * FROM empregados WHERE nome = 'Spock' OR nome like 'Leonard%' OR nome like '%Scott';

SELECT nome FROM empregados WHERE salario IS NULL;

SELECT DISTINCT(salario) FROM empregados;

SELECT DISTINCT(salario) FROM empregados WHERE salario IS NOT NULL;

SELECT * FROM empregados WHERE LOWER(nome) = 'james kirk';

SELECT nome, salario FROM empregados WHERE salario > 2000 ORDER BY salario;

SELECT nome, salario FROM empregados WHERE salario > 2000 ORDER BY salario DESC;


DELETE FROM empregados WHERE nome = 'Sulu';


commit;


UPDATE empregados SET salario = 9500 WHERE nome = 'Spock';

UPDATE empregados SET salario = 10500, nome = 'James T. Kirk' WHERE id_empregado = 1;

commit;


-- DESAFIO:

INSERT INTO empregados (nome, funcao, salario) VALUES ('Uhura', 'Oficial de Comunicação', '9200');

INSERT INTO empregados (nome, funcao) VALUES ('Pavel Checkov', 'Navegador');

INSERT INTO empregados (nome) VALUES ('Christopher Pike');


SELECT nome, funcao FROM empregados WHERE nome = 'Uhura';

SELECT nome, salario FROM empregados WHERE SALARIO >= 9000 AND SALARIO <= 9500;

UPDATE empregados SET salario = 9300 where nome = 'Uhura';

UPDATE empregados SET nome = 'Hikary Sulu' WHERE nome = 'Sulu';

DELETE from empregados WHERE nome like '%Pike';


UPDATE empregados SET nome = UPPER(nome) WHERE salario = 9000;

commit;


CREATE TABLE livros (
   isbn varchar(14), 
   titulo varchar(100) not null,
   qtd_paginas int not null,
   ano int, 
   categoria varchar(40) not null,
   preco decimal(5,2) not null,
primary key(isbn)
);


CREATE TABLE autores (
   isbn varchar(14) not null, 
   nome varchar(100) not null, 
primary key(isbn, nome),
foreign key(isbn) references livros(isbn)
);


INSERT INTO livros (isbn, titulo, qtd_paginas, ano, preco, categoria) VALUES ('978-8535933925', 'Sapiens', 472, 2020, 45.43, 'ciência');
INSERT INTO livros (isbn, titulo, qtd_paginas, ano, preco, categoria) VALUES ('978-8535929881', 'Cosmos', 560, 2017, 44.99, 'ciência');
INSERT INTO livros (isbn, titulo, qtd_paginas, ano, preco, categoria) VALUES ('978-8575227244', 'Refatoração', 456, 2020, 109.70, 'tecnologia');
INSERT INTO livros (isbn, titulo, qtd_paginas, ano, preco, categoria) VALUES ('978-8577807000', 'O Programador Pragmático', 344, 2010, 168.00, 'tecnologia');
INSERT INTO livros (isbn, titulo, qtd_paginas, ano, preco, categoria) VALUES ('978-8543004792', 'Java: Como Programar', 968, 2016, 345.80, 'tecnologia');

INSERT INTO autores (isbn, nome) VALUES ('978-8535933925', 'Yuval Noah Harari');
INSERT INTO autores (isbn, nome) VALUES ('978-8535929881', 'Carl Sagan');
INSERT INTO autores (isbn, nome) VALUES ('978-8575227244', 'Martin Fowler');
INSERT INTO autores (isbn, nome) VALUES ('978-8577807000', 'Andrew Hunt');
INSERT INTO autores (isbn, nome) VALUES ('978-8577807000', 'David Thomas');
INSERT INTO autores (isbn, nome) VALUES ('978-8543004792', 'Paul Deitel');
INSERT INTO autores (isbn, nome) VALUES ('978-8543004792', 'Harvey Deitel');


SELECT categoria FROM livros GROUP BY categoria;
SELECT categoria, count(*) FROM livros GROUP BY categoria;
SELECT categoria, SUM(preco) FROM livros GROUP BY categoria ORDER BY SUM(preco) DESC;
SELECT categoria, MAX(preco) FROM livros GROUP BY categoria;

SELECT isbn, count(*) FROM autores GROUP BY isbn;
SELECT isbn, count(*) FROM autores GROUP BY isbn HAVING COUNT(*) > 1;



DROP TABLE IF EXISTS enderecos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id_cliente int auto_increment,
    nome varchar(100) not null, 
primary key(id_cliente)
);

CREATE TABLE enderecos (
    id_endereco int auto_increment,
    rua varchar(100) not null,
    numero int,
    bairro varchar(100),
    cidade varchar(100),
    uf varchar(2), 
    id_cliente int,
primary key(id_endereco),
foreign key(id_cliente) references clientes(id_cliente)
);


INSERT INTO clientes (nome) VALUES ('Harvey Specter');
INSERT INTO clientes (nome) VALUES ('Mike Ross');
INSERT INTO clientes (nome) VALUES ('Donna Paulsen');
INSERT INTO clientes (nome) VALUES ('Louis Litt');
INSERT INTO clientes (nome) VALUES ('Rachel Zane');
INSERT INTO clientes (nome) VALUES ('Jessica Pearson');

INSERT INTO enderecos (rua, numero, cidade, id_cliente) VALUES ('Rua do Harvey', 22, 'São Paulo', (select id_cliente from clientes where nome = 'Harvey Specter'));
INSERT INTO enderecos (rua, numero, cidade, id_cliente) VALUES ('Rua do Mike', 33, 'Florianópolis', (select id_cliente from clientes where nome = 'Mike Ross'));
INSERT INTO enderecos (rua, numero, cidade, id_cliente) VALUES ('Rua da Donna', 44, 'Rio de Janeiro', (select id_cliente from clientes where nome = 'Donna Paulsen'));

INSERT INTO enderecos (rua, numero, cidade) VALUES ('Rua Sem Dono 01', 88, 'Nova York');
INSERT INTO enderecos (rua, numero, cidade) VALUES ('Rua Sem Dono 02', 86, 'Chicago');
INSERT INTO enderecos (rua, numero, cidade) VALUES ('Rua Sem Dono 03', 87, 'Nova Orleans');
INSERT INTO enderecos (rua, numero, cidade) VALUES ('Rua Sem Dono 04', 89, 'Seattle');

commit;


SELECT clientes.id_cliente, nome, id_endereco, rua, numero, cidade   
FROM clientes INNER JOIN enderecos ON clientes.id_cliente = enderecos.id_cliente;

SELECT clientes.id_cliente, nome, id_endereco, rua, numero, cidade   
FROM clientes LEFT JOIN enderecos ON clientes.id_cliente = enderecos.id_cliente;

SELECT clientes.id_cliente, nome, id_endereco, rua, numero, cidade   
FROM clientes RIGHT JOIN enderecos ON clientes.id_cliente = enderecos.id_cliente;

-- DESAFIO

SELECT * FROM livros inner join autores ON livros.isbn = autores.isbn;

SELECT * FROM livros inner join autores ON livros.isbn = autores.isbn
WHERE preco = (select min(preco) from livros);



