# Используйте официальный образ Golang
FROM golang:1.17 AS builder

# Установите рабочий каталог
WORKDIR /app

# Скопируйте исходный код в контейнер
COPY . .

# Соберите приложение
RUN go build -o myapp

# Настройте исполняемый контейнер
FROM debian:buster-slim
COPY --from=builder /app/myapp /myapp
ENTRYPOINT ["/myapp"]

# curl -i http://localhost:8080   запустить в другом терминале
