const express=require('express')
const productController=require('../controllers/userController');
const router=express.Router();
router.put('/:id',productController.updateProduct);
// router.post('/',productController.createProduct);
// router.get('/',productController.getAllProducts);
router.delete('/:id',productController.deleteProduct);
router.post('/signup',productController.signupFunc);
router.post('/signin',productController.loginfunc);




module.exports=router;
