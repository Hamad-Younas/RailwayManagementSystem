import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ffem = 1.0; // You can define your own scaling factor if needed
    double fem = 1.0; // You can define your own scaling factor if needed

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(14 * fem, 92 * fem, 14 * fem, 0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 85 * fem, 20 * fem),
                width: double.infinity,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
                      child: Text(
                        'Complete your profile',
                        style: TextStyle(
                          fontFamily: 'sans-serif', // Use a simple font family
                          fontSize: 24 * ffem,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                      width: 80 * fem,
                      height: 80 * fem,
                      child: Image.asset(
                        'assets/train.png', // Make sure to place your image in the assets directory
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                child: Text(
                  'Please enter your profile. Do not worry, only you will see your personal data.',
                  style: TextStyle(
                    fontFamily: 'sans-serif', // Use a simple font family
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w400,
                    color: Color(0xa5000000),
                  ),
                ),
              ),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),

              SizedBox(height: 20 * fem),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
              ),

              SizedBox(height: 20 * fem),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                ),
              ),

              SizedBox(height: 20 * fem),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your address',
                ),
              ),

              SizedBox(height: 20 * fem),

              // Continue button
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the continue action
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff5fb0fb),
                    padding: EdgeInsets.all(12 * fem), // Adjust padding as needed
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff),
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
