# 🚀 Roboshop Docker Platform

A production-style microservices deployment of the Roboshop application using Docker and Docker Compose.
This project demonstrates containerization, service orchestration, and real-world DevOps practices.

---

## 🧠 Architecture Overview

```
Frontend (Nginx)
        ↓
Backend Services (NodeJS / Java / Python)
        ↓
Databases & Messaging
```

- MongoDB (Catalogue, User)
- MySQL (Shipping)
- Redis (Cart cache)
- RabbitMQ (Async messaging)

---

## 🧱 Services

### 🔹 Frontend
- Nginx-based reverse proxy
- Exposes application on port 80

### 🔹 Backend Services
- Catalogue (NodeJS + MongoDB)
- User (NodeJS + MongoDB + Redis)
- Cart (NodeJS + Redis)
- Shipping (Java + MySQL)
- Payment (Python + RabbitMQ)

### 🔹 Infrastructure
- MongoDB (persistent)
- MySQL (persistent)
- Redis (cache)
- RabbitMQ (message broker)

---

## 🐳 Docker Strategy

- Multi-stage builds used for optimized images
- Distroless images used for NodeJS services (security & size)
- Alpine-based images for lightweight containers
- Non-root users used for better security
- Multi-architecture images built using Docker Buildx (ARM64 + AMD64 support)
## 🏗️ Multi-Architecture Build (Docker Buildx)

This project supports both ARM64 (Mac M1/M2) and AMD64 (cloud/EC2) architectures.

### Why Buildx?

Local development was done on Apple Silicon (ARM64), while deployment targets (EC2) use AMD64 architecture. To ensure compatibility across environments, Docker Buildx was used to create multi-platform images.

### Build Command

```bash

### 🔹 Cart Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-cart:1.0 
./docker/cart 
--push

---

### 🔹 User Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-user:1.0 
./docker/user 
--push

---

### 🔹 Catalogue Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-catalogue:1.0 
./docker/catalogue 
--push

---

### 🔹 Shipping Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-shipping:1.0 
./docker/shipping 
--push

---

### 🔹 Payment Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-payment:1.0 
./docker/payment 
--push

---

### 🔹 Frontend Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-frontend:1.0 
./docker/frontend 
--push

---

### 🔹 MySQL Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-mysql:1.0 
./docker/mysql 
--push

---

### 🔹 MongoDB Service

docker buildx build 
--platform linux/amd64,linux/arm64 
-t chelloju/roboshop-mongodb:1.0 
./docker/mongodb 
--push

---

### ⚠️ Note

All images are built using Docker Buildx to support both:

* ARM64 → Local development (Mac)
* AMD64 → Cloud deployment (EC2)

This ensures the images run consistently across different architectures without compatibility issues.


---

## 📦 Image Registry

All images are pushed to Docker Hub:

```bash
docker pull chelloju/roboshop-frontend:1.0
docker pull chelloju/roboshop-cart:1.0
docker pull chelloju/roboshop-user:1.0
docker pull chelloju/roboshop-catalogue:1.0
docker pull chelloju/roboshop-shipping:1.0
docker pull chelloju/roboshop-payment:1.0
docker pull chelloju/roboshop-mysql:1.0
docker pull chelloju/roboshop-mongodb:1.0
```

---

## ⚙️ Run the Application

### 1️⃣ Clone Repository

```bash
git clone https://github.com/chellojuramu/roboshop-docker-platform.git
cd roboshop-docker-platform
```

### 2️⃣ Start Services

```bash
docker compose up -d
```

### 3️⃣ Access Application

```
http://localhost
```

### 4️⃣ RabbitMQ UI

```
http://localhost:15672
```

| Field    | Value       |
|----------|-------------|
| Username | roboshop    |
| Password | roboshop123 |

---

## 💾 Data Persistence

| Service | Volume Used   |
|---------|---------------|
| MySQL   | ✅ Yes        |
| MongoDB | ✅ Yes        |
| Redis   | ❌ No (cache) |

---

## 🔐 Security Practices

- Avoided root user inside containers
- Used minimal base images (Alpine / Distroless)
- No hardcoded secrets in production (recommended to use `.env`)

---

## 🧠 Key Learnings

- Docker image optimization
- Multi-service orchestration using Docker Compose
- Service-to-service communication via DNS
- Async communication using RabbitMQ
- Stateful vs Stateless containers
- Production vs Development Docker workflows

---

## 🚀 Future Improvements

- Add health checks
- Use `.env` for secrets
- CI/CD pipeline (GitHub Actions / Jenkins)
- Kubernetes deployment (EKS)

---

## 👨‍💻 Author

**Ramu Chelloju**  
DevOps & Cloud Enthusiast

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/ramuchelloju/)

> 📌 Follow me on LinkedIn: [linkedin.com/in/ramuchelloju](https://www.linkedin.com/in/ramuchelloju/)
