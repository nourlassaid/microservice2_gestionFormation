//microservices_formation 
const express = require('express');
const cors = require('cors');
const formationsRouter = require('./routes');

const client = require('prom-client')



const app = express();

// Enable Prometheus metrics collection
const register = new client.Registry();
client.collectDefaultMetrics({ register });

// Create a histogram metric for formation-ms service
const formationRequestDurationMicroseconds = new client.Histogram({
  name: 'formation_request_duration_seconds',
  help: 'Duration of formation-ms service HTTP requests in microseconds',
  labelNames: ['method', 'route', 'code'],
  buckets: [0.1, 0.3, 0.5, 0.7, 1, 3, 5, 7, 10]
});

// Register the histogram for formation-ms service
register.registerMetric(formationRequestDurationMicroseconds);

// Middleware to measure request duration for formation-ms service
app.use((req, res, next) => {
  const end = formationRequestDurationMicroseconds.startTimer();
  res.on('finish', () => {
    end({ method: req.method, route: req.url, code: res.statusCode });
  });
  next();
});

// Route to expose Prometheus metrics
app.get('/metrics', async (req, res) => {
  try {
    const metrics = await register.metrics();
    res.set('Content-Type', register.contentType);
    res.end(metrics);
  } catch (error) {
    console.error('Error generating metrics:', error);
    res.status(500).send('Error generating metrics');
  }
});

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
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});