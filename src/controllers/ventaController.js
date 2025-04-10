const db = require('../config/db');

exports.listarPorVendedor = (req, res) => {
  db.query(
    `SELECT v.id, p.nombre AS producto, c.nombre AS cliente, v.fecha 
     FROM venta v
     JOIN producto p ON v.producto_id = p.id
     JOIN cliente c ON v.cliente_id = c.id
     WHERE v.vendedor_id = ?`,
    [req.params.id],
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    }
  );
};

exports.buscarPorFecha = (req, res) => {
  db.query(
    `SELECT v.id, p.nombre AS producto, c.nombre AS cliente, v.fecha 
     FROM venta v
     JOIN producto p ON v.producto_id = p.id
     JOIN cliente c ON v.cliente_id = c.id
     WHERE v.fecha = ?`,
    [req.params.fecha],
    (err, results) => {
      if (err) return res.status(500).send(err);
      res.json(results);
    }
  );
};