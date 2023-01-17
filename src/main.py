import cv2
import numpy as np
from flask import jsonify
import base64


def qr_decode(request):
    # Obtener imagen desde el cuerpo de la petición
    image = request.files.get('image').read()
    # Convertir imagen a formato OpenCV
    image = np.frombuffer(image, np.uint8)
    image = cv2.imdecode(image, cv2.IMREAD_UNCHANGED)

    # Inicializar detector de QR
    qr_detector = cv2.QRCodeDetector()

    # Detectar QR
    data, bbox, _ = qr_detector.detectAndDecode(image)

    if data:
        for i in range(len(bbox[0])):
            image=cv2.line(image, tuple(bbox[0][i].astype(int)), tuple(bbox[0][(i + 1) % len(bbox[0])].astype(int)), color=(255, 0, 0), thickness=5)
        # Codificar imagen en base64
        image = cv2.imencode('.jpg', image)[1]
        image = base64.b64encode(image).decode()
        # Crear respuesta
        response = {
            'data': str(data),
            'bbox': str(bbox),
            'qr_img': str(image),
            'status_code':200
        }
    else:
        response = {
            'data': 'QR no detectado',
            'status_code':404
        }
    return response