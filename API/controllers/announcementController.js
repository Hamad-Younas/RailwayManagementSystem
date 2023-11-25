const announcement = require('../models/announcement');
const Announcement = require('../models/announcement'); // Adjust the path based on your project structure

async function addAnnouncement(req, res) {
  try {
    // Save the announcement to the database
    const createdAnnouncement = await Announcement.create(req.body);
    res.status(201).json({ status: true, message: 'Announcement added successfully', announcement: createdAnnouncement });
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(400).json({ status: false, message: 'Announcement addition failed', error: error.message });
  }
}
async function getAllAnnouncements(req, res) {
  try {
    const announcements = await Announcement.find({}, 'announcement -_id');
    // Extract only the values of the 'announcement' field
    const announcementValues = announcements.map((announcement) => announcement.announcement);
    res.json(announcementValues);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}
async function getAnnounce(req, res) {
  try {
    // Fetch all distinct train names from the Train collection
    const announcement = await Announcement.distinct('announcement');
   
    
    // Return the results as an object
    res.status(200).json({ announcement});
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(500).json({ status: false, message: 'Error getting station attributes', error: error.message });
  }
}
async function deleteAnnouncement(req, res) {
  try {
      const { title } = req.params;
      console.log(`Deleting announcement with title: ${title}`);
      const deletedAnnouncement = await Announcement.findOneAndDelete({ announcement: title });

      if (!deletedAnnouncement) {
          return res.status(404).json({ message: 'Announcement not found' });
      }

      res.sendStatus(204);
  } catch (err) {
      console.error(err);
      res.status(500).json({ error: 'Internal Server Error' });
  }
}



module.exports = {
  addAnnouncement,getAllAnnouncements,getAnnounce,deleteAnnouncement,
};
