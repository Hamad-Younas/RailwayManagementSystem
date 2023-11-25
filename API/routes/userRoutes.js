const express = require('express');
const productController = require('../controllers/userController');
const router = express.Router();

router.put('/:id', productController.updateProduct);
router.post('/signup', productController.signupFunc);
router.post('/signin', productController.loginfunc);
router.get('/display', productController.getAllProducts);
router.delete('/deleteUser/:id', productController.deleteProduct);

module.exports = router;
