/*
Script: Inserir destinatário na tbMovDest
Descrição: Utilizado quando o destinatário não foi gravado na tbMovDest.
Autor: Cayke Lopes
*/

INSERT INTO tbMovDest
(
    dest_idMov,
    dest_idCadastro,
    dest_doc,
    dest_indIEDest,
    dest_xNome,
    sys_idInsert
)
SELECT
    m.mov_idMov,
    1,
    '99999999000191',
    9,
    c.cad_xNome,
    1
FROM tbMovDados m
CROSS JOIN tbCadastroDados c
WHERE c.cad_idCadastro = 1
AND m.mov_idMov IN
(
    '5034623a-d7e2-42de-8702-3b63e5f5738d',
    'b3336dd7-7738-4455-a6ca-90712a12360b'
);