CREATE TABLE jobs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    tenant_id UUID REFERENCES tenants(id) ON DELETE CASCADE,
    customer_id UUID REFERENCES customers(id) ON DELETE SET NULL,
    address JSONB, -- { "street": ..., "city": ..., "lat": ..., "lon": ... }
    spec JSONB, -- list of line items, prices, notes
    status TEXT CHECK (status IN ('unscheduled','scheduled','on_site','complete','cancelled')) DEFAULT 'unscheduled',
    assigned_employee_id UUID REFERENCES service_employees(id) ON DELETE SET NULL,
    assigned_vehicle_id UUID REFERENCES vehicles(id) ON DELETE SET NULL,
    date_scheduled TIMESTAMP,
    date_completed TIMESTAMP,
    date_priced TIMESTAMP,
    date_on_site TIMESTAMP,
    invoice_id UUID,
    before_pictures TEXT[],
    after_pictures TEXT[],
    created_at TIMESTAMP DEFAULT now(),
    updated_at TIMESTAMP DEFAULT now()
);
-- Index to quickly find unscheduled jobs for a tenant
-- CREATE INDEX idx_jobs_tenant_status ON jobs(tenant_id, status);