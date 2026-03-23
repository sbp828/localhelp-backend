# LocalHelp Backend

## 📌 Overview

LocalHelp Backend is a Spring Boot application that provides REST APIs for managing help requests, medicines, and order processing.

It acts as the business logic layer in the 3-tier architecture.

---

## 🚀 Features

* REST APIs for medicines and orders
* Cart checkout and order creation
* Stock management (auto deduction)
* MySQL database integration
* Backend validation

---

## 🛠️ Tech Stack

* Java
* Spring Boot
* Spring Data JPA
* MySQL
* Maven

---

## 📂 Project Structure

```
src/main/java/
 ├── controller/
 ├── service/
 ├── repository/
 ├── model/
```

---

## ⚙️ Setup Instructions

### 1. Clone the repo

```
git clone https://github.com/sbp828/localhelp-backend.git
cd localhelp-backend
```

### 2. Configure Database

Update `application.properties`:

```
spring.datasource.url=jdbc:mysql://localhost:3306/appdb
spring.datasource.username=YOUR_USERNAME
spring.datasource.password=YOUR_PASSWORD
```

---

### 3. Run the application

```
mvn spring-boot:run
```

Server runs at:

```
http://localhost:8080
```

---

## 🔗 API Endpoints (Sample)

### Get Medicines

```
GET /medicines
```

### Place Order

```
POST /orders
```

---

## 🗄️ Database Tables

* medicines
* orders
* order_items

---

## 🔗 Frontend Integration

👉 Frontend Repo:
https://github.com/sbp828/localhelp-frontend

---

## 📌 Future Enhancements

* JWT Authentication
* Role-based access
* Request acceptance workflow
* Logging & monitoring

---

## 👨‍💻 Author

Developed as part of a DevSecOps learning project.
