IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'PR_CALCULA_LUCRO')
DROP PROCEDURE PR_CALCULA_LUCRO
GO

CREATE PROCEDURE PR_CALCULA_LUCRO
@DATA_INICIO DATE,
@DATA_FINAL DATE
AS

SELECT (SUM(TOTAL) - SUM(CUSTO)) AS LUCRO 
FROM VW_TOTAL_VENDAS_COM_CUSTO
WHERE DATA BETWEEN @DATA_INICIO AND @DATA_FINAL

