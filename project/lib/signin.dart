import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        width: double.infinity,
        height: 800, // Adjust the height as needed
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12,
              top: 50, // Adjust the top position for the "WELCOME" heading
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 30, // Adjust the height as needed
                  child: Text(
                    'WELCOME BACK',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 155, // Adjust the top position for the description
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 49,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 1.2125,
                        color: Color(0xa5000000),
                      ),
                      children: [
                        TextSpan(
                          text: 'Please enter your email and password to sign in',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            height: 1.2125,
                            color: Color(0xa5000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Email Text Field
            Positioned(
              left: 12,
              top: 225, // Adjust the top position as needed
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
              ),
            ),
            // Password Text Field
            Positioned(
              left: 12,
              top: 285, // Adjust the top position as needed
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true, // Use this to hide the password
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 365,
                height: 30, // Adjust the height as needed
                child: RichText(
                  textAlign: TextAlign.center, // Center-align the text
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xa5000000),
                    ),
                    children: [
                      TextSpan(text: 'Dont have an account? '),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff4775eb),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 59,
              top: 390, // Adjust the top position as needed
              child: Align(
                child: SizedBox(
                  width: 252,
                  height: 39, // Adjust the height as needed
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your sign-up action here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff5fb0fb),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
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
