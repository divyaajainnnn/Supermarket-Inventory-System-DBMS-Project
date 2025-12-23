CREATE DATABASE IF NOT EXISTS supermarket_database;
USE supermarket_database;

CREATE TABLE customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    contact_num BIGINT,
    address VARCHAR(120),
    city VARCHAR(40),
    state VARCHAR(20),
    status ENUM('active','inactive')
);

CREATE TABLE product (
    product_pk INT AUTO_INCREMENT PRIMARY KEY,
    product_code VARCHAR(20),
    brand_name VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(40),
    UNIQUE (product_code, brand_name)
);

CREATE TABLE sku (
    sku_id VARCHAR(10) PRIMARY KEY,
    product_pk INT,
    mrp DECIMAL(10,2),
    pack_size VARCHAR(20),
    FOREIGN KEY (product_pk) REFERENCES product(product_pk)
);

CREATE TABLE store (
    store_id VARCHAR(5) PRIMARY KEY,
    city VARCHAR(40),
    state VARCHAR(20),
    pincode INT,
    store_type ENUM('retail','warehouse')
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    role ENUM('cashier','manager','inventory'),
    store_id VARCHAR(5),
    FOREIGN KEY (store_id) REFERENCES store(store_id)
);

CREATE TABLE supplier (
    supplier_id VARCHAR(10) PRIMARY KEY,
    supplier_name VARCHAR(50)
);

CREATE TABLE supplier_sku (
    supplier_id VARCHAR(10),
    sku_id VARCHAR(10),
    supply_price DECIMAL(10,2),
    PRIMARY KEY (supplier_id, sku_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY (sku_id) REFERENCES sku(sku_id)
);

CREATE TABLE stock (
    store_id VARCHAR(5),
    sku_id VARCHAR(10),
    qty INT,
    inbound_price DECIMAL(10,2),
    PRIMARY KEY (store_id, sku_id),
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (sku_id) REFERENCES sku(sku_id)
);

CREATE TABLE purchase_order (
    po_id VARCHAR(10) PRIMARY KEY,
    supplier_id VARCHAR(10),
    order_date DATETIME,
    order_status ENUM('placed','received','cancelled'),
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

CREATE TABLE purchase_order_item (
    po_id VARCHAR(10),
    sku_id VARCHAR(10),
    qty INT,
    cost_price DECIMAL(10,2),
    PRIMARY KEY (po_id, sku_id),
    FOREIGN KEY (po_id) REFERENCES purchase_order(po_id),
    FOREIGN KEY (sku_id) REFERENCES sku(sku_id)
);

CREATE TABLE sales_order (
    order_id VARCHAR(10),
    sku_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATETIME,
    qty INT,
    selling_price DECIMAL(10,2),
    total_price DECIMAL(12,2),
    delivery_city VARCHAR(40),
    delivery_state VARCHAR(20),
    order_status ENUM('placed','packed','delivered','cancelled'),
    PRIMARY KEY (order_id, sku_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (sku_id) REFERENCES sku(sku_id)
);

CREATE TABLE sales_payment (
    payment_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    payment_mode ENUM('cash','card','upi'),
    amount DECIMAL(12,2),
    payment_date DATETIME
);

CREATE TABLE delivery (
    delivery_id VARCHAR(10) PRIMARY KEY,
    order_id VARCHAR(10),
    store_id VARCHAR(5),
    emp_id INT,
    delivery_date DATETIME,
    delivery_status ENUM('yet_to_ship','in_transit','delivered'),
    FOREIGN KEY (store_id) REFERENCES store(store_id),
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id)
);
