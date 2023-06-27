IF EXISTS (SELECT COUNT(*) FROM SYS.ALL_VIEWS WHERE TYPE = 'V' AND NAME = 'VW_CONTAS_RECEBER')
DROP VIEW VW_CONTAS_RECEBER
GO
CREATE VIEW VW_CONTAS_RECEBER
AS
SELECT TI_ID,
	   SUM(TI_SD) AS SALDO,
	   TI_DTVENC AS DATA_VENCIMENTO,
	   TI_DTEMIS AS DATA_EMISSAO,
	   DC_ID,
	   LJ_ID
FROM FIN_TI
WHERE TI_SD > 0 AND
	  TI_DTCANC IS NULL
GROUP BY TI_ID,TI_DTVENC,TI_DTEMIS, DC_ID,LJ_ID

