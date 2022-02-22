CREATE DATABASE exviewjavaservletsonibus
GO
USE exviewjavaservletsonibus

CREATE TABLE motorista (
codigo			INT				NOT NULL,
nome			VARCHAR(40)		NOT NULL,
naturalidade	VARCHAR(40)		NOT NULL
PRIMARY KEY (codigo)
)

CREATE TABLE onibus (
placa			CHAR(7)			NOT NULL,
marca			VARCHAR(15)		NOT NULL,
ano				INT				NOT NULL,
descricao		VARCHAR(20)		NOT NULL
PRIMARY KEY (placa)
)

CREATE TABLE viagem (
codigo			INT				NOT NULL,
onibus			CHAR(7)			NOT NULL,
motorista		INT				NOT NULL,
hora_saida		INT				NOT NULL	CHECK(hora_saida >= 0),
hora_chegada	INT				NOT NULL	CHECK(hora_chegada >= 0),
partida			VARCHAR(40)		NOT NULL,
destino			VARCHAR(40)		NOT NULL
PRIMARY KEY (codigo) 
FOREIGN KEY (onibus) REFERENCES onibus(placa),
FOREIGN KEY (motorista) REFERENCES motorista(codigo)
)

INSERT INTO motorista VALUES (12341,'Julio Cesar','São Paulo')
INSERT INTO motorista VALUES (12342,'Mario Carmo','Americana')
INSERT INTO motorista VALUES (12343,'Lucio Castro','Campinas')
INSERT INTO motorista VALUES (12344,'André Figueiredo','São Paulo')
INSERT INTO motorista VALUES (12345,'Luiz Carlos','São Paulo')
INSERT INTO motorista VALUES (12346,'Carlos Roberto','Campinas')
INSERT INTO motorista VALUES (12347,'João Paulo','São Paulo')
INSERT INTO onibus VALUES ('adf0965','Mercedes',2009,'Leito')
INSERT INTO onibus VALUES ('bhg7654','Mercedes',2012,'Sem Banheiro')
INSERT INTO onibus VALUES ('dtr2093','Mercedes',2017,'Ar Condicionado')
INSERT INTO onibus VALUES ('gui7625','Volvo',2014,'Ar Condicionado')
INSERT INTO onibus VALUES ('jhy9425','Volvo',2018,'Leito')
INSERT INTO onibus VALUES ('lmk7485','Mercedes',2015,'Ar Condicionado')
INSERT INTO onibus VALUES ('aqw2374','Volvo',2014,'Leito')
INSERT INTO viagem VALUES (101,'adf0965',12343,10,12,'São Paulo','Campinas')
INSERT INTO viagem VALUES (102,'gui7625',12341,7,12,'São Paulo','Araraquara')
INSERT INTO viagem VALUES (103,'bhg7654',12345,14,22,'São Paulo','Rio de Janeiro')
INSERT INTO viagem VALUES (104,'dtr2093',12344,18,21,'São Paulo','Sorocaba')
INSERT INTO viagem VALUES (105,'aqw2374',12342,11,17,'São Paulo','Ribeirão Preto')
INSERT INTO viagem VALUES (106,'jhy9425',12347,10,19,'São Paulo','São José do Rio Preto')
INSERT INTO viagem VALUES (107,'lmk7485',12346,13,20,'São Paulo','Curitiba')
INSERT INTO viagem VALUES (108,'adf0965',12343,14,16,'Campinas','São Paulo')
INSERT INTO viagem VALUES (109,'gui7625',12341,14,19,'Araraquara','São Paulo')
INSERT INTO viagem VALUES (110,'bhg7654',12345,0,8,'Rio de Janeiro','São Paulo')
INSERT INTO viagem VALUES (111,'dtr2093',12344,22,1,'Sorocaba','São Paulo')
INSERT INTO viagem VALUES (112,'aqw2374',12342,19,5,'Ribeirão Preto','São Paulo')
INSERT INTO viagem VALUES (113,'jhy9425',12347,22,7,'São José do Rio Preto','São Paulo')
INSERT INTO viagem VALUES (114,'lmk7485',12346,0,7,'Curitiba','São Paulo')

SELECT * FROM motorista
SELECT * FROM onibus
SELECT * FROM viagem

CREATE VIEW v_motorista_onibus
AS
SELECT CAST(codigo AS VARCHAR(7)) AS id, nome 
FROM motorista
UNION
SELECT placa AS id, marca AS nome
FROM onibus

SELECT * FROM v_motorista_onibus

CREATE VIEW v_descricao_onibus
AS
SELECT v.codigo, m.nome AS motorista, UPPER(SUBSTRING(o.placa,1,3))+'-'+SUBSTRING(o.placa,4,4) AS placa, o.marca, o.descricao 
FROM viagem v, motorista m, onibus o
WHERE v.onibus = o.placa
	AND v.motorista = m.codigo

SELECT * FROM v_descricao_onibus

CREATE VIEW v_descricao_viagem
AS
SELECT v.codigo, UPPER(SUBSTRING(o.placa,1,3))+'-'+SUBSTRING(o.placa,4,4) AS placa, 
	CASE 
		WHEN(v.hora_saida < 10) 
		THEN '0'+CAST(v.hora_saida AS VARCHAR(1))+':00'
		ELSE CAST(v.hora_saida AS VARCHAR(2))+':00'
	END AS hora_saida,
	CASE 
		WHEN(v.hora_chegada < 10) 
		THEN '0'+CAST(v.hora_chegada AS VARCHAR(1))+':00'
		ELSE CAST(v.hora_chegada AS VARCHAR(2))+':00'
	END AS hora_chegada,
	v.partida, v.destino
FROM viagem v, onibus o
WHERE v.onibus = o.placa

SELECT * FROM v_descricao_viagem

