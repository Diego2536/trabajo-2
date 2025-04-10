const db = require('../config/db');

exports.verSucursalesVendedores = (req, res) => {
  db.query(
    `SELECT v.nombre AS vendedor, s.nombre AS sucursal, c.nombre AS ciudad 
     FROM vendedor v
     JOIN sucursal s ON v.sucursal_id = s.id
     JOIN ciudad c ON s.ciudad_id = c.id`,
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    }
  );
};