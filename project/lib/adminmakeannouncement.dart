import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project/adminmainpage.dart';
import 'package:http/http.dart' as http;

class MakeAnnouncement extends StatelessWidget {
  final TextEditingController announcementController = TextEditingController();

  void registerAnnouncement(BuildContext context) async {
    if (!announcementController.text.isEmpty) {
      var regBody = {
        "announcement": announcementController.text,
      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.10.31:3200/api/announcement/addannouncement'),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(regBody),
        );

        if (response.statusCode == 200) {
          if (response.headers['content-type']?.toLowerCase() ==
              'application/json') {
            var jsonresponse = jsonDecode(response.body);
            print(jsonresponse['status']);
            if (jsonresponse['status']) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => adminMain()),
              );
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Announcement failed'),
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
    double ffem = 1.0; // You can define your own scaling factor if needed
    double fem = 1.0; // You can define your own scaling factor if needed

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Make Announcement'),
      ),
      body: Container(
        width: double.infinity,
        height: 844,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 18,
              top: 139,
              child: Container(
                width: 336,
                height: 35,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Make your announcement',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        height: 1.2125,
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              left: 18,
              top: 390,
              child: SizedBox(
                width: 352,
                height: 50,
                child: TextField(
                  controller: announcementController,
                  decoration: InputDecoration(
                    hintText: 'Type your message...',
                  ),
                ),
              ),
            ),

            Positioned(
              left: 70,
              top: 562,
              child: Container(
                width: 242,
                height: 54,
                decoration: BoxDecoration(
                  color: Color(0xff5fb0fb),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  onPressed: () {
                    registerAnnouncement(context);
                  },
                  child: Center(
                    child: Text(
                      'Post your message',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.2125,
                        color: Color(0xff241f43),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
