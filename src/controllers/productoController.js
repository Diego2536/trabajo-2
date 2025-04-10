const db = require('../config/db');

exports.buscarProducto = (req, res) => {
  const { nombre } = req.query;
  db.query(
    `SELECT p.*, c.nombre AS ciudad 
     FROM producto p
     JOIN ciudad c ON p.ciudad_id = c.id
     WHERE p.nombre LIKE ?`,
    [`%${nombre}%`],
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    }
  );
};

exports.filtrarPorTipo = (req, res) => {
  db.query(
    'SELECT * FROM producto WHERE tipo_id = ?',
    [req.params.tipo_id],
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    }
  );
};

exports.filtrarPorCiudad = (req, res) => {
  db.query(
    `SELECT p.*, c.nombre AS ciudad 
     FROM producto p
     JOIN ciudad c ON p.ciudad_id = c.id
     WHERE p.ciudad_id = ?`,
    [req.params.ciudad_id],
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    }
  );
};