-- SCRIPTS DDL PARA O AMBIENTE OPERACIONAL
USE bd_concessionaria

DROP TABLE IF EXISTS TB_VEICULO
DROP TABLE IF EXISTS TB_FABRICANTE
DROP TABLE IF EXISTS TB_CLIENTE
DROP TABLE IF EXISTS TB_LOJA
DROP TABLE IF EXISTS TB_VENDA
DROP TABLE IF EXISTS TB_TIPO_PAGAMENTO
DROP TABLE IF EXISTS TB_LOJA_TB_FUNCIONARIO
DROP TABLE IF EXISTS TB_FUNCIONARIO
DROP TABLE IF EXISTS TB_CARGO
DROP TABLE IF EXISTS TB_CIDADE
DROP TABLE IF EXISTS TB_ESTADO


CREATE TABLE TB_ESTADO (
	COD_ESTADO INT NOT NULL PRIMARY KEY,
	ESTADO VARCHAR(100) NOT NULL,
	SIGLA VARCHAR(2) NOT NULL
)

INSERT INTO TB_ESTADO VALUES (01, 'ALAGOAS', 'AL')
INSERT INTO TB_ESTADO VALUES (02, 'BAHIA', 'BA')
INSERT INTO TB_ESTADO VALUES (03, 'CEARA', 'CE')
INSERT INTO TB_ESTADO VALUES (04, 'MARANHAO', 'MA')
INSERT INTO TB_ESTADO VALUES (05, 'PARAIBA', 'PB')
INSERT INTO TB_ESTADO VALUES (06, 'PERNAMBUCO', 'PE')
INSERT INTO TB_ESTADO VALUES (07, 'PIAUI', 'PI')
INSERT INTO TB_ESTADO VALUES (08, 'RIO GRANDE DO NORTE', 'RN')
INSERT INTO TB_ESTADO VALUES (09, 'SERGIPE', 'SE') 

CREATE TABLE TB_CIDADE (
	COD_CIDADE INT NOT NULL PRIMARY KEY,
	CIDADE VARCHAR(100) NOT NULL,
	COD_ESTADO INT NOT NULL
	CONSTRAINT FK_ESTADO FOREIGN KEY (COD_ESTADO) REFERENCES TB_ESTADO (COD_ESTADO)
)

INSERT INTO TB_CIDADE VALUES (0001, 'MACEIO', 01)
INSERT INTO TB_CIDADE VALUES (0002, 'SALVADOR', 02)
INSERT INTO TB_CIDADE VALUES (0003, 'FORTALEZA', 03)
INSERT INTO TB_CIDADE VALUES (0004, 'SAO LUIS', 04)
INSERT INTO TB_CIDADE VALUES (0005, 'JOAO PESSOA', 05)
INSERT INTO TB_CIDADE VALUES (0006, 'RECIFE', 06)
INSERT INTO TB_CIDADE VALUES (0007, 'TERESINA', 07)
INSERT INTO TB_CIDADE VALUES (0008, 'NATAL', 08)
INSERT INTO TB_CIDADE VALUES (0009, 'ARACAJU', 09)

CREATE TABLE TB_CARGO (
    COD_CARGO INT NOT NULL PRIMARY KEY,
	NM_CARGO VARCHAR(100) NOT NULL
)
INSERT INTO TB_CARGO VALUES	
							(1, 'GERENTE'),
							(2, 'VENDEDOR'),
							(3, 'SECRETARIO')


CREATE TABLE TB_FUNCIONARIO (
 	COD_FUNCIONARIO INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	COD_CARGO INT NOT NULL
	CONSTRAINT FK_CARGO FOREIGN KEY (COD_CARGO) REFERENCES TB_CARGO (COD_CARGO)
)

INSERT INTO TB_FUNCIONARIO 
VALUES	('JOS� FRANCISCO','francisco@gmail.com',2),
		('JOSE CARLOS','josecarlos@gmail.com',2),
		('JOAO BATISTA','joao2022@gmail.com',2),
		('ANTONIO HENRIQUE','henriqueantonio@gmail.com',2),
		('MANOEL CARLOS','manoel@gmail.com',1),
		('ROBSON MACHADO','robson@gmail.com',3)
		



CREATE TABLE TB_LOJA (
	COD_LOJA INT NOT NULL PRIMARY KEY,
	LOJA VARCHAR(50) NOT NULL,
	COD_CIDADE INT NOT NULL,
	CONSTRAINT FK_CIDADE FOREIGN KEY (COD_CIDADE) REFERENCES TB_CIDADE (COD_CIDADE),
	COD_GERENTE INT NOT NULL,
	CONSTRAINT FK_GERENTE FOREIGN KEY (COD_GERENTE) REFERENCES TB_FUNCIONARIO (COD_FUNCIONARIO)
)

INSERT INTO TB_LOJA
VALUES	(1,'CCJ CONCESSIONARIA',0001,1)
		



CREATE TABLE TB_CLIENTE (
	COD_CLIENTE INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
	CPF VARCHAR(11) NOT NULL,
	TELEFONE VARCHAR(9) NOT NULL,
	ENDERECO VARCHAR(100) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	COD_LOJA INT NOT NULL
	CONSTRAINT FK_LOJA FOREIGN KEY (COD_LOJA) REFERENCES TB_LOJA (COD_LOJA)
)

INSERT INTO TB_CLIENTE(NOME,CPF,TELEFONE,ENDERECO,EMAIL,COD_LOJA)
VALUES ('CHARLES', '08254335508', '999082332','RUA SAUDALINA SANTANA FERREIRA', 'charlees.dayan@gmail.com',1),
		('JORGE', '06149439577', '998062240','RUA MIGUEL ALVES DOS SANTOS', 'jorge@gmail.com',1),
		('CARLOS', '06339449532', '998567942','RUA PROFESSOR LIMA JUNIOR', 'carlos@gmail.com',1),
		('MARCOS', '96149432154', '993063245','RUA DA TABOCA', 'marcosmachado@gmail.com',1),
		('ARTHUR', '65144533465', '994064580','RUA ALPHA VILLE', 'arthur@gmail.com',1),
		('MATHEUS', '34101535565', '933268956','RUA JOSEFA ','matheus@gmail.com',1),
		('HENRIQUE','33245565456', '998459930','RUA MANOEL FRANCISCO TELES', 'henrique@gmail.com',1),
		('JOAO','92254545611', '999452334','RUA ROTARY CLUBE', 'joao@gmail.com',1)
		





CREATE TABLE TB_FABRICANTE (
	COD_FABRICANTE INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(100) NOT NULL,
	CNPJ VARCHAR(45) NOT NULL,
	ESTADO VARCHAR(100) NOT NULL
)
INSERT INTO TB_FABRICANTE VALUES ('CHEVROLET', '68841262000112','SERGIPE')
INSERT INTO TB_FABRICANTE VALUES ('FIAT', '56154215000111', 'BAHIA')
INSERT INTO TB_FABRICANTE VALUES ('WOLKSVAGEN', '55788514000145', 'PARAIBA')
INSERT INTO TB_FABRICANTE VALUES ('TOYOTA', '53428412000125', 'PIAUI')
INSERT INTO TB_FABRICANTE VALUES ('FORD', '34123352000341', 'MARANH�O')



CREATE TABLE TB_VEICULO (
	COD_VEICULO INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	NOME VARCHAR(45) NOT NULL,
	ANO_FABRICACAO VARCHAR(10) NOT NULL,
	MODELO VARCHAR(45) NOT NULL,
	PRECO NUMERIC(10,2) NOT NULL,
	PLACA VARCHAR(8),
	COD_FABRICANTE INT NOT NULL
	CONSTRAINT FK_FABRICANTE FOREIGN KEY (COD_FABRICANTE) REFERENCES TB_FABRICANTE (COD_FABRICANTE),
	COD_LOJA INT NOT NULL
	CONSTRAINT FK_LOJAA FOREIGN KEY (COD_LOJA) REFERENCES TB_LOJA (COD_LOJA)
)

INSERT INTO TB_VEICULO VALUES ('CORSA', '2005', 'CLASSIC', 20000.00, 'MUE-3429', 1,1)
INSERT INTO TB_VEICULO VALUES ('ARGO', '2020', 'TRACKER', 70000.00, 'EJE-3926', 2,1)
INSERT INTO TB_VEICULO VALUES ('GOLF', '2021', 'GTI', 20000.00, 'EUA-6969', 3,1)
INSERT INTO TB_VEICULO VALUES ('COROLLA', '2018', 'CROSS', 80000.00, 'AIO-6469', 4,1)
INSERT INTO TB_VEICULO VALUES ('ECOSPORT', '2014', 'FREESTYLE', 35000.00, 'OEL-1509', 5,1)
INSERT INTO TB_VEICULO VALUES ('TORO', '2020', 'ULTRA', 95000.00, 'JEL-4419', 2,1)
INSERT INTO TB_VEICULO VALUES ('JETTA','2019','COMFORTLINE', 80000.00, 'AOK-1554',3,1)
INSERT INTO TB_VEICULO VALUES ('ONIX','2021','PLUS', 75000.00, 'JDK-3305',1,1)
INSERT INTO TB_VEICULO VALUES ('RANGER','2022','XLS',140000.00,'KLU-1104',5,1)
INSERT INTO TB_VEICULO VALUES ('POLLO','2020','GTA',72000.00,'AOL-1598',3,1)
INSERT INTO TB_VEICULO VALUES ('SW4','2018','SRX',180000.00,'QAU-9905',4,1)
INSERT INTO TB_VEICULO VALUES ('CRUZE','2021','PREMIER',95000.00,'JDA-5509',1,1)


CREATE TABLE TB_LOJA_TB_FUNCIONARIO (
	COD_LOJA INT NOT NULL,
	COD_FUNCIONARIO INT NOT NULL,
	PRIMARY KEY (COD_LOJA, COD_FUNCIONARIO),
	CONSTRAINT FK_LOJA_FUNC_LOJA FOREIGN KEY (COD_LOJA) REFERENCES TB_LOJA (COD_LOJA),
	CONSTRAINT FK_LOJA_FUNC_FUNC FOREIGN KEY (COD_FUNCIONARIO) REFERENCES TB_FUNCIONARIO (COD_FUNCIONARIO)
)

INSERT INTO TB_LOJA_TB_FUNCIONARIO
VALUES  (1,1),
		(1,2),
		(1,3)


CREATE TABLE TB_TIPO_PAGAMENTO (
	COD_TIPO_PAGAMENTO INT NOT NULL PRIMARY KEY,
	TIPO_PAGAMENTO VARCHAR(100) NOT NULL
)

INSERT INTO TB_TIPO_PAGAMENTO VALUES (1, 'FINANCIADO')
INSERT INTO TB_TIPO_PAGAMENTO VALUES (2, 'CARTAO')
INSERT INTO TB_TIPO_PAGAMENTO VALUES (3, 'PIX')

CREATE TABLE TB_VENDA (
	COD_VENDA BIGINT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	DATA_VENDA DATETIME NOT NULL,
	VALOR NUMERIC(10,2),
	COD_LOJA INT NOT NULL,
	COD_TIPO_PAGAMENTO INT NOT NULL,
	COD_VEICULO INT NOT NULL,
	COD_FUNCIONARIO INT NOT NULL,
	CONSTRAINT FK_LOJA_VENDA FOREIGN KEY (COD_LOJA) REFERENCES TB_LOJA (COD_LOJA),
	CONSTRAINT FK_TIPO_PAGAMENTO FOREIGN KEY (COD_TIPO_PAGAMENTO) REFERENCES TB_TIPO_PAGAMENTO (COD_TIPO_PAGAMENTO),
	CONSTRAINT FK_VEICULO FOREIGN KEY (COD_VEICULO) REFERENCES TB_VEICULO (COD_VEICULO),
	CONSTRAINT FK_FUNCIONARIO FOREIGN KEY (COD_FUNCIONARIO) REFERENCES TB_FUNCIONARIO(COD_FUNCIONARIO)
)

INSERT INTO TB_VENDA
VALUES  ('20220102',74000.00,1,1,5,2),
		('20220110',90000.00,1,2,7,2),
		('20220119',70000.00,1,3,2,1),
		('20220130',35000.00,1,1,3,3),
		('20220201',21000.00,1,2,1,1),
		('20220209',30000.00,1,2,3,1),
		('20220214',95000.00,1,3,6,2),
		('20220222',27000.00,1,1,1,2),
		('20220302',105000.00,1,1,4,2),
		('20220315',33000.00,1,3,5,3),
		('20220321',77000.00,1,3,4,3),
		('20220330',80000.00,1,3,4,2),
		('20220406',95000.00,1,1,8,4),
		('20220413',35000.00,1,1,3,2),
		('20220423',110000.00,1,1,6,1),
		('20220427',70000.00,1,3,2,2),
		('20220501',80000.00,1,1,4,2),
		('20220510',70000.00,1,3,8,4),
		('20220514',70000.00,1,1,5,2),
		('20220530',105000.00,1,1,4,2),
		('20220614',27000.00,1,1,1,2),
		('20220625',11000.00,1,1,6,1),
		('20220629',95000.00,1,3,12,2),
		('20220710',160000.0,1,1,9,1),
		('20220718',85000.0,1,2,10,1),
		('20220725',95000.0,1,2,7,2),
		('20220730',35000.0,1,1,5,4),
		('20220804',10000.00,1,1,6,4),
		('20220808',30000.00,1,2,1,2),
		('20220820',150000.00,1,2,9,2),
		('20220829',200000.00,1,1,11,1),
		('20220901',72000.00,1,3,9,1),
		('20220913',70000.00,1,1,5,2),
		('20220921',35000.00,1,1,1,1),
		('20220930',150000.00,1,1,9,2),
		('20221010',105000.00,1,2,12,2),
		('20221018',850000.00,1,1,10,4),
		('20221021',95000.00,1,3,6,1),
		('20221111',75000.00,1,3,8,2),
		('20221115',70000.00,1,3,2,2),
		('20221120',90000.00,1,2,4,2),
		('20221125',180000.00,1,3,12,1)


SELECT * FROM TB_CIDADE
SELECT * FROM TB_ESTADO
SELECT * FROM TB_FABRICANTE
SELECT * FROM TB_CLIENTE
SELECT * FROM TB_VEICULO
SELECT * FROM TB_FUNCIONARIO
SELECT * FROM TB_LOJA
SELECT * FROM TB_LOJA_TB_FUNCIONARIO
SELECT * FROM TB_CARGO
SELECT * FROM TB_TIPO_PAGAMENTO
SELECT * FROM TB_VENDA