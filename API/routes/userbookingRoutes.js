const express=require('express')
const userbookingController=require('../controllers/userbookingController');
const router=express.Router();

router.post('/userbooking',userbookingController.userBooking);


// // Define the route to get all train names
// router.get('/names', stationController.getAllTrainNames);
// router.get('/names', stationController.getAllTrainNames);
// router.get('/display', stationController.getAllAttributes);

module.exports=router;
