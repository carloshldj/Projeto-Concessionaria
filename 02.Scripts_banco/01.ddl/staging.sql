-- Scripts ddl para a �rea de staging

USE bd_concessionaria


DROP TABLE IF EXISTS TB_AUX_VEICULO
DROP TABLE IF EXISTS TB_AUX_FABRICANTE
DROP TABLE IF EXISTS TB_AUX_LOJA
DROP TABLE IF EXISTS TB_AUX_FUNCIONARIO
DROP TABLE IF EXISTS TB_AUX_VENDA
DROP TABLE IF EXISTS TB_AUX_TIPO_PAGAMENTO


CREATE TABLE TB_AUX_VEICULO (
   DATA_CARGA DATETIME NOT NULL,
   ID_VEICULO INT NULL,
   VEICULO VARCHAR(45) NULL,
   ID_FABRICANTE INT NULL,
   FABRICANTE VARCHAR(45) NULL
)

CREATE TABLE TB_AUX_FABRICANTE (
	DATA_CARGA DATETIME NOT NULL,
	ID_FABRICANTE INT NULL,
	NOME VARCHAR(45) NULL,
	CNPJ VARCHAR(45) NULL,
	ESTADO VARCHAR(45) NULL
)

CREATE TABLE TB_AUX_LOJA (
	DATA_CARGA DATETIME NOT NULL,
	ID_LOJA INT NULL,
	LOJA VARCHAR(45) NULL,
	GERENTE VARCHAR(45) NULL,
	CIDADE VARCHAR(45) NULL,
	ESTADO VARCHAR(45) NULL
)

CREATE TABLE TB_AUX_FUNCIONARIO (
    DATA_CARGA DATETIME NOT NULL,
	ID_FUNCIONARIO INT NULL,
	FUNCIONARIO VARCHAR(45) NULL,
	ID_CARGO INT NULL,
	CARGO VARCHAR(45) NULL
)

CREATE TABLE TB_AUX_VENDA (
	DATA_CARGA DATETIME NOT NULL,
	DATA_VENDA DATETIME NULL,
	ID_LOJA INT NULL,
	ID_FUNCIONARIO INT NULL,
	ID_VEICULO INT  NULL,
	ID_TIPO_PAGAMENTO INT NULL,
	VALOR NUMERIC(10,2) NULL
)

CREATE TABLE TB_AUX_TIPO_PAGAMENTO (
	DATA_CARGA DATETIME NOT NULL,
	ID_TIPO_PAGAMENTO INT  NULL,
	TIPO_PAGAMENTO VARCHAR(45) NULL
)