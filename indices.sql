use ecommerce; 

-- Qual fornecedor possui mais produtos cadastrados?
-- Query
select s.socialName, COUNT(ps.idPsProduct) AS total_produtos
from supplier s
join productSupplier ps 
on s.idSupplier = ps.idPsSupplier
group by s.idSupplier
order by total_produtos desc
limit 1;

-- Índices 
create index idx_productSupplier_supplier
on productSupplier(idPsSupplier);

create index idx_supplier_id
on supplier(idSupplier);

-- Quais vendedores estão em cada cidade?
-- Query
select location, socialName
from seller
order by location;

-- Índice
create index idx_seller_location
on seller(location);

-- Relação de produtos por pedido
-- Query
select o.idOrder, p.Pname, po.podQuantity
from orders o
join productOrder po 
on o.idOrder = po.idPOorder
join product p 
on p.idProduct = po.idPOproduct;

-- Índices
create index idx_productOrder_order
on productOrder(idPOorder);

create index  idx_productOrder_product
on productOrder(idPOproduct);

create index idx_product_id
on product(idProduct);