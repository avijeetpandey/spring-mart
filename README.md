# Mart - Grocery Delivery Backend [WIP]

**Mart** is a robust e-commerce backend designed specifically for grocery delivery. Built with **Spring Boot** and **PostgreSQL**, it handles the complexities of perishable inventory, delivery scheduling, and user management.

## 🚀 Features

This project implements the "Easy" (MVP) and "Medium" (Enhanced Experience) feature sets.

### Core Essentials (MVP)

* **User Authentication:** Secure Sign-up and Login using JWT (JSON Web Tokens).
* **Product Catalog:** Browse products by Category (Fruits, Dairy, etc.) with `OneToMany` relationships.
* **Cart Management:** Persistent cart functionality (Add, Remove, Update Quantity).
* **Order Placement:** Transactional checkout flow with address selection.
* **Order History:** View past orders and delivery status.

### Enhanced Experience

* **Smart Search & Filtering:** Filter products by price range, brand, or dietary preferences using JPA Specifications.
* **Delivery Scheduling:** Reserve specific time slots (e.g., "Tomorrow 6 PM - 8 PM") to manage logistics.
* **Wallet & Promo Codes:** Apply discount coupons and manage internal wallet balances.
* **Product Substitution:** Users can select preferences (Refund vs. Replace) if items go out of stock.
* **Smart Re-order:** Quickly re-add frequently purchased items to the cart.

---

## 🛠️ Tech Stack

* **Language:** Java 17+
* **Framework:** Spring Boot 3.x
* **Database:** PostgreSQL
* **ORM:** Spring Data JPA (Hibernate)
* **Security:** Spring Security + JWT
* **Build Tool:** Maven (or Gradle)

---

## 📋 Prerequisites

Before running the application, ensure you have the following installed:

1. **Java JDK 17** or higher.
2. **PostgreSQL** (running locally or via Docker).
3. **Maven** (usually included with your IDE).
4. **Postman** (for API testing).

---

## ⚙️ Configuration

1. **Clone the Repository**
```bash
git clone https://github.com/your-username/mart.git
cd mart

```


2. **Database Setup**
   Open your PostgreSQL terminal (pgAdmin or psql) and create the database:
```sql
CREATE DATABASE mart_db;

```


3. **Application Properties**
   Navigate to `src/main/resources/application.properties` (or `application.yml`) and configure your database credentials:
```properties
# Database Configuration
spring.datasource.url=jdbc:postgresql://localhost:5432/mart_db
spring.datasource.username=<>
spring.datasource.password=<>
spring.jpa.hibernate.ddl-auto=update
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect

# Server Port
server.port=8080

# JWT Secret (for Authentication)
app.jwt.secret=YourSuperSecretKeyHereYourSuperSecretKeyHere
app.jwt.expiration-ms=86400000

```

## ▶️ How to Run

### Option 1: Using Command Line (Terminal)

**Using Maven:**

```bash
# Clean and build the project
./mvnw clean install

# Run the application
./mvnw spring-boot:run

```

**Using Gradle:**

```bash
./gradlew bootRun

```

## 📡 API Endpoints (Quick Reference)

Once the server is running at `http://localhost:9000`, you can test these endpoints:

| Method | Endpoint | Description |
| --- | --- | --- |
| **POST** | `/api/auth/register` | Register a new user |
| **POST** | `/api/auth/login` | Login and get JWT |
| **GET** | `/api/products` | Get all products (supports filters) |
| **GET** | `/api/cart` | View current user's cart |
| **POST** | `/api/orders` | Place a new order |
| **GET** | `/api/slots` | View available delivery slots |
