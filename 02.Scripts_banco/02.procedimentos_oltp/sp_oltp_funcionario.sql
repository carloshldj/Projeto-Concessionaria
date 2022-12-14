
USE bd_concessionaria

DROP PROCEDURE SP_OLTP_FUNCIONARIO

CREATE OR ALTER PROCEDURE SP_OLTP_FUNCIONARIO(@DATA_CARGA DATETIME) 
AS 
BEGIN
     DELETE FROM TB_AUX_FUNCIONARIO WHERE @DATA_CARGA = DATA_CARGA

     INSERT INTO TB_AUX_FUNCIONARIO (DATA_CARGA, ID_FUNCIONARIO, FUNCIONARIO, ID_CARGO, CARGO)
	 SELECT @DATA_CARGA, F.COD_FUNCIONARIO, F.NOME, C.COD_CARGO, C.NM_CARGO
	 FROM TB_CARGO C JOIN TB_FUNCIONARIO F 
	 ON(C.COD_CARGO = F.COD_CARGO) 
END

EXEC SP_OLTP_FUNCIONARIO '20220101'

SELECT * FROM TB_AUX_FUNCIONARIO

