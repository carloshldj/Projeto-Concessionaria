USE bd_concessionaria

CREATE OR ALTER PROCEDURE SP_DIM_TIPO_PAGAMENTO
AS BEGIN
        INSERT INTO DIM_TIPO_PAGAMENTO(ID_TIPO_PAGAMENTO, TIPO_PAGAMENTO)
		SELECT ID_TIPO_PAGAMENTO, TIPO_PAGAMENTO
		FROM TB_AUX_TIPO_PAGAMENTO
END

EXEC SP_DIM_TIPO_PAGAMENTO

SELECT * FROM DIM_TIPO_PAGAMENTO