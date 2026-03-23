CREATE DATABASE IF NOT EXISTS appdb;

USE appdb;

CREATE TABLE IF NOT EXISTS medicines (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  description TEXT,
  price DOUBLE,
  stock INT
);

CREATE TABLE IF NOT EXISTS orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  total_amount DOUBLE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS order_item (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  medicine_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);
