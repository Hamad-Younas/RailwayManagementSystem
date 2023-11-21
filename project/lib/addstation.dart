

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddStationScreen extends StatelessWidget {
  final TextEditingController stationNameController = TextEditingController();
  final TextEditingController stationLocationController = TextEditingController();


  void addStation(BuildContext context) async {
    if (!stationNameController.text.isEmpty ||
        !stationLocationController.text.isEmpty) {
      var stationBody = {
        "stationName": stationNameController.text,
        "stationLocation": stationLocationController.text,

      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.10.31:3200/api/station/addstation'),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(stationBody),
        );

        if (response.statusCode == 200) {
          if (response.headers['content-type']?.toLowerCase() ==
              'application/json') {
            var jsonResponse = jsonDecode(response.body);
            print(jsonResponse['status']);
            if (jsonResponse['status']) {
              // Handle success, e.g., navigate to the next screen
              Navigator.pop(context); // Close the current screen
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Adding station failed'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Stations'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 400, // Adjust the width as needed
          height: 300, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            border: Border.all(color: Colors.grey),
            // Add a border for visualization
            borderRadius: BorderRadius.circular(
                10), // Add rounded corners if desired
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Station Name Textfield
              Positioned(
                left: 12,
                top: 60,
                child: Align(
                  child: SizedBox(
                    width: 365,
                    height: 50,
                    child: TextFormField(
                      controller: stationNameController,
                      decoration: InputDecoration(labelText: 'Station Name'),
                    ),
                  ),
                ),
              ),
              // Station Location Textfield
              Positioned(
                left: 12,
                top: 120,
                child: Align(
                  child: SizedBox(
                    width: 365,
                    height: 50,
                    child: TextFormField(
                      controller: stationLocationController,
                      decoration: InputDecoration(
                          labelText: 'Station Location'),
                    ),
                  ),
                ),
              ),
              // Continue Button (Adjusted top position)
              Positioned(
                left: 59,
                bottom: 20, // Adjust the bottom margin as needed
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
                        'Add',
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
            ],
          ),
        ),
      ),
    );
  }
}