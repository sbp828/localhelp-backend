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
```
Check health of backend: http://backend.localhelp.store:8080/health
```
<img width="1358" height="453" alt="image" src="https://github.com/user-attachments/assets/f53da1de-6b5a-4aa1-a722-c3cf5b7887ba" />


### Get Medicines

```
GET /medicines : http://backend.localhelp.store:8080/medicines
```
<img width="1328" height="688" alt="image" src="https://github.com/user-attachments/assets/859b722d-ceef-4c59-93be-51bfafb6a51e" />

### Place Order

```
POST /orders : http://backend.localhelp.store:8080/orders
```
<img width="1146" height="454" alt="image" src="https://github.com/user-attachments/assets/edac294a-5be1-4e4e-996c-d835652d24ee" />

---

## 🗄️ Database Tables

* medicines
* orders
* order_items
  
# tables:

<img width="283" height="194" alt="image" src="https://github.com/user-attachments/assets/10941c05-9244-43fa-80aa-7d391a95d4b6" />

# medicines:

<img width="666" height="550" alt="image" src="https://github.com/user-attachments/assets/37bd0fe2-a529-4896-b6ca-190339688ca9" />

# orders:

<img width="352" height="229" alt="image" src="https://github.com/user-attachments/assets/3feae275-de91-4eb6-99a2-1cae78a206a4" />

# order_items:

<img width="592" height="269" alt="image" src="https://github.com/user-attachments/assets/78459e11-ee0e-47fd-a1fc-cf75a418d481" />

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
