import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project/userenteringpage.dart';

class BookATripForm extends StatefulWidget {
  @override
  _BookATripFormState createState() => _BookATripFormState();
}

class _BookATripFormState extends State<BookATripForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController totalFareController = TextEditingController();

  List<String> dropdownOptions1 = [];
  List<String> dropdownOptions2 = ['AC', 'General'];
  List<String> dropdownOptions3 = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];

  String selectedDropdownValue1 = '';
  String selectedDropdownValue2 = 'AC';
  String selectedDropdownValue3 = '1';

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

  void userBooking(BuildContext context) async {
    if (!nameController.text.isEmpty ||
        !emailController.text.isEmpty ||
        selectedDropdownValue1 != null ||
        selectedDropdownValue2 != null ||
        selectedDropdownValue3 != null ||
        !totalFareController.text.isEmpty) {
      var regBody = {
        "name": nameController.text,
        "email": emailController.text,
        "trainNames": selectedDropdownValue1,
        "category": selectedDropdownValue2,
        "seats": selectedDropdownValue3,
        "fare": totalFareController.text,
      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.10.9:3200/api/booking/userbooking'),
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
                  content: Text('Booking failed'),
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

  Future<dynamic> showTrains() async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.10.9:3200/api/train/display'),
        headers: {"Content-type": "application/json"},
      );

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.toLowerCase() == 'application/json') {
          var jsonResponse = jsonDecode(response.body);
          if (jsonResponse['status']) {
            if (jsonResponse['data'] is String) {
              return jsonResponse['data'];
            } else {
              List<String> stations = List<String>.from(jsonResponse['data']);
              return stations;
            }
          } else {
            return jsonResponse['message'];
          }
        } else {
          return response.body;
        }
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }

  double calculateTotalFare() {
    double fareForAC = 100.0; // Replace with the actual value
    double fareForGeneral = 50.0; // Replace with the actual value

    int selectedDropdown3Value = int.parse(selectedDropdownValue3);

    double totalFare = selectedDropdownValue2 == 'AC'
        ? fareForAC * selectedDropdown3Value
        : fareForGeneral * selectedDropdown3Value;

    return totalFare;
  }

  void _confirmButtonPressed() {
    String name = nameController.text;
    String email = emailController.text;
    String totalFare = totalFareController.text;

    print('Name: $name, Email: $email, Selected Option 1: $selectedDropdownValue1, '
        'Selected Option 2: $selectedDropdownValue2, Selected Option 3: $selectedDropdownValue3, '
        'Total Fare: $totalFare');
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book A Trip'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                DropdownButton(
                  value: selectedDropdownValue3,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDropdownValue3 = newValue!;
                      double calculatedTotalFare = calculateTotalFare();
                      totalFareController.text = calculatedTotalFare.toStringAsFixed(2);
                    });
                  },
                  items: dropdownOptions3.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),
            FutureBuilder<dynamic>(
              future: showTrains(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.data is String) {
                    return Text('Error: ${snapshot.data}');
                  } else {
                    List<String> stations = List<String>.from(snapshot.data);
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: stations
                            .map<Widget>(
                              (attribute) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(attribute),
                            ),
                          ),
                        )
                            .toList(),
                      ),
                    );
                  }
                }
              },
            ),
            SizedBox(height: 20),
            TextField(
              controller: totalFareController,
              decoration: InputDecoration(
                labelText: 'Total Fare',
                suffixText: ' \$',
              ),
              readOnly: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userBooking(context);
                _confirmButtonPressed();
              },
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
