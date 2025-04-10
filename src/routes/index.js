const express = require('express');
const router = express.Router();

const productoController = require('../controllers/productoController');
const ventaController = require('../controllers/ventaController');
const adminController = require('../controllers/adminController');

// Cliente
router.get('/cliente/productos/buscar', productoController.buscarProducto);
router.get('/cliente/productos/tipo/:tipo_id', productoController.filtrarPorTipo);
router.get('/cliente/productos/ciudad/:ciudad_id', productoController.filtrarPorCiudad);

// Vendedor
router.get('/vendedor/:id/ventas', ventaController.listarPorVendedor);
router.get('/vendedor/ventas/fecha/:fecha', ventaController.buscarPorFecha);

// Admin
router.get('/admin/vendedores/sucursales', adminController.verSucursalesVendedores);

module.exports = router;