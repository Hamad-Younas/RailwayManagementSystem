import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteStationScreen extends StatefulWidget {
  @override
  _DeleteStationScreenState createState() => _DeleteStationScreenState();
}

class _DeleteStationScreenState extends State<DeleteStationScreen> {
  Future<dynamic> getStations() async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.10.31:3200/api/train/names'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Station'),
      ),
      body: Container(
        height: double.infinity,
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
    );
  }
}
