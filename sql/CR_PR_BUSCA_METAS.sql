IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE TYPE = 'P' AND NAME = 'PR_BUSCA_METAS')
DROP PROCEDURE PR_BUSCA_METAS
GO
CREATE PROCEDURE PR_BUSCA_METAS
@MES INT,
@ANO INT,
@LOJA INT
AS

SELECT CAST(META AS DECIMAL(10,2))  AS META,
	   CAST(SUPER_META AS DECIMAL(10,2)) AS SUPER_META
FROM VW_METAS_LOJA 
WHERE MES = @MES AND
	  ANO = @ANO AND
	  LOJA = @LOJA