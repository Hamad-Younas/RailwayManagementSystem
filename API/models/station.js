const mongoose = require('mongoose');

const stationSchema = new mongoose.Schema({
    stationName: String,
    stationLocation: String,
   
    
}, { timestamps: true });

module.exports = mongoose.model('station', stationSchema);