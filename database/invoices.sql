CREATE TABLE invoices (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
    job_id UUID REFERENCES jobs(id) ON DELETE CASCADE,
    subtotal NUMERIC(10,2),
    tax NUMERIC(10,2),
    total NUMERIC(10,2),
    status TEXT CHECK (status IN ('unpaid','paid','void')) DEFAULT 'unpaid',
    payment_intent_id TEXT, -- Stripe or similar
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);
