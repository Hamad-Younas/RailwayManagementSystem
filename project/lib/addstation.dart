import 'package:flutter/material.dart';

class AddStationScreen extends StatelessWidget {
  // Add controllers for text fields
  final TextEditingController trainNameController = TextEditingController();
  final TextEditingController departureStationController = TextEditingController();
  final TextEditingController arrivalStationController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController arrivalTimeController = TextEditingController();
  final TextEditingController capacityForACController = TextEditingController();
  final TextEditingController capacityForGeneralController = TextEditingController();
  final TextEditingController fareForGeneralController = TextEditingController();
  final TextEditingController fareForACController = TextEditingController();
  final TextEditingController statusOfTrainController = TextEditingController();
  final List<String> trainStatuses = ['Active', 'Inactive', 'Delayed'];
  String selectedTrainStatus = 'Active'; // Set a default value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Station'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 800,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12,
              top: 30,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 30,
                  child: Text(
                    'WELCOME',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            // Train Name Textfield
            Positioned(
              left: 12,
              top: 60,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: trainNameController,
                    decoration: InputDecoration(labelText: 'Train Name'),
                  ),
                ),
              ),
            ),
            // Departure Station Textfield
            Positioned(
              left: 12,
              top: 120,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: departureStationController,
                    decoration: InputDecoration(labelText: 'Departure Station'),
                  ),
                ),
              ),
            ),
            // Arrival Station Textfield
            Positioned(
              left: 12,
              top: 180,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: arrivalStationController,
                    decoration: InputDecoration(labelText: 'Arrival Station'),
                  ),
                ),
              ),
            ),
            // Departure Time Textfield
            Positioned(
              left: 12,
              top: 240,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: departureTimeController,
                    decoration: InputDecoration(labelText: 'Departure Time'),
                  ),
                ),
              ),
            ),
            // Arrival Time Textfield
            Positioned(
              left: 12,
              top: 300,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: arrivalTimeController,
                    decoration: InputDecoration(labelText: 'Arrival Time'),
                  ),
                ),
              ),
            ),
            // Capacity for AC Textfield
            Positioned(
              left: 12,
              top: 360,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: capacityForACController,
                    decoration: InputDecoration(labelText: 'Capacity for AC'),
                  ),
                ),
              ),
            ),
            // Capacity for General Textfield
            Positioned(
              left: 12,
              top: 420,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: capacityForGeneralController,
                    decoration: InputDecoration(labelText: 'Capacity for General'),
                  ),
                ),
              ),
            ),
            // Fare for General Textfield
            Positioned(
              left: 12,
              top: 480,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: fareForGeneralController,
                    decoration: InputDecoration(labelText: 'Fare for General'),
                  ),
                ),
              ),
            ),
            // Fare for AC Textfield
            Positioned(
              left: 12,
              top: 540,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: fareForACController,
                    decoration: InputDecoration(labelText: 'Fare for AC'),
                  ),
                ),
              ),
            ),
            // Status of Train Dropdown
            Positioned(
              left: 12,
              top: 620,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: DropdownButtonFormField<String>(
                    value: selectedTrainStatus,
                    items: trainStatuses.map((status) {
                      return DropdownMenuItem<String>(
                        value: status,
                        child: Text(status),
                      );
                    }).toList(),
                    onChanged: (value) {
                      // Update the selected train status
                      selectedTrainStatus = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Status of Train',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ),
            // Continue Button (Adjusted top position)
            Positioned(
              left: 59,
              top: 890,
              child: Align(
                child: SizedBox(
                  width: 252,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      // Call the function to add the station
                      addStation(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff5fb0fb),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Back Button (Adjusted top position)
            Positioned(
              left: 12,
              top: 950,
              child: Align(
                child: SizedBox(
                  width: 40,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to the previous screen
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff5fb0fb),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to add the station
  void addStation(BuildContext context) {
    // Implement the logic to add the station here
    // You can access the entered values using the controllers
    // For example: trainNameController.text, departureStationController.text, etc.
  }
}

