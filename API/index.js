const express = require('express');
const bodyParser = require('body-parser');
require('./utils/db'); // Assuming you have your database connection in this file
const productRoutes = require('./routes/userRoutes');
const trainRoutes = require('./routes/trainRoutes');
const stationRoutes = require('./routes/stationRoutes');
const announcementRoutes = require('./routes/announcementRoutes');
const userbookingRoutes=require('./routes/userbookingRoutes');

const app = express();
const port = 3200;

app.use(bodyParser.json()); // Parse JSON data
app.use(express.json()); // Alternative method to parse JSON data

app.use('/api/products', productRoutes);
app.use('/api/train', trainRoutes);
app.use('/api/station', stationRoutes);
app.use('/api/announcement', announcementRoutes);
app.use('/api/booking', userbookingRoutes);


app.get('/', (req, res) => {
  res.send('Welcome to the wishma');
});

app.listen(port, () => {
  console.log('Server is listening on port ' + port);
});
