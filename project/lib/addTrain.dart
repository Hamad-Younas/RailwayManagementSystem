import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/signin.dart';
import 'package:project/userenteringpage.dart';
import 'config.dart';

class AddTrainScreen extends StatelessWidget {
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
  String selectedTrainStatus = 'Active';

  void registerTrain(BuildContext context) async {
    if (!trainNameController.text.isEmpty ||
        !departureStationController.text.isEmpty ||
        !arrivalStationController.text.isEmpty ||
        !departureTimeController.text.isEmpty ||
        !arrivalTimeController.text.isEmpty ||
        !capacityForACController.text.isEmpty ||
        !capacityForGeneralController.text.isEmpty ||
        !fareForGeneralController.text.isEmpty ||
        !fareForACController.text.isEmpty ||
        !statusOfTrainController.text.isEmpty) {
      var regBody = {
        "trainName": trainNameController.text,
        "departureStation": departureStationController.text,
        "arrivalStation": arrivalStationController.text,
        "departureTime": departureTimeController.text,
        "arrivalTime": arrivalTimeController.text,
        "capacityforAC": capacityForACController.text,
        "capacityforGeneral": capacityForGeneralController.text,
        "fareforGeneral": fareForGeneralController.text,
        "fareforAC": fareForACController.text,
        "statusOfTrain": statusOfTrainController.text,
      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.10.31:3200/api/train/addtrain'),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(regBody),
        );

        if (response.statusCode == 200) {
          if (response.headers['content-type']?.toLowerCase() ==
              'application/json') {
            var jsonresponse = jsonDecode(response.body);
            print(jsonresponse['status']);
            if (jsonresponse['status']) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => userEnter()),
              );
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Registration failed'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          } else {
            print("Non-JSON response: ${response.body}");
          }
        } else {
          print("Error: ${response.statusCode}");
          print("Response: ${response.body}");
        }
      } catch (e) {
        print("Error: $e");
      }
    } else {
      // Perform additional logic for empty fields if needed
    }
  }

  void saveData(BuildContext context) {
    // Implement the logic to save the data here
    // You can access the entered values using the controllers
    // For example: trainNameController.text, departureStationController.text, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Trains'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
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
                      registerTrain(context);
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
            // Save Button (Adjusted top position)
            Positioned(
              right: 16,
              bottom: 16,
              child: Align(
                child: SizedBox(
                  width: 70,
                  height: 70,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Call the function to save the data
                      registerTrain(context);
                    },
                    backgroundColor: Color(0xff5fb0fb),
                    child: Icon(
                      Icons.save,
                      size: 30,
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
}
