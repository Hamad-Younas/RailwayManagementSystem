import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpdateStation extends StatelessWidget {
  final TextEditingController stationNameController = TextEditingController();
  final TextEditingController stationLocationController = TextEditingController();

  Future<dynamic> getStations() async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.10.31:3200/api/station/display'),
        headers: {"Content-type": "application/json"},
      );

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.toLowerCase() ==
            'application/json') {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status']) {
            List<String> stations = List<String>.from(jsonResponse['data']);
            return stations;
          } else {
            // Handle error case
            return jsonResponse['message'];
          }
        } else {
          // Non-JSON response
          return response.body;
        }
      } else {
        // Handle error case
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      // Handle exception
      return "Error: $e";
    }
  }

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
        title: Text('Update Stations'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
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
                  bottom: 20,
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
                          'Update',
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
          // Use a FutureBuilder for the dynamic ListView
          Expanded(
            child: FutureBuilder<dynamic>(
              future: getStations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display the response in the ListView
                  return ListView.builder(
                    itemCount: 1, // Display a single item for simplicity
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data.toString()),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
