USE bd_concessionaria

DROP PROCEDURE SP_OLTP_FABRICANTE

CREATE OR ALTER PROCEDURE SP_OLTP_FABRICANTE(@DATA_CARGA DATETIME)
AS
BEGIN
		DELETE FROM TB_AUX_FABRICANTE WHERE @DATA_CARGA= DATA_CARGA

		INSERT TB_AUX_FABRICANTE (DATA_CARGA, ID_FABRICANTE, NOME, CNPJ, ESTADO)
		SELECT @DATA_CARGA, COD_FABRICANTE, NOME,CNPJ,ESTADO
		FROM TB_FABRICANTE

		END
EXEC SP_OLTP_FABRICANTE '20220101'
SELECT * FROM TB_AUX_FABRICANTE