# Utiliser une image officielle MySQL comme image de base
FROM mysql:5.7

# Définir les variables d'environnement pour la configuration de MySQL
ENV MYSQL_ROOT_PASSWORD=0000
ENV MYSQL_DATABASE=formation_management
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=0000

# Copier les scripts de base de données dans le conteneur
COPY ./scripts /docker-entrypoint-initdb.d/
