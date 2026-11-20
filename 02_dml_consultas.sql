-- =====================================================================
-- ATIVIDADE 2 - DML: 10 CONSULTAS (todas com 3 ou mais tabelas)
-- Banco: controle_kits_cirurgicos
-- Compatível com SQL_MODE = ONLY_FULL_GROUP_BY (padrão do Workbench)
-- Observação: as consultas 2, 5 e 10 usam CURDATE(), então o resultado
-- muda conforme o dia em que forem executadas.
-- =====================================================================
USE `controle_kits_cirurgicos`;


-- ---------------------------------------------------------------------
-- CONSULTA 1 - Composição de cada kit (kit x produtos x quantidade padrão)
-- Tabelas: kit_cirurgico, composicao_kit, produto (3)
-- Objetivo: listar o que compõe cada kit cirúrgico, base para conferência.
-- ---------------------------------------------------------------------
SELECT k.id_kit,
       k.numero_lote,
       k.fabricante,
       p.codigo_rastreabilidade,
       p.descricao,
       ck.quantidade_padrao
FROM kit_cirurgico k
INNER JOIN composicao_kit ck ON ck.id_kit = k.id_kit
INNER JOIN produto p         ON p.id_produto = ck.id_produto
ORDER BY k.id_kit, p.descricao;


-- ---------------------------------------------------------------------
-- CONSULTA 2 - Kits atualmente em campo (movimentação sem data de retorno)
-- Tabelas: kit_cirurgico, movimentacao, composicao_kit, produto (4)
-- Objetivo: saber quais kits estão fora, há quantos dias e quantos itens levam.
-- ---------------------------------------------------------------------
SELECT k.id_kit,
       k.numero_lote,
       k.status_operacional,
       m.data_envio,
       DATEDIFF(CURDATE(), m.data_envio) AS dias_em_campo,
       COUNT(DISTINCT p.id_produto)      AS tipos_de_produto,
       SUM(ck.quantidade_padrao)         AS total_de_itens
FROM kit_cirurgico k
INNER JOIN movimentacao m ON m.id_kit = k.id_kit
INNER JOIN composicao_kit ck ON ck.id_kit = k.id_kit
INNER JOIN produto p ON p.id_produto = ck.id_produto
WHERE m.data_retorno IS NULL
GROUP BY k.id_kit, k.numero_lote, k.status_operacional, m.id_movimentacao, m.data_envio
ORDER BY dias_em_campo DESC;


-- ---------------------------------------------------------------------
-- CONSULTA 3 - Divergências na conferência (itens enviados que não voltaram
--              nem foram registrados como utilizados)
-- Tabelas: conferencia_movimentacao, movimentacao, kit_cirurgico, produto (4)
-- Objetivo: identificar perdas/extravios de materiais por movimentação.
-- ---------------------------------------------------------------------
SELECT m.id_movimentacao,
       k.numero_lote,
       p.descricao,
       cm.quantidade_enviada,
       cm.quantidade_utilizada,
       cm.quantidade_devolvida,
       cm.quantidade_enviada - (COALESCE(cm.quantidade_utilizada, 0) + cm.quantidade_devolvida) AS qtd_nao_localizada
FROM conferencia_movimentacao cm
INNER JOIN movimentacao m  ON m.id_movimentacao = cm.id_movimentacao
INNER JOIN kit_cirurgico k ON k.id_kit = m.id_kit
INNER JOIN produto p       ON p.id_produto = cm.id_produto
WHERE cm.quantidade_enviada <> COALESCE(cm.quantidade_utilizada, 0) + cm.quantidade_devolvida
ORDER BY qtd_nao_localizada DESC, m.data_envio;


-- ---------------------------------------------------------------------
-- CONSULTA 4 - Top 10 produtos mais utilizados em cirurgias
-- Tabelas: produto, conferencia_movimentacao, movimentacao, kit_cirurgico (4)
-- Objetivo: ranking de consumo e taxa de utilização (insumo para BI).
-- ---------------------------------------------------------------------
SELECT p.id_produto,
       p.codigo_rastreabilidade,
       p.descricao,
       COUNT(DISTINCT k.id_kit)           AS kits_diferentes,
       SUM(cm.quantidade_enviada)         AS total_enviado,
       SUM(cm.quantidade_utilizada)       AS total_utilizado,
       ROUND(100 * SUM(cm.quantidade_utilizada) / SUM(cm.quantidade_enviada), 1) AS pct_utilizacao
FROM produto p
INNER JOIN conferencia_movimentacao cm ON cm.id_produto = p.id_produto
INNER JOIN movimentacao m              ON m.id_movimentacao = cm.id_movimentacao
INNER JOIN kit_cirurgico k             ON k.id_kit = m.id_kit
GROUP BY p.id_produto, p.codigo_rastreabilidade, p.descricao
ORDER BY total_utilizado DESC, p.descricao
LIMIT 10;


-- ---------------------------------------------------------------------
-- CONSULTA 5 - Documentos de kits vencidos ou que vencem em até 90 dias
-- Tabelas: documento, usuario, kit_cirurgico (3)
-- Objetivo: controle de validade (ANVISA, esterilização, laudos) e responsável.
-- ---------------------------------------------------------------------
SELECT d.id_documento,
       d.tipo_documento,
       k.numero_lote,
       u.nome AS responsavel_cadastro,
       d.data_validade,
       DATEDIFF(d.data_validade, CURDATE()) AS dias_para_vencer,
       CASE WHEN d.data_validade < CURDATE() THEN 'Vencido' ELSE 'A vencer' END AS situacao
FROM documento d
INNER JOIN usuario u       ON u.id_usuario = d.id_usuario
INNER JOIN kit_cirurgico k ON k.id_kit = d.id_kit
WHERE d.data_validade <= DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY d.data_validade;


-- ---------------------------------------------------------------------
-- CONSULTA 6 - Contratantes com 2 ou mais processos licitatórios
-- Tabelas: contratante, processo_licitatorio, documento (3)
-- Objetivo: identificar clientes recorrentes e o volume de documentos gerado.
-- ---------------------------------------------------------------------
SELECT c.id_contratante,
       c.nome,
       c.tipo_contratante,
       COUNT(DISTINCT pl.id_processo) AS qtd_processos,
       COUNT(d.id_documento)          AS qtd_documentos
FROM contratante c
INNER JOIN processo_licitatorio pl ON pl.id_contratante = c.id_contratante
LEFT JOIN documento d              ON d.id_processo = pl.id_processo
GROUP BY c.id_contratante, c.nome, c.tipo_contratante
HAVING COUNT(DISTINCT pl.id_processo) >= 2
ORDER BY qtd_processos DESC, qtd_documentos DESC, c.nome;


-- ---------------------------------------------------------------------
-- CONSULTA 7 - Processos por tipo de contratante e situação do processo
-- Tabelas: contratante, processo_licitatorio, documento (3)
-- Objetivo: visão consolidada do funil de licitações (insumo para BI).
-- ---------------------------------------------------------------------
SELECT c.tipo_contratante,
       pl.status_processo,
       COUNT(DISTINCT pl.id_processo) AS qtd_processos,
       COUNT(d.id_documento)          AS qtd_documentos
FROM contratante c
INNER JOIN processo_licitatorio pl ON pl.id_contratante = c.id_contratante
LEFT JOIN documento d              ON d.id_processo = pl.id_processo
GROUP BY c.tipo_contratante, pl.status_processo
ORDER BY c.tipo_contratante, qtd_processos DESC;


-- ---------------------------------------------------------------------
-- CONSULTA 8 - Produtividade dos usuários no cadastro de documentos de licitação
-- Tabelas: usuario, documento, processo_licitatorio, contratante (4)
-- Objetivo: medir quem mais cadastra documentos ligados a processos.
-- ---------------------------------------------------------------------
SELECT u.id_usuario,
       u.nome,
       u.perfil_acesso,
       COUNT(d.id_documento)           AS documentos_cadastrados,
       COUNT(DISTINCT pl.id_processo)  AS processos_envolvidos,
       COUNT(DISTINCT c.id_contratante) AS contratantes_atendidos
FROM usuario u
INNER JOIN documento d             ON d.id_usuario = u.id_usuario
INNER JOIN processo_licitatorio pl ON pl.id_processo = d.id_processo
INNER JOIN contratante c           ON c.id_contratante = pl.id_contratante
GROUP BY u.id_usuario, u.nome, u.perfil_acesso
ORDER BY documentos_cadastrados DESC, u.nome;


-- ---------------------------------------------------------------------
-- CONSULTA 9 - Tempo médio em campo e uso de itens por fabricante do kit
-- Tabelas: kit_cirurgico, movimentacao, conferencia_movimentacao (3)
-- Objetivo: comparar fabricantes quanto à permanência e ao consumo de itens.
-- Obs.: cada movimentação conferida possui o mesmo número de linhas de
--       conferência (2 produtos), então a média de dias não é distorcida.
-- ---------------------------------------------------------------------
SELECT k.fabricante,
       COUNT(DISTINCT m.id_movimentacao)                 AS qtd_movimentacoes,
       ROUND(AVG(DATEDIFF(m.data_retorno, m.data_envio)), 1) AS media_dias_em_campo,
       SUM(cm.quantidade_enviada)                        AS itens_enviados,
       SUM(cm.quantidade_utilizada)                      AS itens_utilizados
FROM kit_cirurgico k
INNER JOIN movimentacao m              ON m.id_kit = k.id_kit
INNER JOIN conferencia_movimentacao cm ON cm.id_movimentacao = m.id_movimentacao
WHERE m.data_retorno IS NOT NULL
GROUP BY k.fabricante
ORDER BY media_dias_em_campo DESC;


-- ---------------------------------------------------------------------
-- CONSULTA 10 - Kits em campo com Registro ANVISA vencido (risco regulatório)
-- Tabelas: kit_cirurgico, documento, movimentacao (3)
-- Objetivo: alerta crítico - kits fora da empresa sem documentação válida.
-- ---------------------------------------------------------------------
SELECT k.id_kit,
       k.numero_lote,
       k.fabricante,
       d.id_documento,
       d.data_validade AS validade_registro,
       DATEDIFF(CURDATE(), d.data_validade) AS dias_vencido,
       m.data_envio,
       DATEDIFF(CURDATE(), m.data_envio)    AS dias_em_campo
FROM kit_cirurgico k
INNER JOIN documento d    ON d.id_kit = k.id_kit
INNER JOIN movimentacao m ON m.id_kit = k.id_kit
WHERE d.tipo_documento = 'Registro ANVISA'
  AND d.data_validade < CURDATE()
  AND m.data_retorno IS NULL
ORDER BY dias_vencido DESC;
