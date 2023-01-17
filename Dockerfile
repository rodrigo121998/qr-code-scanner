# Utilizamos una imagen de python como base
FROM python:3.7.7

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos los archivos necesarios
COPY requirements.txt .
COPY src/main.py src/
COPY index.py src/
COPY templates/ templates/

# Instalamos las dependencias
RUN pip install -r requirements.txt --user

# Exponemos el puerto
EXPOSE 5000

# Ejecutamos la aplicación
CMD ["python", "src/index.py"]