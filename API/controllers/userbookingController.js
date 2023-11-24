const Booking = require('../models/userbooking'); // Adjust the path based on your project structure

async function userBooking(req, res) {
  try {
    // Save the announcement to the database
    const createdBooking= await Booking.create(req.body);
    res.status(201).json({ status: true, message: 'Booking added successfully', Booking: createdBooking });
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(400).json({ status: false, message: 'Booking addition failed', error: error.message });
  }
}

module.exports = {
    userBooking,
};
