const mongoose = require('mongoose');

const userbookingSchema = new mongoose.Schema({
    name: String,
    email: String,
    train:String,
    category: String,
    seats: String,
    fare: String,
}, { timestamps: true });

module.exports = mongoose.model('userbooking', userbookingSchema);
