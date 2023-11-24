const express=require('express')
const stationController=require('../controllers/trainController');
const router=express.Router();

router.post('/addtrain',stationController.addTrain);


// // Define the route to get all train names
// router.get('/names', stationController.getAllTrainNames);
router.get('/names', stationController.getAllTrainNames);
router.get('/display', stationController.getAllAttributes);

module.exports=router;
