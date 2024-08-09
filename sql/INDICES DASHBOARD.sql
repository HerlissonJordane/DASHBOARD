/*1--INDICE CRIADO PARA O DASHBOARD, PARA A VIEW VW_TOTAL_VENDAS_POR_DIA*/
DROP INDEX [Idx_sai_mt_cab.COMP] on sai_mt_cab
go
CREATE NONCLUSTERED INDEX [Idx_sai_mt_cab.COMP]
ON [dbo].[sai_mt_cab] ([cl_canc],[dc_id],[sai_org])
INCLUDE ([sai_id],[sai_tot],[sai_dt],[sai_vlipi],[sai_vlicmsrt],[sai_vlacr],[sai_vlfr],[sai_acessorias])
go

/*2--INDICE CRIADO PARA O DASHBOARD, NA VIEW VW_TOTAL_VENDAS_POR_DIA*/
DROP INDEX [Idx_nf_status_COMPOSTO] on NF_STATUS
go
CREATE NONCLUSTERED INDEX [Idx_nf_status_COMPOSTO]
ON NF_STATUS (SAI_ID,STA_ST)
go

/*3--INDICE CRIADO PARA O DASHBOARD, PARA A VIEW VW_TOTAL_VENDAS_POR_DIA*/
DROP INDEX [Idx_cad_dc.dc_dv] ON CAD_DC
go
CREATE NONCLUSTERED INDEX [Idx_cad_dc.dc_dv]
ON CAD_DC (DC_DV)
INCLUDE (DC_ID)
go

/*4--INDICE CRIADO PARA O DASHBOARD, PARA A VIEW VW_TOTAL_VENDAS_COM_CUSTO*/
DROP INDEX [Idx_sai_mt_mat.sai_id-custo] ON SAI_MT_MAT
go
CREATE NONCLUSTERED INDEX [Idx_sai_mt_mat.sai_id-custo]
ON SAI_MT_MAT (SAI_ID,DT_ID)
INCLUDE (SAI_CUST)
go

/*5--INDICE CRIADO PARA O DASHBOARD, PARA A VIEW VW_CONTAS_RECEBER*/
DROP INDEX [Idx_fin_ti_COMP] ON FIN_TI
go
CREATE NONCLUSTERED INDEX [Idx_fin_ti_COMP]
ON [dbo].[fin_ti] ([ti_dtcanc],[ti_sd])
INCLUDE ([ti_id],[lj_id],[ti_dtemis],[ti_dtvenc],[dc_id])
go

/*6--INDICE CRIADO PARA O DASHBOARD, PARA A VIEW VW_CONTAS_RECEBER*/
DROP INDEX [Idx_Fin_ti_COMP2] ON FIN_TI
go
CREATE NONCLUSTERED INDEX [Idx_Fin_ti_COMP2]
ON [dbo].[fin_ti] ([lj_id],[ti_dtcanc],[ti_sd],[dc_id])
INCLUDE ([ti_dtemis],[ti_dtvenc])

