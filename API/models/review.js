const mongoose = require('mongoose');

const reviewSchema = new mongoose.Schema({
    review: String,
   
    
}, { timestamps: true });

module.exports = mongoose.model('review', reviewSchema);