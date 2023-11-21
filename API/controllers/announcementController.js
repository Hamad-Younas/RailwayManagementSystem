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

module.exports = {
  addAnnouncement,
};
