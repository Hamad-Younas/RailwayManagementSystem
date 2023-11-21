const express=require('express')
const stationController=require('../controllers/stationController');
const router=express.Router();

router.post('/addstation',stationController.addStation);


module.exports=router;
