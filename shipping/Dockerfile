# ---------- Stage 1: Build ----------
FROM maven:3.9.14 AS builder

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests && \
    mv target/shipping-*.jar shipping.jar

# ---------- Stage 2: Runtime ----------
FROM gcr.io/distroless/java17-debian12:nonroot

WORKDIR /app

LABEL project="roboshop" \
      service="shipping" \
      owner="ramu"

EXPOSE 8080

COPY --from=builder /app/shipping.jar /app/shipping.jar


CMD ["shipping.jar"]
