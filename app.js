const express = require('express');
const cors = require('cors');
const formationsRouter = require('./routes');

const app = express();

// Middleware pour activer CORS
app.use(cors());

// Middleware pour analyser le corps des requêtes en JSON
app.use(express.json());

// Utiliser le routeur des formations
app.use('/api', formationsRouter);

// Middleware pour gérer les erreurs de route
app.use((req, res, next) => {
  const error = new Error('Not found');
  error.status = 404;
  next(error);
});

// Middleware pour gérer les autres erreurs
app.use((error, req, res, next) => {
  res.status(error.status || 500);
  res.json({
    error: {
      message: error.message
    }
  });
});

// Démarrer le serveur
const PORT = process.env.PORT || 4009;
app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});