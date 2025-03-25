CREATE TABLE IF NOT EXISTS cliente (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    data_nascimento DATE,
    rua VARCHAR(255),
    numero INT,
    cep VARCHAR(10),
    cidade VARCHAR(100),
    estado VARCHAR(100),
    complemento VARCHAR(255),
    dt_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'cliente' AND indexname = 'idx_cpf_cliente') THEN
        CREATE UNIQUE INDEX idx_cpf_cliente ON cliente (cpf);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'cliente' AND indexname = 'idx_nome_cliente') THEN
        CREATE INDEX idx_nome_cliente ON cliente (nome);
    END IF;
END $$;
