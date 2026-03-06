const pool = require('../config/db');

const getProducts = async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM roducts');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Database error' });
  }
};

module.exports = { getProducts };