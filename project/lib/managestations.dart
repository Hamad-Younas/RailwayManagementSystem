import 'package:flutter/material.dart';
import 'package:project/addTrain.dart';
import 'package:project/updatestation.dart';

import 'addstation.dart';
import 'deletestation.dart';

class ManageStation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ffem = 1.0; // You can define your own scaling factor if needed
    double fem = 1.0; // You can define your own scaling factor if needed

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
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
              Container(
                margin: EdgeInsets.fromLTRB(33 * fem, 0 * fem, 43 * fem, 19 * fem),
                width: double.infinity,
                height: 50 * fem,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddStationScreen(), // Replace with your AddStationScreen widget
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
                    'Add Station',
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
                        builder: (context) => DeleteStationScreen(),
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
                    'Delete Station',
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
                        builder: (context) => UpdateStation()
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
                    'Update Station',
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
