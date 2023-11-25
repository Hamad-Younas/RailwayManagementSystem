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
async function getAllAttributes(req, res) {
  try {
    // Fetch all distinct train names from the Train collection
    const stationNames = await station.distinct('stationName');
    const stationLocations = await station.distinct('stationLocation');
    
    // Return the results as an object
    res.status(200).json({ stationNames, stationLocations });
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(500).json({ status: false, message: 'Error getting station attributes', error: error.message });
  }
}
async function updateStation(req, res) {
  try {
    const { id } = req.params;

    // Validate req.body here if needed

    const updateStation = await station.findByIdAndUpdate(id, req.body, { new: true });

    if (!updateStation) {
      // If the station with the given ID is not found
      return res.status(404).json({ error: 'Station not found' });
    }

    // Log the update for debugging purposes
    console.log('Updated Station:', updateStation);

    // Respond with a 200 OK or 204 No Content status
    res.status(200).json(updateStation);
  } catch (err) {
    // Log the error for debugging purposes
    console.error('Error updating station:', err);

    // Handle other errors with a 500 Internal Server Error status
    res.status(500).json({ error: err.message });
  }
}

async function getStations(req, res) {
  try {
    // Fetch all distinct train names from the Train collection
    const stationNames = await station.distinct('stationName');
   
    
    // Return the results as an object
    res.status(200).json({ stationNames});
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(500).json({ status: false, message: 'Error getting station attributes', error: error.message });
  }
}

module.exports = {
    addStation,getAllAttributes,updateStation,getStations,
    };
