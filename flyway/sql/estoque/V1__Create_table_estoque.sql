CREATE TABLE IF NOT EXISTS estoque (
    id SERIAL PRIMARY KEY,
    produto_id INT NOT NULL REFERENCES produto(id) ON DELETE CASCADE,
    quantidade INT,
    dt_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_estoque_produto_id') THEN
        CREATE INDEX idx_estoque_produto_id ON estoque(produto_id);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_estoque_quantidade') THEN
        CREATE INDEX idx_estoque_quantidade ON estoque(quantidade);
    END IF;
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE indexname = 'idx_estoque_dt_atualizacao') THEN
        CREATE INDEX idx_estoque_dt_atualizacao ON estoque(dt_atualizacao);
    END IF;
END $$;
