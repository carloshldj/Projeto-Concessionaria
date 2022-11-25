USE bd_concessionaria

CREATE OR ALTER PROCEDURE SP_DIM_FUNCIONARIO
AS BEGIN
        INSERT INTO DIM_FUNCIONARIO(ID_FUNCIONARIO, NOME_FUNCIONARIO, ID_CARGO, CARGO)
		SELECT ID_FUNCIONARIO, FUNCIONARIO, ID_CARGO, CARGO
		FROM TB_AUX_FUNCIONARIO
END

EXEC SP_DIM_FUNCIONARIO

SELECT * FROM DIM_FUNCIONARIO