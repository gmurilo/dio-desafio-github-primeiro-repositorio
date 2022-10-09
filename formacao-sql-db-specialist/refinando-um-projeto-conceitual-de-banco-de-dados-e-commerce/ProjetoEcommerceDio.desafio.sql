/* Quantos pedidos foram feitos por cada cliente? */
SELECT count(DISTINCT A."idPedido"), B."idPessoa" from "Pedido" A inner join "Pessoa_Endereco" B using ( "idPessoaEndereco" ) GROUP BY "idPessoa" ;

/* Algum vendedor também é fornecedor? */
SELECT DISTINCT B."idRevenda" as "idPessoa" from "Fornecedor" A INNER JOIN "Revenda" B ON ( A."idFornecedor" = B."idRevenda" );

/* Relação de produtos fornecedores e estoques; */
SELECT * FROM "Produto" A INNER JOIN "Fornecedor" B USING ( "idFornecedor" ) LEFT JOIN "Estoque" C USING ( "idProduto" ); 

/* Relação de nomes dos fornecedores e nomes dos produtos; */
SELECT * FROM "Fornecedor" A INNER JOIN "Pessoa" B ON ( A."idFornecedor" = B."idPessoa" );
SELECT * FROM "Produtos" A INNER JOIN "Pessoa" B ON ( A."idFornecedor" = B."idPessoa" );
