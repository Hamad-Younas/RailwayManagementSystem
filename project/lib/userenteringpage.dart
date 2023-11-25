import 'package:flutter/material.dart';
import 'package:project/LatestNewsAndDiscounts.dart';
import 'package:project/bookatrip.dart';

import 'review.dart';

class userEnter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ffem = 1.0; // You can define your own scaling factor if needed
    double fem = 1.0; // You can define your own scaling factor if needed

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
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
                      top: 100 * fem, // Adjusted the top position to center the image
                      left: (148 - 40) / 2 * fem, // Center the image horizontally
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
              Container(
                margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
                width: double.infinity,
                height: 50 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookATripForm(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFDDE0E0),
                    padding: EdgeInsets.all(16 * fem),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40 * fem),
                    ),
                  ),
                  child: Text(
                    'Book a Trip',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0B3E7C),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
                width: double.infinity,
                height: 50 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the button action here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFDDE0E0),
                    padding: EdgeInsets.all(16 * fem),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40 * fem),
                    ),
                  ),
                  child: Text(
                    'View Trip History',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0B3E7C),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
                width: double.infinity,
                height: 50 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the button action here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFDDE0E0),
                    padding: EdgeInsets.all(16 * fem),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40 * fem),
                    ),
                  ),
                  child: Text(
                    'Cancel Booking',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0B3E7C),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
                width: double.infinity,
                height: 50 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LatestNewsAndDiscounts(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFDDE0E0),
                    padding: EdgeInsets.all(16 * fem),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40 * fem),
                    ),
                  ),
                  child: Text(
                    'Latest News and Discounts',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0B3E7C),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
                width: double.infinity,
                height: 50 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Review(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFDDE0E0),
                    padding: EdgeInsets.all(16 * fem),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40 * fem),
                    ),
                  ),
                  child: Text(
                    'Leave a review',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0B3E7C),
                    ),
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
