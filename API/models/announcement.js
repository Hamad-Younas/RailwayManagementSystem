const mongoose = require('mongoose');

const announcementSchema = new mongoose.Schema({
    announcement: String,
   
    
}, { timestamps: true });

module.exports = mongoose.model('announcement', announcementSchema);