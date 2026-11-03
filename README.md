# 🍕 Aula 09 - Pizzaria

## Descrição

Este repositório contém as atividades desenvolvidas na Aula 09 de Banco de Dados, utilizando o banco de dados **Pizzaria**.

## Arquivos

- `Pizzaria.sql` - Script de criação e população do banco de dados.
- `queries.sql` - Consultas SQL e comandos DML (INSERT e UPDATE).
- `index.sql` - Criação e teste de índice na tabela `Clientes`.
- `views.sql` - Criação de views e relatórios solicitados na atividade.

## Atividades realizadas

- Consultas utilizando `SELECT` e `SHOW`.
- Inserção de um novo cliente, telefone, pedidos e pizzas.
- Atualização de pedidos com `UPDATE`.
- Criação de índice para otimização de consultas.
- Criação de views para relatórios.
- Resolução dos desafios propostos em aula.





1. QUERIES.SQL – Consultas ao banco de dados
USE pizzaria;
Seleciona o banco de dados chamado pizzaria. Todos os comandos seguintes serão executados nele.
A) SHOW TABLES;
Mostra todas as tabelas existentes dentro do banco de dados.
SELECT COUNT(*)
Conta quantos registros existem em uma tabela.

Exemplo:
SELECT COUNT(*) AS total_clientes FROM clientes;

Conta quantos clientes estão cadastrados. O AS total_clientes dá um nome ao resultado.
B) Quantidade de clientes
SELECT COUNT(*) AS total_clientes
FROM clientes;

Conta todos os clientes cadastrados na tabela clientes.
C) Quantidade de pizzas
SELECT COUNT(*) AS total_pizzas
FROM pizzas;

Conta quantas pizzas estão cadastradas no cardápio.
D) Quantidade de pizzas do pedido 3
SELECT SUM(quantidade) AS total_pizzas
FROM itens_pedido
WHERE pedido_id = 3;

- SUM(): soma os valores de uma coluna.
- WHERE: filtra os registros.
- pedido_id = 3: seleciona somente os itens do pedido número 3.
Esse comando soma a quantidade de pizzas do pedido.
E) Nome do cliente do pedido 3
SELECT c.nome
FROM clientes c
INNER JOIN pedidos p ON c.cliente_id = p.cliente_id
WHERE p.pedido_id = 3;

- SELECT: escolhe as informações que queremos visualizar.
- FROM: indica a tabela principal.
- INNER JOIN: relaciona duas tabelas.
- ON: indica qual coluna será utilizada para relacionar as tabelas.
- WHERE: filtra pelo pedido número 3.
- c e p: são apelidos para facilitar a escrita dos comandos.
Esse comando relaciona clientes e pedidos para descobrir quem fez o pedido número 3.
F) Nomes das pizzas do pedido 3
SELECT pi.nome
FROM itens_pedido ip
INNER JOIN pizzas pi ON ip.pizza_id = pi.pizza_id
WHERE ip.pedido_id = 3;

Relaciona os itens do pedido com a tabela de pizzas para mostrar os nomes das pizzas que foram solicitadas no pedido número 3.


Cria um pedido para Gaspar Oliveira.
- INSERT INTO: insere o pedido.
- SELECT: busca o ID do cliente.
- ORDER BY: organiza os resultados.
- DESC: organiza em ordem decrescente.
- LIMIT 1: retorna somente um resultado.
INSERT INTO itens_pedido (pedido_id, pizza_id, quantidade)
SELECT
    (SELECT MAX(pedido_id) FROM pedidos),
    pi.pizza_id,
    CASE
        WHEN pi.nome = 'Margherita' THEN 1
        WHEN pi.nome = 'Napolitana' THEN 2
    END
FROM pizzas pi
WHERE pi.nome IN ('Margherita', 'Napolitana');

Insere as pizzas no pedido de Gaspar.
- MAX(): retorna o maior número de pedido.
- CASE: permite estabelecer condições.
- WHEN: define uma condição.
- THEN: define o resultado da condição.
- IN: procura valores dentro de uma lista.
Nesse caso, cadastra 1 Margherita e 2 Napolitanas.


USE	Seleciona o banco de dados.
SHOW TABLES	Mostra as tabelas existentes.
SELECT	Consulta informações.
COUNT()	Conta registros.
SUM()	Soma valores.
FROM	Indica a tabela consultada.
WHERE	Filtra registros.
INNER JOIN	Relaciona tabelas.
ON	Define a condição do relacionamento.
LIKE	Pesquisa utilizando padrões de texto.
ORDER BY	Ordena resultados.
GROUP BY	Agrupa registros.
INSERT INTO	Insere novos registros.
UPDATE	Altera registros existentes.
SET	Define os novos valores.
CREATE INDEX	Cria um índice.
CREATE VIEW	Cria uma visão/relatório.
DESCRIBE	Mostra a estrutura de uma tabela.
LIMIT	Limita a quantidade de resultados.
MAX()	Retorna o maior valor.
CASE	Cria condições dentro de uma consulta.