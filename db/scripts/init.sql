CREATE DATABASE IF NOT EXISTS formation_management;

USE formation_management;

CREATE TABLE IF NOT EXISTS formations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT,
    date_debut DATE,
    date_fin DATE,
    lieu VARCHAR(255)
);
