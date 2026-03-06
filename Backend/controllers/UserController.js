const db = require('../config/db');

// Get all users
exports.getAllUsers = (req, res) => {
  db.query('SELECT * FROM user', (err, results) => {
    if(err) return res.status(500).json({ error: err.message });
    res.json(results);
  });
};

// Get single user by ID
exports.getUserById = (req, res) => {
  const id = req.params.id;
  db.query('SELECT * FROM user WHERE id = ?', [id], (err, results) => {
    if(err) return res.status(500).json({ error: err.message });
    if(results.length === 0) return res.status(404).json({ message: 'User not found' });
    res.json(results[0]);
  });
};

// Create new user
exports.createUser = (req, res) => {
  const { name, email, password } = req.body;
  db.query('INSERT INTO user (name, email, password) VALUES (?, ?, ?)', 
    [name, email, password], (err, results) => {
      if(err) return res.status(500).json({ error: err.message });
      res.status(201).json({ message: 'User created', id: results.insertId });
    });
};