-- PostgreSQL Forward Engineering

-- Criação do esquema
CREATE SCHEMA IF NOT EXISTS "SistemaPDV";

-- Tabela "Produto"
CREATE TABLE IF NOT EXISTS "SistemaPDV"."Produto" (
  "idProduto" SERIAL PRIMARY KEY,
  "nomeProduto" VARCHAR(45) NOT NULL,
  "unidade" INT NOT NULL,
  "preco" DOUBLE PRECISION NOT NULL,
  "quantidadeEstoque" INT NOT NULL,
  "dataUltimaVenda" DATE NOT NULL
);

-- Tabela "Cliente"
CREATE TABLE IF NOT EXISTS "SistemaPDV"."Cliente" (
  "idcliente" SERIAL PRIMARY KEY,
  "nomeCliente" VARCHAR(45) NOT NULL,
  "telefone" VARCHAR(11),
  "email" VARCHAR(45) NOT NULL,
  "estado" VARCHAR(45),
  "CEP" VARCHAR(9) NOT NULL,
  "cidade" VARCHAR(45) NOT NULL,
  "rua" VARCHAR(45) NOT NULL
);

-- Tabela "formaPagamento"
CREATE TABLE IF NOT EXISTS "SistemaPDV"."formaPagamento" (
  "idformaPagamento" SERIAL PRIMARY KEY,
  "tipo" VARCHAR(45) NOT NULL
);

-- Tabela "Venda"
CREATE TABLE IF NOT EXISTS "SistemaPDV"."Venda" (
  "idVenda" SERIAL PRIMARY KEY,
  "dataVenda" DATE NOT NULL,
  "hora" TIME NOT NULL,
  "valorTotal" DOUBLE PRECISION NOT NULL,
  "idCliente" INT,
  "idformaPagamento" INT,
  CONSTRAINT "idCliente" FOREIGN KEY ("idCliente") REFERENCES "SistemaPDV"."Cliente" ("idcliente") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "idformaPagamento" FOREIGN KEY ("idformaPagamento") REFERENCES "SistemaPDV"."formaPagamento" ("idformaPagamento") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Tabela "itemVenda"
CREATE TABLE IF NOT EXISTS "SistemaPDV"."itemVenda" (
  "iditemVenda" SERIAL PRIMARY KEY,
  "numerodoItem" VARCHAR(45) NOT NULL,
  "quantidadeVendida" INT NOT NULL,
  "precoUnitario" DOUBLE PRECISION NOT NULL,
  "totaldeItem" INT NOT NULL,
  "idproduto" INT,
  "idvenda" INT,
  CONSTRAINT "idproduto" FOREIGN KEY ("idproduto") REFERENCES "SistemaPDV"."Produto" ("idProduto") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "idvenda" FOREIGN KEY ("idvenda") REFERENCES "SistemaPDV"."Venda" ("idVenda") ON DELETE NO ACTION ON UPDATE NO ACTION
);