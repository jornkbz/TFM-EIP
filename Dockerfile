FROM python:3.9-slim

WORKDIR /app

# --- NUEVO PASO ---
# Actualizamos el sistema e instalamos 'build-essential' (incluye gcc)
# Luego borramos la caché de apt para mantener la imagen ligera
RUN apt-get update && apt-get install -y \
    build-essential \
    fonts-liberation \
    libxft-dev \
    libfreetype6-dev \
    && rm -rf /var/lib/apt/lists/*
# ------------------

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8501

ENTRYPOINT ["streamlit", "run", "Streamlit_app/0_AAP_Home.py", "--server.port=8501", "--server.address=0.0.0.0"]