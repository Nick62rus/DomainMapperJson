# Первый этап: генерация файла
FROM python:3.9-slim as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Запускаем скрипт для генерации файла
RUN python main.py

# Второй этап: создание финального образа
FROM alpine:3.18

WORKDIR /output

# Копируем сгенерированный файл из первого этапа
COPY --from=builder /app/ipset.json .

# Этот контейнер завершится, но файл останется на хосте
