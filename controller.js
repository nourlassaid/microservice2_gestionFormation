//controller.js
const db = require('./db');

// Récupérer toutes les formations
exports.getFormations = (req, res) => {
  db.query('SELECT * FROM formations', (err, rows) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
      res.status(500).json({ message: 'Erreur lors de la récupération des formations.' });
      return;
    }
    res.json(rows);
  });
};

// Récupérer une formation par son ID
exports.getFormationById = (req, res) => {
  const id = req.params.id;
  db.query('SELECT * FROM formations WHERE id = ?', [id], (err, rows) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
      res.status(500).json({ message: 'Erreur lors de la récupération de la formation.' });
      return;
    }
    if (rows.length === 0) {
      res.status(404).json({ message: 'Formation non trouvée.' });
      return;
    }
    res.json(rows[0]);
  });
};

// Ajouter une nouvelle formation
exports.addFormation = (req, res) => {
  const { nom, description, date_debut, date_fin, lieu } = req.body;
  const sql = 'INSERT INTO formations (nom, description, date_debut, date_fin, lieu) VALUES (?, ?, ?, ?, ?)';
  db.query(sql, [nom, description, date_debut, date_fin, lieu], (err, result) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
      res.status(500).json({ message: 'Erreur lors de l\'ajout de la formation.' });
      return;
    }
    res.json({ message: 'Formation ajoutée avec succès.', id: result.insertId });
  });
};

// Mettre à jour une formation
exports.updateFormation = (req, res) => {
  const id = req.params.id;
  const { nom, description, date_debut, date_fin, lieu } = req.body;
  const sql = 'UPDATE formations SET nom = ?, description = ?, date_debut = ?, date_fin = ?, lieu = ? WHERE id = ?';
  db.query(sql, [nom, description, date_debut, date_fin, lieu, id], (err, result) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
      res.status(500).json({ message: 'Erreur lors de la mise à jour de la formation.' });
      return;
    }
    res.json({ message: 'Formation mise à jour avec succès.', id: id });
  });
};

// Supprimer une formation
exports.deleteFormation = (req, res) => {
  const id = req.params.id;
  db.query('DELETE FROM formations WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
      res.status(500).json({ message: 'Erreur lors de la suppression de la formation.' });
      return;
    }
    res.json({ message: 'Formation supprimée avec succès.', id: id });
  });
};// controller.js

// controller.js


// Rechercher des formations par terme de recherche
exports.searchFormations = (req, res) => {
  const searchTerm = req.query.q; // Le terme de recherche est passé en tant que paramètre de requête

  // Vérifier si aucun terme de recherche n'a été fourni
  if (!searchTerm) {
    // Si aucun terme de recherche n'est fourni, renvoyer toutes les formations
    db.query('SELECT * FROM formations', (err, rows) => {
      if (err) {
        console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
        res.status(500).json({ message: 'Erreur lors de la récupération des formations.' });
        return;
      }
      res.json(rows);
    });
  } else {
    // Utiliser une requête SQL pour rechercher les formations par nom
    const sql = 'SELECT * FROM formations WHERE nom LIKE ?'; // Recherche par le nom de la formation
    const searchTermLike = `%${searchTerm}%`; // Ajouter des jokers pour rechercher les correspondances partielles

    db.query(sql, [searchTermLike], (err, rows) => {
      if (err) {
        console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
        res.status(500).json({ message: 'Erreur lors de la recherche des formations.' });
        return;
      }
      res.json(rows);
    });
  }
};