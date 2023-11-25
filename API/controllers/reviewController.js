const review = require('../models/review'); // Adjust the path based on your project structure

async function addreview(req, res) {
  try {
    // Save the announcement to the database
    const createdreview = await review.create(req.body);
    res.status(201).json({ status: true, message: 'review added successfully', review: createdreview });
  } catch (error) {
    console.error(error); // Log the error for debugging purposes
    res.status(400).json({ status: false, message: 'review addition failed', error: error.message });
  }
}
async function getAllReviews(req, res) {
  try {
    const reviews = await review.find({}, { _id: 0, review: 1 });
    res.json(reviews.map(review => review.review));
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
}


module.exports = {
  addreview,getAllReviews,
};
