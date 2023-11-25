import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteAnnouncement extends StatefulWidget {
  @override
  _DeleteAnnouncementState createState() => _DeleteAnnouncementState();
}

class _DeleteAnnouncementState extends State<DeleteAnnouncement> {
  final TextEditingController announcementController = TextEditingController();
  List<String> dropdownOptions1 = [];
  String selectedDropdownValue1 = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      final response =
      await http.get(Uri.parse('http://192.168.10.9:3200/api/announcement/announce'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['announcement'] is List) {
          List<String> trainNames = List<String>.from(jsonResponse['announcement']);
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

  void registerAnnouncement(BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse('http://192.168.10.9:3200/api/announcement/deleteAnnouncement/${Uri.encodeComponent(selectedDropdownValue1)}'),
      );


      if (response.statusCode == 204) {
        // Successful deletion
        print('Announcement deleted successfully');
        // Optionally, you can reset the dropdown and update the UI accordingly
        getData();
      } else {
        // Failed deletion
        print('Failed to delete announcement. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        // Optionally, you can show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete announcement'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Exception during the HTTP request
      print('Exception during API call: $e');
      // Optionally, you can show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during API call'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Delete Announcement'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Delete your announcement',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
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
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      registerAnnouncement(context);
                    },
                    child: Text('Delete'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
