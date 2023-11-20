import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:project/userenteringpage.dart';
import 'package:project/adminmainpage.dart';
import 'package:project/mainpage.dart'; // Import the main page file

class SignInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signInUser(BuildContext context) async {
    print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
    if (emailController.text == "adminR@admin.com" &&
        passwordController.text == "admin505") {
      print("Opening Admin Page");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => adminMain()), // Replace 'AdminMain' with the appropriate class for your admin page.
      );
      return;
    }

    if (!emailController.text.isEmpty || !passwordController.text.isEmpty) {
      var regBody = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.22.130:3200/api/products/signin'),
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
                MaterialPageRoute(builder: (context) => userEnter()),
              );
              return;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Registration failed'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          } else {
            print("Non-JSON response: ${response.body}");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => userEnter()),
            );
          }
        } else {
          print("Error: ${response.statusCode}");
          print("Response: ${response.body}");
        }
      } catch (e) {
        print("Error: $e");
      }
    } else {
      // Perform sign-up logic here
    }
  }

  void handleSignInResponse(BuildContext context, http.Response response) {
    if (response.statusCode == 200) {
      if (response.headers['content-type']?.toLowerCase() == 'application/json') {
        var jsonresponse = jsonDecode(response.body);
        print(jsonresponse['status']);
        if (jsonresponse['status']) {
          // Successful sign-in, you can navigate to the next screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => userEnter()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sign-in failed. Check your email and password.'),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred during sign-in.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 800,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12,
              top: 50,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 30,
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
              top: 155,
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
                          text:
                          'Please enter your email and password to sign in',
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
            Positioned(
              left: 12,
              top: 225,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 285,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: 365,
                height: 30,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xa5000000),
                    ),
                    children: [
                      TextSpan(text: 'Don\'t have an account? '),
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
              top: 390,
              child: Align(
                child: SizedBox(
                  width: 252,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      signInUser(context);
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
            Positioned(
              left: 59,
              top: 440,
              child: Align(
                child: SizedBox(
                  width: 252,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff5fb0fb),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Back',
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
