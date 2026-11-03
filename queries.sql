--  A) Quantas tabelas o banco de dados possui?
show tables;
-- B) Quantos Clientes cadastrados?
select count(*) as `total de clientes` from clientes;
-- C) Quantas Pizzas cadastradas?
select count(*) as `total de pizzas`from pizzas;
-- D) Quantas pizzas o pedido nº 3 possui?
select count(*) as `pizzas totais` from itens_pedido where pedido_id = 3;
-- E) Qual o nome do cliente que fez o pedido nº 3?
select c.nome from pedidos p join clientes c on p.cliente_id = c.cliente_id where pedido_id = 3;
-- F) Quais os nomes das pizzas do pedido nº 3?
select p.nome from itens_pedido i join pizzas p on i.pizza_id = p.pizza_id  where i.pedido_id = 3;
-- DML's
-- Usuário
("Gaspar Oliveira","Rua Lizandro Silva",21,null,"Sâo Dimas","Ao lado da igrejinha");
-- Telefone
(106, "19998981141");
-- Pedido
insert into Pedidos(cliente_id, data, hora) values(18,DATE_SUB(curdate(),INTERVAL 5 DAY),"17:09:00");
-- Pizza
insert into Pizzas(nome, descricao, valor) values("À moda do chef","Molho de tomate, palmito macio em rodelas, cobertura com catupiry, frango desfiado. ovos, carne seca, orégano e azeitonas",41.9);
-- Itens Pedidos

-- insert into Itens_Pedido(pedido_id, pizza_id, quantidade, valor) values(22,1,3, (select valor from Pizzas where pizza_id = 22));
-- insert into Itens_Pedido(pedido_id, pizza_id, quantidade, valor) values(27,2,3, (select valor from Pizzas where pizza_id = 27));


-- 5) Alterar esse pedido: 3 A moda do chef + 1 Margherita
update Itens_Pedido
set quantidade = 3
where pedido_id = (select max(pedido_id) from Pedidos)
and pizza_id = (select pizza_id from Pizzas where nome = 'A moda do chef' limit 1);

insert into Itens_Pedido(pedido_id, pizza_id, quantidade)
values ((select max(pedido_id) from Pedidos),
(select pizza_id from Pizzas where nome = 'Margherita' limit 1), 2);
