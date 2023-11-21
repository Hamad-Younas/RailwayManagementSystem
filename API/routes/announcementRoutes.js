const express = require('express');
const announcementController = require('../controllers/announcementController');
const router = express.Router();

router.post('/addannouncement', announcementController.addAnnouncement);

module.exports = router;
