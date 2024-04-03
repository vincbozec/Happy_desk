# Utilisation de l'image Python officielle comme image de base
FROM python:3.9-slim

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Copie des fichiers de l'application dans le conteneur
COPY app.py /app
COPY test_app.py /app
COPY requirements.txt /app

# Installation des dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposition du port utilisé par l'application
EXPOSE 5000

# Commande pour démarrer l'application avec Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
