import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ManageUser extends StatefulWidget {
  @override
  _ManageUserState createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  List<String> dropdownOptions1 = [];
  String selectedDropdownValue1 = '';

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.10.9:3200/api/products/display'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse is List) {
          List<String> emailList = List<String>.from(jsonResponse);
          setState(() {
            dropdownOptions1 = emailList;
            selectedDropdownValue1 = dropdownOptions1.isNotEmpty ? dropdownOptions1.first : '';
          });
        } else {
          print("Error: Response is not a list");
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

  void deleteUser(BuildContext context) async {
    try {
      final response = await http.delete(
        Uri.parse('http://192.168.10.9:3200/api/products/deleteUser/$selectedDropdownValue1'),
      );

      if (response.statusCode == 204) {
        // Successful deletion
        print('User deleted successfully');
        // Optionally, you can reset the dropdown and update the UI accordingly
        getData();
      } else {
        // Failed deletion
        print('Failed to delete user. Status code: ${response.statusCode}');
        print('Response: ${response.body}');
        // Optionally, you can show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete user'),
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
        title: Text('Manage Users'),
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
                    'Manage your Users',
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
                      deleteUser(context);
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
