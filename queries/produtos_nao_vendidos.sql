-- Produtos não vendidos nos últimos 90 dias

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