const express = require('express');
const reviewController = require('../controllers/reviewController');
const router = express.Router();

router.post('/addreview', reviewController.addreview);
router.get('/display', reviewController.getAllReviews);




module.exports = router;
