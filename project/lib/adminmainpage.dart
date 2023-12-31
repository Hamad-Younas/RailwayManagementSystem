import 'package:flutter/material.dart';
import 'package:project/addTrain.dart';
import 'package:project/adminmakeannouncement.dart';
import 'package:project/customereviews.dart';
import 'package:project/manageuser.dart';
import 'package:project/deleteannouncement.dart'; // Added import for DeleteAnnouncement
import 'package:project/mainpage.dart';
import 'package:project/managestations.dart';

class adminMain extends StatelessWidget { // Corrected class name to follow Dart naming conventions
  @override
  Widget build(BuildContext context) {
    double ffem = 1.0;
    double fem = 1.0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        ),
        title: Text('Menu'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(21 * fem, 109 * fem, 21 * fem, 15 * fem),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 200 * fem, 90 * fem),
                width: 148 * fem,
                height: 38 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0 * fem,
                      top: 8 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 114 * fem,
                          height: 30 * fem,
                          child: Text(
                            'Welcome ',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 320 - 80,
                      child: SizedBox(
                        width: 385,
                        height: 38,
                        child: Text(
                          'We’re a great big rolling railroad',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 1.2102272511,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100 * fem,
                      left: (148 - 40) / 2 * fem,
                      child: SizedBox(
                        width: 40 * fem,
                        height: 31 * fem,
                        child: Image.asset(
                          'assets/train.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddTrainScreen(),
                    ),
                  );
                },
                label: 'Manage Trains',
                fem: fem,
                ffem: ffem,
              ),
              buildElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ManageStation(),
                    ),
                  );
                },
                label: 'Manage Stations',
                fem: fem,
                ffem: ffem,
              ),
              buildElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ManageUser(),
                    ),
                  );
                },
                label: 'Manage Users',
                fem: fem,
                ffem: ffem,
              ),
              buildElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CustomerReview(),
                    ),
                  );
                },
                label: 'Customer Reviews',
                fem: fem,
                ffem: ffem,
              ),
              buildElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MakeAnnouncement(),
                    ),
                  );
                },
                label: 'Make an Announcement',
                fem: fem,
                ffem: ffem,
              ),
              buildElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DeleteAnnouncement(), // Corrected class name to DeleteAnnouncement
                    ),
                  );
                },
                label: 'Delete Announcements',
                fem: fem,
                ffem: ffem,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildElevatedButton({
    required VoidCallback onPressed,
    required String label,
    required double fem,
    required double ffem,
  }) {
    return Container(
      margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
      width: double.infinity,
      height: 50 * fem,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFDDE0E0),
          padding: EdgeInsets.all(16 * fem),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40 * fem),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w500,
            color: Color(0xFF0B3E7C),
          ),
        ),
      ),
    );
  }
}
