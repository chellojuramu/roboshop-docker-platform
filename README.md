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
