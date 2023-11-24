const Train = require('../models/train'); // Make sure to adjust the path based on your project structure

async function addTrain(req, res) {
  try {
    // Save the user to the database
    const user = await Train.create(req.body);
    res.status(201).json({ status: true, message: 'Train added successfully', user });
  } catch (error) {
    console.error(error);  // Log the error for debugging purposes
    res.status(400).json({ status: false, message: 'Train addition failed', error: error.message });
  }
}

async function getAllTrainNames(req, res) {
  try {
    // Fetch all distinct train names from the Train collection
    const trainNames = await Train.distinct('trainName');
    res.status(200).json({ trainNames }); // Corrected this line
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(500).json({ status: false, message: 'Error getting train names', error: error.message });
  }
}
async function getAllAttributes(req, res) {
  try {
    // Fetch all distinct values for each variable from the Station collection
    const trainNames = await Train.distinct('trainName');
    const departureStations = await Train.distinct('departureStation');
    const arrivalStations = await Train.distinct('arrivalStation');
    const departureTimes = await Train.distinct('departureTime');
    const arrivalTimes = await Train.distinct('arrivalTime');
    const capacitiesForAC = await Train.distinct('capacityforAC');
    const capacitiesForGeneral = await Train.distinct('capacityforGeneral');
    const faresForGeneral = await Train.distinct('fareforGeneral');
    const faresForAC = await Train.distinct('fareforAC');
    const statusesOfTrain = await Train.distinct('statusOfTrain');

    // Return the results as an object
    res.status(200).json({
      trainNames,
      departureStations,
      arrivalStations,
      departureTimes,
      arrivalTimes,
      capacitiesForAC,
      capacitiesForGeneral,
      faresForGeneral,
      faresForAC,
      statusesOfTrain,
    });
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(500).json({ status: false, message: 'Error getting station attributes', error: error.message });
  }
}



module.exports = {
  addTrain,getAllAttributes,
  getAllTrainNames,
};
