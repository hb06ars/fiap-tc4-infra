CREATE TABLE public.produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE UNIQUE INDEX idx_cpf_cliente ON cliente (cpf);
