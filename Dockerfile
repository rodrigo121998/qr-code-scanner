# Usa una imagen base de Ubuntu 22.04
FROM ubuntu:22.04

# Actualiza los paquetes del sistema y actualiza
RUN apt-get update && apt-get -y upgrade

# Instala las dependencias necesarias para tu aplicación
RUN apt-get install -y libgl1-mesa-glx libgl1-mesa-dev
RUN apt-get install -y python3-pip python3-dev build-essential libglib2.0-0 libsm6 libxext6 libxrender-dev

# Crea un directorio para tu aplicación y copia los archivos necesarios dentro de él
RUN mkdir /app
COPY . /app

# Cambia el directorio a /app
WORKDIR /app

# Instala las dependencias de Python
RUN pip3 install --no-cache-dir -r requirements.txt --user

# EXPONE el puerto 8000
EXPOSE 8000

# Ejecuta tu aplicación
CMD ["python3", "index.py"]