--CRIA��O DA TABELA
CREATE TABLE FUNCIONARIOS_NFN (
	ID INT PRIMARY KEY,
	NOME VARCHAR(20),
	CARGO VARCHAR(20),
	TELEFONE1 VARCHAR(11),
	TELEFONE2 VARCHAR(11)
)

--INSER��O DOS DADOS NAS RESPECTIVAS COLUNAS
INSERT INTO FUNCIONARIOS_NFN (ID, NOME, CARGO, TELEFONE1, TELEFONE2)
VALUES	(1, 'Marcos', 'Atendente', '3654589', '36545987'),
		(2, 'Maria', 'Gerente', '3654698', '36524569'),
		(3, 'Julia', 'Atendente', '3654962', '12365458')

--PRIMEIRA FORMA NORMAL (dados at�micos - telefones n�o s�o)
CREATE TABLE FUNCIONARIOS_FN1(
	ID INT PRIMARY KEY,
	NOME VARCHAR(20),
	CARGO VARCHAR(20)
)

CREATE TABLE TELEFONES_FN1(
ID INT REFERENCES FUNCIONARIOS_FN1(ID) NOT NULL ,
TELEFONE VARCHAR(11) NOT NULL,

)

ALTER TABLE TELEFONES_FN1 ADD PRIMARY KEY (ID, TELEFONE)

--TERCEIRA FORMA NORMAL (eliminar campos que n�o dependam da chave)
CREATE TABLE CARGO_FN3(
	ID INT IDENTITY (1,1) PRIMARY KEY, 
	CARGO VARCHAR(20)
)

CREATE TABLE FUNCIONARIO_FN3(
	ID INT PRIMARY KEY,
	NOME VARCHAR(20),
	CARGO_ID INT REFERENCES CARGO_FN3(ID)
)

CREATE TABLE TELEFONE_FN3(
	ID INT REFERENCES FUNCIONARIO_FN3(ID) NOT NULL ,
	TELEFONE VARCHAR(11) NOT NULL
)

ALTER TABLE TELEFONE_FN3 ADD PRIMARY KEY (ID, TELEFONE)

CREATE TABLE TELEFONE2_FN3(
	ID INT REFERENCES FUNCIONARIO_FN3(ID) NOT NULL ,
	TELEFONE VARCHAR(11) NOT NULL 
)

ALTER TABLE TELEFONE2_FN3 ADD PRIMARY KEY (ID, TELEFONE)

--INSERINDO AS INFORMA��ES NAS TABELAS NORMALIZADAS FN3
INSERT INTO CARGO_FN3 VALUES ('Atendente'),('Gerente'),('Atendente')
INSERT INTO FUNCIONARIO_FN3 VALUES (1, 'Marcos', 1),(2, 'Maria', 2),(3, 'Julia', 3)
INSERT INTO TELEFONE_FN3 VALUES (1, '3654589'),(2, '3654698'), (3, '3654962')
INSERT INTO TELEFONE2_FN3 VALUES (1, '36545987'),(2, '36524569'), (3, '12365458')

SELECT * FROM CARGO_FN3
SELECT * FROM FUNCIONARIO_FN3
SELECT * FROM TELEFONE_FN3
SELECT * FROM TELEFONE2_FN3