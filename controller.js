const db = require('./db');

// Récupérer toutes les formations
const getFormations = (req, res) => {
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
const getFormationById = (req, res) => {
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
const addFormation = (req, res) => {
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
const updateFormation = (req, res) => {
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
const deleteFormation = (req, res) => {
  const id = req.params.id;
  db.query('DELETE FROM formations WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error('Erreur lors de l\'exécution de la requête : ' + err.stack);
      res.status(500).json({ message: 'Erreur lors de la suppression de la formation.' });
      return;
    }
    res.json({ message: 'Formation supprimée avec succès.', id: id });
  });
};

module.exports = {
  getFormations,
  getFormationById,
  addFormation,
  updateFormation,
  deleteFormation
};