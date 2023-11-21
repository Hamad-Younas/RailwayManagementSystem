import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteStationScreen extends StatefulWidget {
  @override
  _DeleteStationScreenState createState() => _DeleteStationScreenState();
}

class _DeleteStationScreenState extends State<DeleteStationScreen> {
  Future<List<String>> getStations() async {
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
            print("Stations: $stations");
            return stations;
          } else {
            // Handle error case
            print("Error: ${jsonResponse['message']}");
            return [];
          }
        } else {
          print("Non-JSON response: ${response.body}");
          return [];
        }
      } else {
        print("Error: ${response.statusCode}");
        print("Response: ${response.body}");
        return [];
      }
    } catch (e) {
      print("Error: $e");
      return [];
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
        child: FutureBuilder<List<String>>(
          future: getStations(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Text('No data available');
            } else {
              List<String> stations = snapshot.data!;
              print("Number of stations: ${stations.length}");
              return ListView.builder(
                itemCount: stations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(stations[index]),
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
