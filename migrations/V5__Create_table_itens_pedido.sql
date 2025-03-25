CREATE TABLE IF NOT EXISTS itens_pedido (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL REFERENCES pedido(id) ON DELETE CASCADE,
    sku_produto VARCHAR(50) NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    dt_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'itens_pedido' AND indexname = 'idx_pedido_id_itens_pedido') THEN
        CREATE INDEX idx_pedido_id_itens_pedido ON itens_pedido (pedido_id);
    END IF;
END $$;
