SELECT * FROM pedidos;
SELECT p.*, c.nome  FROM pedidos p INNER JOIN clientes c
ON p.cliente_id = c.cliente_id;

CREATE VIEW vw_pedidos1 AS
SELECT p.*, c.nome  FROM pedidos p INNER JOIN clientes c
ON p.cliente_id = c.cliente_id;

SELECT * FROM vw_pedidos1;

-- Desafios
-- 1
CREATE VIEW vw_pedidos AS SELECT p.pedido_id, c.nome as cliente, pi.nome as pizza
    from pedidos p join itens_pedido i on i.pedido_id = p.pedido_id
    join clientes c on p.cliente_id = c.cliente_id
    join pizzas pi on pi.pizza_id = i.pizza_id;
--2
CREATE VIEW vw_pedidos_subtotal AS SELECT
    p.pedido_id,
    c.nome as cliente,
    pi.nome as pizza,
    (i.valor * i.quantidade) as subtotal
from pedidos p join itens_pedido i on i.pedido_id = p.pedido_id
join clientes c on p.cliente_id = c.cliente_id
join pizzas pi on pi.pizza_id = i.pizza_id;
-- 3
select p.nome, (i.valor * i.quantidade) as subtotal from pizzas p join itens_pedido i on i.pizza_id = p.pizza_id;
-- 4
select pedido_id, sum(quantidade) as total_pizzas from itens_Pedido group by pedido_id;