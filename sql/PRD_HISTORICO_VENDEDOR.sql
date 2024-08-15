IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'PRD_HISTORICO_VENDEDOR')
DROP PROCEDURE PRD_HISTORICO_VENDEDOR
GO

CREATE PROCEDURE PRD_HISTORICO_VENDEDOR
@CODIGO_VENDEDOR INT
AS

-- CRIE A TABELA TEMPOR�RIA
CREATE TABLE #TEMPMESES (
  MES DATE
)

-- PREENCHA A TABELA TEMPOR�RIA COM OS MESES
DECLARE @STARTDATE DATE = DATEADD(MONTH, -13, GETDATE())
DECLARE @ENDDATE DATE = GETDATE()
WHILE @STARTDATE <= @ENDDATE
BEGIN
  INSERT INTO #TEMPMESES (MES) VALUES (@STARTDATE)
  SET @STARTDATE = DATEADD(MONTH, 1, @STARTDATE)
END

DECLARE @DATA_INICIAL DATE
DECLARE @DATA_FINAL DATE
DECLARE @ANO VARCHAR(4)
DECLARE @MES VARCHAR(2)

--PEGA O M�S ATUAL E O ANO ANTERIOR A DATA DO DIA DA CONSULTA
SET @ANO = (SELECT(YEAR(GETDATE())-1))
SET @MES = (SELECT(MONTH(GETDATE())))

SET @DATA_INICIAL = (SELECT CONVERT(DATE, @ANO+'-'+@MES+'-'+'01', 23))

SET @DATA_FINAL = (SELECT EOMONTH(GETDATE()))


SELECT ISNULL(SUM(VW.TOTAL_VENDA), 0) AS TOTAL_VENDA,
	   MONTH(T.MES) AS MES,
	   YEAR(T.MES) AS ANO
FROM #TEMPMESES T LEFT JOIN VW_VENDAS_POR_VENDEDOR VW
	 ON MONTH(T.MES) = MONTH(VW.DATA) AND
	    YEAR(T.MES) = YEAR(VW.DATA) AND
		VW.CODIGO_VENDEDOR = @CODIGO_VENDEDOR
WHERE T.MES BETWEEN @DATA_INICIAL AND @DATA_FINAL 
GROUP BY YEAR(T.MES), MONTH(T.MES)
ORDER BY YEAR(T.MES), MONTH(T.MES)

DROP TABLE #TEMPMESES;
