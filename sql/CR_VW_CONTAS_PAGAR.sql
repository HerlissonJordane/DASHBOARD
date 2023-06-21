IF EXISTS (SELECT COUNT(*) FROM SYS.VIEWS WHERE TYPE = 'V' AND NAME = 'VW_CONTAS_PAGAR')
DROP VIEW VW_CONTAS_PAGAR
GO
CREATE VIEW VW_CONTAS_PAGAR
AS
SELECT OB_ID,
	   SUM(OB_SD) AS SALDO,
	   OB_DTVENC AS DATA_VENCIMENTO,
	   OB_DTEMIS AS DATA_EMISSAO,
	   DC_ID,
	   LJ_ID
FROM FIN_OB
WHERE OB_SD > 0 AND
	  OB_DTCANC IS NULL
GROUP BY OB_ID,OB_DTVENC,OB_DTEMIS, DC_ID,LJ_ID