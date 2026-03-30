# 🚀 Roboshop Docker Platform

A **production-style microservices deployment** of the Roboshop application using Docker and Docker Compose.

This project demonstrates:

* Containerization of multi-language services
* Service orchestration using Docker Compose
* Multi-architecture builds using Docker Buildx
* Real-world DevOps practices (networking, volumes, debugging, optimization)

---

# 🧠 Architecture Overview

```
Frontend (Nginx)
        ↓
Backend Services (NodeJS / Java / Python)
        ↓
Databases & Messaging
```

### 🔗 Flow

* Frontend → Routes requests to backend services
* Backend → Handles business logic
* Databases → Store persistent data
* Messaging → Async communication

---

# 🧱 Services

## 🔹 Frontend

* Nginx-based reverse proxy
* Exposes application on port `80`

---

## 🔹 Backend Services

| Service   | Tech Stack | Dependencies   |
| --------- | ---------- | -------------- |
| Catalogue | NodeJS     | MongoDB        |
| User      | NodeJS     | MongoDB, Redis |
| Cart      | NodeJS     | Redis          |
| Shipping  | Java       | MySQL          |
| Payment   | Python     | RabbitMQ       |

---

## 🔹 Infrastructure Services

| Service  | Purpose                    |
| -------- | -------------------------- |
| MongoDB  | NoSQL DB (Catalogue, User) |
| MySQL    | Relational DB (Shipping)   |
| Redis    | Cache (Cart, User)         |
| RabbitMQ | Message Queue (Payment)    |

---

# 🐳 Docker Strategy

This project follows production-level container practices:

* ✅ Multi-stage builds for optimized images
* ✅ Distroless images (NodeJS services)
* ✅ Alpine-based images for lightweight containers
* ✅ Non-root users for security
* ✅ `.dockerignore` to reduce build context
* ✅ Multi-architecture images (ARM64 + AMD64)

---

# 🏗️ Multi-Architecture Build (Docker Buildx)

## 🧠 Problem

* Local system → **Mac (ARM64)**
* Cloud (EC2) → **AMD64**

👉 Caused error:

```
no matching manifest for linux/amd64
```

---

## ✅ Solution

Used Docker Buildx to build multi-platform images.

---

## 🔧 Build Commands

### 🔹 Cart

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-cart:1.0
./cart
--push

---

### 🔹 User

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-user:1.0
./user
--push

---

### 🔹 Catalogue

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-catalogue:1.0
./catalogue
--push

---

### 🔹 Shipping

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-shipping:1.0
./shipping
--push

---

### 🔹 Payment

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-payment:1.0
./payment
--push

---

### 🔹 Frontend

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-frontend:1.0
./frontend
--push

---

### 🔹 MySQL

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-mysql:1.0
./mysql
--push

---

### 🔹 MongoDB

docker buildx build
--platform linux/amd64,linux/arm64
-t chelloju/roboshop-mongodb:1.0
./mongodb
--push

---

## ⚠️ Note

All images support:

* ARM64 → Local (Mac)
* AMD64 → Cloud (EC2)

👉 Build once → Run anywhere

---

# 📦 Image Registry

All images are hosted on Docker Hub:

```
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

# ⚙️ Running the Application

## 1️⃣ Clone Repository

```
git clone https://github.com/chellojuramu/roboshop-docker-platform.git
cd roboshop-docker-platform
```

---

## 2️⃣ Create Environment File

```
touch .env
```

Add:

```
MYSQL_ROOT_PASSWORD=RoboShop@1
RABBITMQ_DEFAULT_USER=roboshop
RABBITMQ_DEFAULT_PASS=roboshop123
```

---

## 3️⃣ Start Services

```
docker compose up -d
```

---

## 4️⃣ Access Application

```
http://localhost
```

---

## 5️⃣ RabbitMQ UI

```
http://localhost:15672
```

| Field    | Value       |
| -------- | ----------- |
| Username | roboshop    |
| Password | roboshop123 |

---

# 💾 Data Persistence

| Service | Volume       |
| ------- | ------------ |
| MySQL   | ✅ Persistent |
| MongoDB | ✅ Persistent |
| Redis   | ❌ Cache only |

---

# 🔐 Security Practices

* No hardcoded secrets (used `.env`)
* Non-root containers
* Minimal base images (Alpine / Distroless)
* Reduced attack surface

---

# 🧠 Key Concepts Covered

* Dockerfile (FROM, RUN, COPY, ENV, CMD, ENTRYPOINT)
* Multi-stage builds
* Docker networking (service discovery via DNS)
* Docker volumes (stateful vs stateless)
* Docker Compose (multi-service orchestration)
* Image registry (Docker Hub)
* Multi-architecture builds (Buildx)
* Debugging real-world issues:

    * Architecture mismatch
    * Disk space (`/var` issue)

---

# 🧠 Key Learnings

* Difference between dev vs prod container strategy
* Importance of platform compatibility
* Docker storage management
* Service dependency handling
* Microservices communication

---

# 🚀 Future Improvements

* Add health checks (service readiness)
* Integrate Trivy (security scanning)
* CI/CD pipeline (GitHub Actions / Jenkins)
* Kubernetes deployment (EKS)
* Secrets management (Vault / AWS Secrets Manager)

---

# 👨‍💻 Author

**Ramu Chelloju**
DevOps & Cloud Enthusiast

🔗 https://www.linkedin.com/in/ramuchelloju/
