
USE bd_concessionaria

DROP PROCEDURE SP_OLTP_LOJA

CREATE OR ALTER PROCEDURE SP_OLTP_LOJA(@DATA_CARGA DATETIME) 
AS 
BEGIN
     DELETE FROM TB_AUX_LOJA WHERE @DATA_CARGA = DATA_CARGA

     INSERT INTO TB_AUX_LOJA (DATA_CARGA, ID_LOJA, LOJA, GERENTE, CIDADE, ESTADO)
	 SELECT @DATA_CARGA, L.COD_LOJA, L.LOJA, F.NOME, C.CIDADE, E.ESTADO
	 FROM TB_LOJA L JOIN TB_FUNCIONARIO F 
	 ON(L.COD_GERENTE = F.COD_FUNCIONARIO) JOIN TB_CIDADE C
	 ON(L.COD_CIDADE = C.COD_CIDADE) JOIN TB_ESTADO E
	 ON(C.COD_ESTADO = E.COD_ESTADO)
END

EXEC SP_OLTP_LOJA '20220101'

SELECT * FROM TB_AUX_LOJA