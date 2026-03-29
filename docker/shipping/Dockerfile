# ---------- Stage 1: Build ----------
FROM maven:3.9.11-eclipse-temurin-17 AS builder

WORKDIR /build

# Copy only pom.xml first (for caching)
COPY pom.xml .

# Download dependencies (cache layer)
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build application
RUN mvn clean package -DskipTests && \
    mv target/shipping-*.jar /build/shipping.jar


# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/java17-debian12:nonroot

WORKDIR /app

# Metadata
LABEL project="roboshop" \
      service="shipping" \
      owner="ramu"

# Copy jar file from builder
COPY --from=builder /build/shipping.jar /app/shipping.jar

# Environment variables
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"

# Internal port documentation
EXPOSE 8080

# Run application
CMD ["shipping.jar"]