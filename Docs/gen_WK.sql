CREATE DATABASE WK;
USE WK;

CREATE TABLE `Produtos`
(
 `codigo_produto` int unsigned NOT NULL AUTO_INCREMENT,
 `descricao`      varchar(60) NOT NULL,
 `marca`          varchar(45) NULL,
 `valor_venda`    decimal NOT NULL,

PRIMARY KEY (`codigo_produto`)
);

CREATE TABLE `Pessoas`
(
 `codigo_pessoa`   int unsigned NOT NULL AUTO_INCREMENT,
 `codigo_cidade`   int unsigned NOT NULL,
 `tipo_pessoa`     char NOT NULL,
 `nome`            varchar(300) NOT NULL,
 `tipo_documento`  char NOT NULL,
 `documento`       varchar(30) NOT NULL,
 `data_nascimento` datetime NOT NULL,
 `data_cadastro`   datetime NOT NULL,
 `email`           varchar(60) NOT NULL,
 `contato`         varchar(60) NOT NULL,

PRIMARY KEY (`codigo_pessoa`),
KEY `FK_Pessoas_Cidades` (`codigo_cidade`)
);

CREATE TABLE `Clientes`
(
 `codigo_cliente`     int unsigned NOT NULL AUTO_INCREMENT,
 `codigo_pessoa`      int unsigned NOT NULL,
 `data_ultima_compra` datetime NULL,

PRIMARY KEY (`codigo_cliente`),
KEY `FK_Clientes_Pessoas` (`codigo_pessoa`)
);

CREATE TABLE `Vendedores`
(
 `codigo_vendedor`   int unsigned NOT NULL AUTO_INCREMENT,
 `codigo_pessoa`     int unsigned NOT NULL,
 `data_ultimo_login` datetime NULL,
 `salario`           decimal NULL,

PRIMARY KEY (`codigo_vendedor`),
KEY `FK_Vendedores_Pessoas` (`codigo_pessoa`)
);

CREATE TABLE `Estados`
(
 `codigo_estado` int unsigned NOT NULL AUTO_INCREMENT,
 `nome_estado`   varchar(30) NOT NULL,
 `sigla_estado`  varchar(2) NOT NULL,

PRIMARY KEY (`codigo_estado`)
);

CREATE TABLE `Cidades`
(
 `codigo_cidade` int unsigned NOT NULL AUTO_INCREMENT,
 `codigo_estado` int unsigned NOT NULL,
 `nome_cidade`   varchar(30) NOT NULL,

PRIMARY KEY (`codigo_cidade`),
KEY `FK_Cidades_Estados` (`codigo_estado`)
);

CREATE TABLE `Pedidos`
(
 `numero_pedido`    int unsigned NOT NULL AUTO_INCREMENT,
 `codigo_cliente`   int unsigned NOT NULL,
 `codigo_vendedor`  int unsigned NOT NULL,
 `data_emissao`     datetime NOT NULL,
 `status`           char NOT NULL,
 `valor_desconto`   decimal NULL,
 `valor_total`      decimal NOT NULL,
 `data_faturamento` datetime NULL,

PRIMARY KEY (`numero_pedido`),
KEY `FK_Pedidos_Clientes` (`codigo_cliente`),
KEY `FK_Pedidos_Vendedores` (`codigo_vendedor`)
);

CREATE TABLE `Produtos_Pedidos`
(
 `numero_pedido`  int unsigned NOT NULL,
 `codigo_produto` int unsigned NOT NULL,
 `quantidade`     int NOT NULL,
 `valor_unitario` decimal NOT NULL,
 `valor_total`    decimal NOT NULL,

PRIMARY KEY (`numero_pedido`, `codigo_produto`),
KEY `FK_ProdutosPedidos_Pedidos` (`numero_pedido`),
KEY `FK_ProdutosPedidos_Produtos` (`codigo_produto`)
);

ALTER TABLE `Pessoas`
ADD CONSTRAINT `FK_Pessoas_Cidades` FOREIGN KEY `FK_Pessoas_Cidades` (`codigo_cidade`) REFERENCES `Cidades` (`codigo_cidade`);

ALTER TABLE `Clientes`
ADD CONSTRAINT `FK_Clientes_Pessoas` FOREIGN KEY `FK_Clientes_Pessoas` (`codigo_pessoa`) REFERENCES `Pessoas` (`codigo_pessoa`);

ALTER TABLE `Vendedores`
ADD CONSTRAINT `FK_Vendedores_Pessoas` FOREIGN KEY `FK_Vendedores_Pessoas` (`codigo_pessoa`) REFERENCES `Pessoas` (`codigo_pessoa`);

ALTER TABLE `Cidades`
ADD CONSTRAINT `FK_Estados_Cidades` FOREIGN KEY `FK_Cidades_Estados` (`codigo_estado`) REFERENCES `Estados` (`codigo_estado`);

ALTER TABLE `Pedidos`
ADD CONSTRAINT `FK_Pedidos_Vendedores` FOREIGN KEY `FK_Pedidos_Vendedores` (`codigo_vendedor`) REFERENCES `Vendedores` (`codigo_vendedor`);

ALTER TABLE `Pedidos`
ADD CONSTRAINT `FK_Pedidos_Clientes` FOREIGN KEY `FK_Pedidos_Clientes` (`codigo_cliente`) REFERENCES `Clientes` (`codigo_cliente`);

ALTER TABLE `Produtos_Pedidos`
ADD CONSTRAINT `FK_ProdutosPedidos_Pedidos` FOREIGN KEY `FK_ProdutosPedidos_Pedidos` (`numero_pedido`) REFERENCES `Pedidos` (`numero_pedido`);

ALTER TABLE `Produtos_Pedidos`
ADD CONSTRAINT `FK_ProdutosPedidos_Produtos` FOREIGN KEY `FK_ProdutosPedidos_Produtos` (`codigo_produto`) REFERENCES `Produtos` (`codigo_produto`);