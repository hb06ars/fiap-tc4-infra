CREATE TABLE IF NOT EXISTS produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    sku VARCHAR(50) UNIQUE NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    dt_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_produto_nome') THEN
        CREATE INDEX idx_produto_nome ON produto(nome);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_produto_sku') THEN
        CREATE INDEX idx_produto_sku ON produto(sku);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_produto_dt_criacao') THEN
        CREATE INDEX idx_produto_dt_criacao ON produto(dt_criacao);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_produto_dt_atualizacao') THEN
        CREATE INDEX idx_produto_dt_atualizacao ON produto(dt_atualizacao);
    END IF;
END $$;
