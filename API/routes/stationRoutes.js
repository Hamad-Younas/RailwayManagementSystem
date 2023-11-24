const express=require('express')
const stationController=require('../controllers/stationController');
const router=express.Router();

router.post('/addstation',stationController.addStation);
router.get('/display',stationController.getAllAttributes);
router.put('/:id',stationController.updateStation);


module.exports=router;
