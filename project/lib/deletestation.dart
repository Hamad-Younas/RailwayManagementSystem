import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteStationScreen extends StatefulWidget {
  @override
  _DeleteStationScreenState createState() => _DeleteStationScreenState();
}

class _DeleteStationScreenState extends State<DeleteStationScreen> {
  List<String> stationDropdownOptions = [];
  String selectedStationDropdownValue = '';
  List<String> dropdownOptions1 = [];
  String selectedDropdownValue1 = '';
  List<String> trainDropdownOptions = [];
  String selectedTrainDropdownValue = '';
  List<String> dropdownOptions2 = [];
  String selectedDropdownValue2 = '';

  @override
  void initState() {
    getData();
    getDataForStations();
    super.initState();
  }

  void getData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.9:3200/api/train/names'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['trainNames'] is List) {
          List<String> trainNames = List<String>.from(jsonResponse['trainNames']);
          setState(() {
            dropdownOptions1 = trainNames;
            selectedDropdownValue1 = dropdownOptions1.isNotEmpty ? dropdownOptions1.first : '';
          });
        } else {
          print("Error: 'trainNames' key not found or not a list");
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Exception during API call: $e");
      setState(() {
        dropdownOptions1 = [];
        selectedDropdownValue1 = '';
      });
    }
  }

  void getDataForStations() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.9:3200/api/station/display'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['stationName'] is List) {
          List<String> stationNames = List<String>.from(jsonResponse['stationName']);
          setState(() {
            dropdownOptions2 = stationNames;
            selectedDropdownValue2 = dropdownOptions2.isNotEmpty ? dropdownOptions2.first : '';
          });
        } else {
          print("Error: 'stationName' key not found or not a list");
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
      }
    } catch (e) {
      print("Exception during API call: $e");
      setState(() {
        dropdownOptions2 = [];
        selectedDropdownValue2 = '';
      });
    }
  }

  void deleteTrain() {
    // Add your logic for deleting the selected train
    print('Train deleted: $selectedTrainDropdownValue');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Station'),
      ),
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dropdown for Train Name
            DropdownButton(
              value: selectedDropdownValue1,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDropdownValue1 = newValue!;
                });
              },
              items: dropdownOptions1.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Dropdown for Station Name
            DropdownButton(
              value: selectedDropdownValue2,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDropdownValue2 = newValue!;
                });
              },
              items: dropdownOptions2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Delete Button
            ElevatedButton(
              onPressed: () {
                deleteTrain();
              },
              child: Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
