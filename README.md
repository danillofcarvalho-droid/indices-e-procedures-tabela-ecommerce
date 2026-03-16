# Otimização de Consultas com Índices – Banco de Dados E-commerce

Este projeto tem como objetivo demonstrar a criação e utilização de **índices em um banco de dados relacional** para melhorar o desempenho de consultas SQL no cenário de um sistema de **E-commerce**.

Os índices foram criados com base nas consultas mais utilizadas no banco de dados, considerando principalmente colunas envolvidas em operações de **JOIN, WHERE, GROUP BY e ORDER BY**. Dessa forma, é possível reduzir o tempo de busca de informações e melhorar a performance geral das consultas.

Os índices criados utilizam o tipo **BTREE**, que é o padrão do MySQL e é especialmente eficiente para consultas que envolvem comparações, ordenações e junções entre tabelas.

---

# Índices Criados

## 1. Qual fornecedor possui mais produtos cadastrados?

Para responder a essa pergunta é necessário relacionar as tabelas **supplier** e **productSupplier**, que armazenam respectivamente os fornecedores e os produtos fornecidos por cada um.

Foi criado um índice do tipo **BTREE** na coluna `idPsSupplier` da tabela `productSupplier`, pois ela é utilizada na operação de **JOIN** com a tabela `supplier`.

Esse índice permite que o SGBD localize mais rapidamente os registros relacionados a cada fornecedor, reduzindo o tempo necessário para realizar a junção entre as tabelas e calcular a quantidade de produtos por fornecedor utilizando **COUNT** e **GROUP BY**.

## 2. Quais vendedores estão em cada cidade?

Para essa consulta é utilizada a tabela seller, que contém a coluna location, responsável por armazenar a cidade onde cada vendedor está localizado.

Esse indíce foi criado com a finalidade de fazer a coluna location ser usada para filtragem de cidades, agrupamento e ordenação;

## 3. Relação de produtos por pedido

Essa consulta envolve a relação entre as tabelas orders, productOrder e product, que representam respectivamente os pedidos realizados; os produtos associados aos pedidos; as informações detalhadas de cada produto

Esses índices permitem que o banco de dados encontre rapidamente quais produtos pertencem a determinado pedido, tornando as consultas mais eficientes e reduzindo o custo de processamento das junções entre as tabelas.

## Procedure para Manipulação de Dados

Foi criada a procedure `gerenciar_produto` com o objetivo de centralizar operações de manipulação de dados na tabela `product` do banco de dados `ecommerce`. Essa procedure permite realizar diferentes operações sobre os produtos utilizando uma variável de controle chamada `operacao`.

A variável `operacao` define qual ação será executada pela procedure, sendo:
- **1** para inserir um novo produto
- **2** para atualizar um produto existente
- **3** para remover um produto
- **4** para consultar um produto específico

A lógica da procedure utiliza uma estrutura condicional `IF` para verificar o valor recebido pela variável de controle e executar a instrução SQL correspondente (`INSERT`, `UPDATE`, `DELETE` ou `SELECT`).
