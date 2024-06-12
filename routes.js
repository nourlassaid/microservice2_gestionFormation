   //roures.js
const express = require('express');
const router = express.Router();
const controllers = require('./controller');

// Route pour récupérer toutes les formations
router.get('/formations', controllers.getFormations);

// Route pour récupérer une formation par son ID
router.get('/formations/:id', controllers.getFormationById);

// Route pour ajouter une nouvelle formation
router.post('/formations', controllers.addFormation);

// Route pour mettre à jour une formation par son ID
router.put('/formations/:id', controllers.updateFormation);

// Route pour supprimer une formation par son ID
router.delete('/formations/:id', controllers.deleteFormation);
router.get('/formations/search', controllers.searchFormations);

module.exports = router;
