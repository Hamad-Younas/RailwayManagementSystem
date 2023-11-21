const mongoose = require('mongoose');

const productSchema = new mongoose.Schema({
    firstName: String,
    lastName: String,
    email:String,
    password: String,
    address: String,
    phoneno: String,
}, { timestamps: true });

module.exports = mongoose.model('Products', productSchema);
