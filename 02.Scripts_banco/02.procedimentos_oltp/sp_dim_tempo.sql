USE bd_concessionaria


DROP PROCEDURE IF EXISTS SP_INSERT_DIM_TEMPO

CREATE OR ALTER PROCEDURE SP_INSERT_DIM_TEMPO (@dt_inicial DATETIME, @dt_final DATETIME) AS
BEGIN
	set language Brazilian

	DECLARE @MES INT, @ANO INT
	SET @MES = MONTH(@dt_inicial)
	SET @ANO = YEAR(@dt_inicial)

	WHILE(@dt_inicial <= @dt_final)
	BEGIN
		WHILE(@ANO = YEAR(@dt_inicial))
		BEGIN
				WHILE(@MES = MONTH(@dt_inicial))
				BEGIN
					INSERT INTO DIM_TEMPO VALUES 
						('DIA',
						@dt_inicial,
						DAY(@dt_inicial),
						DATENAME(dw,@dt_inicial),
						IIF(DATENAME(dw,@dt_inicial) IN ('Sábado','Domingo'),'SIM','NAO'),
						@MES,
						DATENAME(mm,@dt_inicial),
						DATEPART(qq,@dt_inicial),
						TRIM(STR(DATEPART(qq,@dt_inicial)) + 'º ' + 'Trimestre / '+ TRIM(STR(YEAR(@dt_inicial)))),
						IIF(MONTH(@dt_inicial ) >= 6 ,2,1),
						TRIM(STR(IIF(MONTH(@dt_inicial) >= 6 ,2,1)) + 'º' + 'Semestre / '+ TRIM(STR(YEAR(@dt_inicial)))),
						YEAR(@dt_inicial))
					SET @dt_inicial = DATEADD(dd,1,@dt_inicial)
				END
				INSERT INTO DIM_TEMPO VALUES
									('MES',
									NULL,
									NULL,	
									NULL,
									NULL,
									@MES,
									DATENAME(mm, DATEADD(mm,-1,@dt_inicial)),
									DATEPART(qq,DATEADD(mm,-1,@dt_inicial)),
									TRIM(STR(DATEPART(qq,DATEADD(mm,-1,@dt_inicial))) + 'º ' + 'Trimestre / '+ TRIM(STR(@ANO))),
									IIF(MONTH(DATEADD(mm,-1,@dt_inicial)) >= 6 ,2,1),
									TRIM(STR(IIF(MONTH(DATEADD(mm,-1,@dt_inicial)) >= 6 ,2,1)) + 'º' + 'Semestre /'+ TRIM(STR(@ANO))),
									YEAR(DATEADD(mm,-1,@dt_inicial))
									)
				SET @MES = MONTH(@dt_inicial)
		END
				 INSERT INTO DIM_TEMPO (NIVEL, ANO) VALUES('ANO',@ANO)
				 SET @ANO = YEAR(@dt_inicial)
	END

END

EXEC SP_INSERT_DIM_TEMPO '20220101','20221231'
SELECT * FROM DIM_TEMPO