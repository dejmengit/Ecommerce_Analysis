use ecommerce_analysis;

CREATE TABLE Products (
  product_id VARCHAR(50) PRIMARY KEY,
  product_category_name VARCHAR(100),
  product_weight_g FLOAT,
  product_length_cm FLOAT,
  product_height_cm FLOAT,
  product_width_cm FLOAT
);

CREATE TABLE Payments (
  order_id VARCHAR(50) PRIMARY KEY,
  payment_value DECIMAL(10,2),
  paytype_credit_card VARCHAR(50),
  paytype_debit_card VARCHAR(50),
  paytype_voucher VARCHAR(50),
  paytype_wallet VARCHAR(50)
);

CREATE TABLE Customers (
  customer_id VARCHAR(50) PRIMARY KEY,
  customer_zip_code_prefix VARCHAR(10),
  customer_city VARCHAR(100),
  customer_state VARCHAR(10)
);

CREATE TABLE Orders (
  order_id VARCHAR(50) PRIMARY KEY,
  customer_id VARCHAR(50),
  order_status VARCHAR(50),
  order_purchase_timestamp DATE,
  order_delivered_timestamp DATE,
  order_estimated_delivery_date DATE,
  delivery_days FLOAT,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
  order_id VARCHAR(50),
  product_id VARCHAR(50),
  seller_id VARCHAR(50),
  price DECIMAL(10,2),
  shipping_charges DECIMAL(10,2),
  PRIMARY KEY (order_id, product_id),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
