# 1️⃣ Imagen base
FROM python:3.11-slim

# 2️⃣ Configurar directorio de trabajo
WORKDIR /app

# 3️⃣ Copiar dependencias
COPY requirements.txt .

# 4️⃣ Instalar dependencias
RUN pip install --no-cache-dir -r requirements.txt

# 5️⃣ Copiar el resto del código
COPY . .

# 6️⃣ Comando por defecto (ajústalo según tu app)
CMD ["python", "main.py"]
