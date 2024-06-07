# Use the official MySQL image from the Docker Hub
FROM mysql:8.0.36

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=formation_management

# Copy the SQL dump file to the Docker container
COPY init.sql /docker-entrypoint-initdb.d/

# Expose the default MySQL port
EXPOSE 3305
