CREATE TABLE IF NOT EXISTS pagamento (
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL REFERENCES pedido(id) ON DELETE CASCADE,
    idPagamento VARCHAR(255) NOT NULL,
    dt_pagamento TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pagamento VARCHAR(50) DEFAULT 'ABERTO',
    dt_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'pagamento' AND indexname = 'idx_pedido_id_pagamento') THEN
        CREATE INDEX idx_pedido_id_pagamento ON pagamento (pedido_id);
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename = 'pagamento' AND indexname = 'idx_dt_pagamento_pagamento') THEN
        CREATE INDEX idx_dt_pagamento_pagamento ON pagamento (dt_pagamento);
    END IF;
END $$;
