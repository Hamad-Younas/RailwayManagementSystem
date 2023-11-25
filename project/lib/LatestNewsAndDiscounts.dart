import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LatestNewsAndDiscounts extends StatelessWidget {
  final TextEditingController newsController = TextEditingController();
  final TextEditingController discountsController = TextEditingController();



  void updateNewsAndDiscounts(BuildContext context) async {
    // ... (unchanged)
  }

  Future<dynamic> getStations() async {
  try {
  var response = await http.get(
  Uri.parse('http://192.168.10.9:3200/api/announcement/display'),
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
        title: Text('Latest News and Discounts'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Latest News and Discounts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
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
          ),
        ],
      ),
    );
  }
}
