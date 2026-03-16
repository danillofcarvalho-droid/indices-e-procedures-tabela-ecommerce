USE ecommerce;

DELIMITER $$

create procedure gerenciar_produto(
    in operacao int,
    in p_id int,
    in p_nome varchar(100),
    in p_categoria varchar(50),
    in p_avaliacao float
)
begin

if operacao = 1 then

insert into product (Pname, category, Avaliação)
values (p_nome, p_categoria, p_avaliacao);

elseif operacao = 2 then

update product
set Pname = p_nome,
    category = p_categoria,
    Avaliação = p_avaliacao
where idProduct = p_id;

elseif operacao = 3 then

delete from product
where idProduct = p_id;

elseif operacao = 4 then

select * from product
where idProduct = p_id;

end if;

end $$

DELIMITER ;


-- Inserir produto
CALL gerenciar_produto(1, NULL, 'Notebook Gamer', 'Eletrônico', 5);
-- Atualizar produto
CALL gerenciar_produto(2, 154, 'Notebook Gamer RTX', 'Eletrônico', 5);
-- Deletar produto
CALL gerenciar_produto(3, 154, NULL, NULL, NULL);
-- Consultar produto
CALL gerenciar_produto(4, 154, NULL, NULL, NULL);