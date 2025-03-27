CREATE TABLE IF NOT EXISTS pedido (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL REFERENCES cliente(id) ON DELETE CASCADE,
    numero_cartao_credito VARCHAR(16) NOT NULL,
    valor_total numeric(10, 2) NULL,
    status VARCHAR(50) NOT NULL,
    dt_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dt_processamento TIMESTAMP,
    dt_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'pedido' AND indexname = 'idx_cliente_id_pedido') THEN
        CREATE INDEX idx_cliente_id_pedido ON pedido (cliente_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'pedido' AND indexname = 'idx_status_pedido') THEN
        CREATE INDEX idx_status_pedido ON pedido (status);
    END IF;
END $$;
