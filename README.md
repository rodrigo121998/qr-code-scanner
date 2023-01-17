# Documentación de la aplicación QR Code Scanner
## Requisitos previos
* Tener instalado Docker en la máquina en la que se desea ejecutar la aplicación.
* Tener una conexión a internet para descargar las dependencias necesarias.

* Si estás ejecutando esta aplicación en un sistema operativo distinto a Ubuntu 22.04, algunos comandos y configuraciones podrían ser diferentes.
## Descripción de la aplicación
QR Code Scanner es una aplicación web que permite al usuario cargar una imagen con un código QR y detectar y leer el texto contenido en el código QR. La aplicación también muestra la imagen con el código QR encerrado en un recuadro. La aplicación esta desarrollada con Flask y OpenCV.

## Instrucciones de instalación
1. Clona el repositorio en tu máquina
```
git clone https://github.com/tu-usuario/qr-code-scanner.git
```
2. Entra en el directorio del proyecto
```
cd qr-code-scanner
```
3. Construye la imagen de Docker utilizando el siguiente comando
```
docker build -t qr-code-scanner .
```

 *Si no se puede ejecutar el comando docker build -t qr-code-scanner . debido a problemas con permisos o conexión a internet, se puede descargar la imagen de Docker desde Docker Hub ejecutando el siguiente comando:*
 ```
 docker pull <username>/qr-code-scanner:latest
 ```
 <br>
4. Ejecuta el contenedor con el siguiente comando

```
docker run -p 8000:8000 qr-code-scanner
```

*Si descargaste la imagen de Docker Hub:*
```
docker run -p 8000:8000 <username>/qr-code-scanner
```
5. Accede a la aplicación en tu navegador en la dirección http://localhost:8000

## Uso de la aplicación
1. Accede a la aplicación en tu navegador en la dirección http://localhost:8000
2. Selecciona una imagen con un código QR en formato png, jpg o jpeg
3. Haz click en cargar imagen
4. La aplicación mostrará la imagen cargada a la izquierda y a la derecha la imagen con el qr detectado en un recuadro y el texto del qr
## Archivos incluidos
* main.py: contiene el detector y lector del qr
* index.py: contiene el codigo de flask
* templates/index.html: contiene el frontend de la aplicación

## Dependencias

* Flask
* OpenCV

## Limitaciones

* La aplicación solo acepta imagenes con extensiones png, jpg y jpeg.

* La aplicación solo detecta y lee un único código QR en la imagen cargada.

## Pasos para usar la aplicación en otra máquina
1. Asegúrate de tener Docker instalado en tu máquina.
2. Descarga el repositorio desde GitHub.
3. Sigue las instrucciones de instalación proporcionadas en esta documentación para construir la imagen de Docker y ejecutar la aplicación en tu máquina.
4. Accede a la aplicación en tu navegador en la dirección http://localhost:8000
Con estos pasos podrás ejecutar la aplicación en otra máquina y usarla de la misma manera que se describió anteriormente.

## Consideraciones
* Si estás ejecutando el contenedor en una máquina remota, como una instancia EC2 en Amazon Web Services, debes usar la dirección IP pública asignada a la instancia.
* Si ya existe algún proceso utilizando el puerto 8000, deberas cambiar el puerto de la aplicación, según se describió en anteriores comentarios.

## Notas
* El archivo .gitignore excluye la carpeta env para evitar problemas con la subida del proyecto a Github.
* En caso de tener problemas con la ejecución del contenedor, revisar las consideraciones y las soluciones mencionadas en los comentarios anteriores.