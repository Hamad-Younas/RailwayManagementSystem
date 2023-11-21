const mongoose = require('mongoose');

const stationSchema = new mongoose.Schema({
    trainName: String,
    departureStation: String,
    arrivalStation:String,
    departureTime: String,
    arrivalTime: String,
    capacityforAC: Number,
    capacityforGeneral: Number,
    fareforGeneral:Number,
    fareforAC:Number,
    statusOfTrain:String,
    
}, { timestamps: true });

module.exports = mongoose.model('train', stationSchema);
