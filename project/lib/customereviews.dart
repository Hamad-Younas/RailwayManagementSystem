import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerReview extends StatefulWidget {
  @override
  _CustomerReviewScreenState createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReview> {
  Future<dynamic> getStations() async {
    try {
      var response = await http.get(
        Uri.parse('http://192.168.10.9:3200/api/review/display'),
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
        title: Text('Customer Review'),
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
              // Check if the data is a list of stations
              if (snapshot.data is List<String>) {
                // Display the response in the ListView
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data[index]),
                    );
                  },
                );
              } else {
                // Display the error message
                return Text('Error: ${snapshot.data}');
              }
            }
          },
        ),
      ),
    );
  }
}
