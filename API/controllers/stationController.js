const station = require('../models/station'); // Make sure to adjust the path based on your project structure

async function addStation(req, res) {
  try {
    // Save the user to the database
    const user = await station.create(req.body);
    res.status(201).json({ status: true, message: 'Station added successfully', user });
  } catch (error) {
    console.error(error);  // Log the error for debugging purposes
    res.status(400).json({ status: false, message: 'Station addition failed', error: error.message });
  }
}

module.exports = {
    addStation,
    };
