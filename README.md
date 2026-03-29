# 🚀 Roboshop Docker Platform

A production-grade microservices deployment of the Roboshop application using Docker, showcasing end-to-end DevOps practices including containerization, multi-stage builds, distroless images, and service-to-service communication.

---

## 🧠 Project Overview

Roboshop is a microservices-based e-commerce application consisting of multiple services such as frontend, catalogue, cart, user, shipping, payment, and supporting components like databases, cache, and message queues.

This project demonstrates how to:

- Containerize multiple services
- Use Docker networking for communication
- Optimize images using multi-stage builds
- Improve security using distroless images
- Structure a real-world DevOps project

---

## 🏗️ Architecture

```
Frontend (nginx)
        ↓
-----------------------------------------
|        Backend Services               |
|--------------------------------------|
| User        → MongoDB               |
| Catalogue   → MongoDB               |
| Cart        → Redis                 |
| Shipping    → MySQL                 |
| Payment     → RabbitMQ              |
-----------------------------------------
```

---

## 🧰 Tech Stack

### 🚀 Core Technologies
- Docker
- Docker Networking

### ☁️ Backend Services
- Node.js (Catalogue, Cart, User)
- Java (Shipping)
- Python (Payment)

### 🗄️ Databases & Messaging
- MongoDB
- MySQL
- Redis
- RabbitMQ

### 🌐 Frontend
- Nginx

---

## 📁 Project Structure

```
roboshop-docker-platform/
│
├── docker/
│   ├── frontend/
│   ├── catalogue/
│   ├── cart/
│   ├── user/
│   ├── shipping/
│   ├── payment/
│   ├── mongodb/
│   ├── mysql/
│   ├── redis/
│   └── rabbitmq/
│
├── docs/
└── README.md
```

---

## 🔥 Key Features

- ✅ Multi-stage Docker builds
- ✅ Distroless images for enhanced security
- ✅ Lightweight alpine-based images
- ✅ Service-to-service communication via Docker network
- ✅ Database initialization using entrypoint scripts
- ✅ Clean and modular project structure
- ✅ Production-ready best practices

---

## 🐳 Docker Concepts Used

- `FROM` → base images
- `WORKDIR` → container working directory
- `COPY` → file transfer
- `RUN` → build-time commands
- `ENV` → configuration variables
- `CMD` → runtime execution
- Multi-stage builds
- Distroless images
- Docker networking

---

## 🚀 How to Run the Project

### 🔹 1. Create Docker Network

```bash
docker network create roboshop
```

### 🔹 2. Build Images

```bash
docker build -t roboshop/mongodb ./docker/mongodb
docker build -t roboshop/catalogue ./docker/catalogue
docker build -t roboshop/cart ./docker/cart
docker build -t roboshop/user ./docker/user
docker build -t roboshop/frontend ./docker/frontend
docker build -t roboshop/mysql ./docker/mysql
docker build -t roboshop/shipping ./docker/shipping
docker build -t roboshop/payment ./docker/payment
docker build -t roboshop/rabbitmq ./docker/rabbitmq
docker build -t roboshop/redis ./docker/redis
```

### 🔹 3. Run Services (Order Matters 🔥)

```bash
# Databases
docker run -d --name mongodb --network roboshop roboshop/mongodb
docker run -d \
  --name mysql \
  --network roboshop \
  -e MYSQL_ROOT_PASSWORD=RoboShop@1 \
  roboshop/mysql
docker run -d --name redis --network roboshop roboshop/redis
docker run -d --name rabbitmq --network roboshop -p 15672:15672 roboshop/rabbitmq

# Backend services
docker run -d --name catalogue --network roboshop roboshop/catalogue
docker run -d --name user --network roboshop roboshop/user
docker run -d --name cart --network roboshop roboshop/cart
docker run -d --name shipping --network roboshop roboshop/shipping
docker run -d --name payment --network roboshop roboshop/payment

# Frontend (only exposed service)
docker run -d --name frontend --network roboshop -p 80:80 roboshop/frontend
```

---

## 🌐 Access Application

👉 Open in browser:
```
http://localhost
```

👉 RabbitMQ UI:
```
http://localhost:15672
```

---

## 🔐 Security Best Practices

- Use distroless images for runtime
- Avoid running containers as root
- Use environment variables for configuration
- Do not expose internal services
- Use Docker network for isolation

---

## ⚡ Important Learnings

- Difference between build-time vs runtime
- Why distroless improves security
- How microservices communicate via service names
- Why only frontend is exposed
- How databases are initialized automatically

---

<img width="2956" height="1484" alt="image" src="https://github.com/user-attachments/assets/34e48996-e39a-456b-82c3-b4dcd2dbdc1e" />



<img width="3024" height="1642" alt="image" src="https://github.com/user-attachments/assets/5b520b6f-1a54-4e7b-945f-1873074d6ee3" />


---

## 🚀 Future Enhancements

- Docker Compose integration
- Kubernetes (EKS) deployment
- CI/CD pipelines (GitHub Actions / Jenkins)
- Monitoring (Prometheus + Grafana)
- Secrets management

---

## 👨‍💻 Author

**Ramu Chelloju**  
DevOps & Cloud Enthusiast

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/ramuchelloju/)

> 📌 Follow me on LinkedIn: [linkedin.com/in/ramuchelloju](https://www.linkedin.com/in/ramuchelloju/)
