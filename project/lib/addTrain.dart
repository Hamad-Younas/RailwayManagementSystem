import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/signin.dart';
import 'package:project/userenteringpage.dart';
import 'config.dart';

class AddTrainScreen extends StatefulWidget {
  @override
  _AddTrainScreenState createState() => _AddTrainScreenState();
}

class _AddTrainScreenState extends State<AddTrainScreen> {
  List<String> dropdownOptions1 = [];
  String selectedDropdownValue1 = '';

  List<String> dropdownOptions2 = [];
  String selectedDropdownValue2 = '';

  final TextEditingController trainNameController = TextEditingController();
  final TextEditingController arrivalStationController = TextEditingController();
  final TextEditingController departureTimeController = TextEditingController();
  final TextEditingController arrivalTimeController = TextEditingController();
  final TextEditingController capacityForACController = TextEditingController();
  final TextEditingController capacityForGeneralController = TextEditingController();
  final TextEditingController fareForGeneralController = TextEditingController();
  final TextEditingController fareForACController = TextEditingController();

  final List<String> trainStatuses = ['Active', 'Inactive', 'Delayed'];
  String selectedTrainStatus = 'Active';

  @override
  void initState() {
    super.initState();
    getDataForDep();
    getData();
  }

  void getData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.9:3200/api/station/displaystations'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['stationNames'] is List) {
          List<String> trainNames = List<String>.from(jsonResponse['stationNames']);
          setState(() {
            dropdownOptions1 = trainNames;
            selectedDropdownValue1 = dropdownOptions1.isNotEmpty ? dropdownOptions1.first : '';
          });
        } else {
          print("Error: 'stationNames' key not found or not a list");
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

  void getDataForDep() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.9:3200/api/station/displaystations'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['stationNames'] is List) {
          List<String> trainNames = List<String>.from(jsonResponse['stationNames']);
          setState(() {
            dropdownOptions2 = trainNames;
            selectedDropdownValue2 = dropdownOptions2.isNotEmpty ? dropdownOptions2.first : '';
          });
        } else {
          print("Error: 'stationNames' key not found or not a list");
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

  void registerTrain(BuildContext context) async {
    if (!trainNameController.text.isEmpty ||
        !arrivalStationController.text.isEmpty ||
        !departureTimeController.text.isEmpty ||
        !arrivalTimeController.text.isEmpty ||
        !capacityForACController.text.isEmpty ||
        !capacityForGeneralController.text.isEmpty ||
        !fareForGeneralController.text.isEmpty ||
        !fareForACController.text.isEmpty) {
      var regBody = {
        "trainName": trainNameController.text,
        "departureStation": selectedDropdownValue1,
        "arrivalStation": selectedDropdownValue2,
        "departureTime": departureTimeController.text,
        "arrivalTime": arrivalTimeController.text,
        "capacityforAC": capacityForACController.text,
        "capacityforGeneral": capacityForGeneralController.text,
        "fareforGeneral": fareForGeneralController.text,
        "fareforAC": fareForACController.text,
        "statusOfTrain": selectedTrainStatus,
      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.10.9:3200/api/train/addtrain'),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(regBody),
        );

        if (response.statusCode == 200) {
          if (response.headers['content-type']?.toLowerCase() == 'application/json') {
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: trainNameController,
                decoration: InputDecoration(labelText: 'Train Name'),
              ),
              DropdownButtonFormField<String>(
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
                decoration: InputDecoration(labelText: 'Arrival Station'),
              ),
              DropdownButtonFormField<String>(
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
                decoration: InputDecoration(labelText: 'Departure Station'),
              ),
              TextFormField(
                controller: departureTimeController,
                decoration: InputDecoration(labelText: 'Departure Time'),
              ),
              TextFormField(
                controller: arrivalTimeController,
                decoration: InputDecoration(labelText: 'Arrival Time'),
              ),
              TextFormField(
                controller: capacityForACController,
                decoration: InputDecoration(labelText: 'Capacity for AC'),
              ),
              TextFormField(
                controller: capacityForGeneralController,
                decoration: InputDecoration(labelText: 'Capacity for General'),
              ),
              TextFormField(
                controller: fareForGeneralController,
                decoration: InputDecoration(labelText: 'Fare for General'),
              ),
              TextFormField(
                controller: fareForACController,
                decoration: InputDecoration(labelText: 'Fare for AC'),
              ),
              DropdownButtonFormField<String>(
                value: selectedTrainStatus,
                items: trainStatuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(status),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTrainStatus = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Status of Train',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
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
            ],
          ),
        ),
      ),
    );
  }
}
