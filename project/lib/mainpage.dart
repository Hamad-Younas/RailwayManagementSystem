import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 87,
              decoration: BoxDecoration(
                color: Color(0xff5fb0fb),
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 756,
                  height: 594,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -25,
                        child: SizedBox(
                          width: 202.5,
                          height: 194,
                          child: Image.asset(
                            'assets/train.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 262 - 93,
                        child: SizedBox(
                          width: 95,
                          height: 39,
                          child: Text(
                            'Railify',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              height: 1.2102272511,
                              color: Color(0xe0000000),
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
                            'Welcome! start by creating your account or sign in \nif you already have one',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.2102272511,
                              color: Color(0xa5000000),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 463 - 125,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle the Sign Up action here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff5fb0fb),  // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.2102272034,
                              color: Color(0xffffffff),  // Text color
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 556 - 130,
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle the Sign In action here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff5fb0fb),  // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.2102272034,
                              color: Colors.grey[300],  // Light grey color for the text
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 87,
              decoration: BoxDecoration(
                color: Color(0xff5fb0fb),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy values for the missing functions and values
double fem = 1.0;
double ffem = 1.0;

class SafeGoogleFont {
  static TextStyle inter({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      color: color,
    );
  }
}
