FROM python:3.12-slim

RUN apt-get update
RUN apt-get install nano

# Устанавливаем ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем все файлы
COPY requirements.txt .
COPY . .

# Устанавливаем Python-зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Создаём папки
RUN mkdir -p highlights segments templates

# expose порт
EXPOSE 5000

# запуск Flask
CMD ["python", "app.py"]