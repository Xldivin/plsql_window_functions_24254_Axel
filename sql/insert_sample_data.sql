-- Insert Warehouses
INSERT INTO warehouses (warehouse_name, region, capacity) VALUES
('Central Warehouse', 'North', 10000),
('East Warehouse', 'East', 8000),
('West Warehouse', 'West', 7000);

-- Insert Suppliers
INSERT INTO suppliers (supplier_name, contact_email) VALUES
('Tech Supplies Ltd', 'tech@supplier.com'),
('Global Industrial', 'industrial@supplier.com');

-- Insert Products
INSERT INTO products (product_name, category, unit_cost, supplier_id) VALUES
('Laptop', 'Electronics', 800, 1),
('Printer', 'Electronics', 200, 1),
('Office Chair', 'Furniture', 150, 2),
('Desk', 'Furniture', 300, 2);

-- Insert Stock Movements
INSERT INTO stock_movements (product_id, warehouse_id, movement_date, movement_type, quantity) VALUES
(1, 1, '2024-01-10', 'IN', 50),
(1, 1, '2024-02-15', 'OUT', 20),
(2, 2, '2024-01-20', 'IN', 40),
(3, 3, '2024-02-05', 'IN', 30),
(4, 1, '2024-03-01', 'IN', 25),
(2, 2, '2024-03-15', 'OUT', 10);
