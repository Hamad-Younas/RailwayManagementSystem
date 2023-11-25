const express = require('express');
const announcementController = require('../controllers/announcementController');
const router = express.Router();

router.post('/addannouncement', announcementController.addAnnouncement);
router.get('/display', announcementController.getAllAnnouncements);
router.get('/announce', announcementController.getAnnounce);
// router.delete('/delete', announcementController.deleteAnnouncement);
router.delete('/deleteAnnouncement/:title', announcementController.deleteAnnouncement);

module.exports = router;
