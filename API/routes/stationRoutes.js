const express=require('express')
const stationController=require('../controllers/stationController');
const station = require('../models/station');
const router=express.Router();

router.post('/addstation',stationController.addStation);
router.get('/display',stationController.getAllAttributes);
router.put('/:id',stationController.updateStation);

router.get('/displaystations', stationController.getStations);
module.exports=router;
