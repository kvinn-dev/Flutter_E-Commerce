const express = require('express');
const router = express.Router();

// contoh route GET /api/products
router.get('/', (req, res) => {
  res.json({ message: "Ini list produk" });
});

module.exports = router;