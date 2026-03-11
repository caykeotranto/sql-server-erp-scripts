# SQL Server ERP Scripts

Coleção de scripts SQL usados para análise, manutenção e troubleshooting em sistemas ERP.

## 📂 Estrutura

queries  
Scripts de consulta e análise de dados.

procedures  
Procedures para manutenção e automação.

## 📊 Exemplo de uso

Script para identificar produtos sem venda nos últimos 90 dias:

```sql
SELECT 
    p.prod_idproduto,
    p.prod_descricao,
    MAX(m.sys_dinsert) AS ultima_venda
FROM tbproduto p
LEFT JOIN tbmovprod m
    ON p.prod_idproduto = m.prod_idproduto
GROUP BY 
    p.prod_idproduto,
    p.prod_descricao
HAVING 
    MAX(m.sys_dinsert) < DATEADD(DAY, -90, GETDATE())
    OR MAX(m.sys_dinsert) IS NULL
ORDER BY ultima_venda