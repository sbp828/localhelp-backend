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
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  order_date DATETIME
);

CREATE TABLE IF NOT EXISTS order_item (
  id INT PRIMARY KEY AUTO_INCREMENT,
  medicine_id INT,
  price DOUBLE,
  quantity INT,
  order_id INT,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);
