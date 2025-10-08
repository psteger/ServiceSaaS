CREATE INDEX idx_jobs_tenant_id ON jobs(tenant_id);
CREATE INDEX idx_customers_tenant_id ON customers(tenant_id);
CREATE INDEX idx_service_employees_tenant_id ON service_employees(tenant_id);
CREATE INDEX idx_vehicles_tenant_id ON vehicles(tenant_id);
CREATE INDEX idx_jobs_status ON jobs(status);
CREATE INDEX idx_routes_vehicle_id_date ON routes(vehicle_id, route_date);
