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
    res.status(200).json({ status: true, trainNames });
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(500).json({ status: false, message: 'Error getting train names', error: error.message });
  }
}

module.exports = {
  addTrain,
  getAllTrainNames,
};
