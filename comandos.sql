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


