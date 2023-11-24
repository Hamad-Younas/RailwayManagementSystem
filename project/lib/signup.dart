import 'dart:convert';
import 'package:flutter/material.dart';
import 'signin.dart'; // Import the SignInScreen
import 'mainpage.dart'; // Import the MainPage
import 'package:http/http.dart' as http;
import 'config.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  // Function to register user
  void registerUser(BuildContext context) async {
    // Check if any of the fields is empty
    if (!firstNameController.text.isEmpty ||
        !lastNameController.text.isEmpty ||
        !emailController.text.isEmpty ||
        !passwordController.text.isEmpty ||
        !addressController.text.isEmpty ||
        !phoneNumberController.text.isEmpty) {
      var regBody = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "address": addressController.text,
        "phoneno": phoneNumberController.text
      };

      try {
        var response = await http.post(
          Uri.parse('http://192.168.10.7w:3200/api/products/signup'),

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
                MaterialPageRoute(builder: (context) => SignInScreen()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
                    'WELCOME',
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
                          text: 'Please enter your details to create an account',
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
                    controller: firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 290,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 355,
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
              top: 420,
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
            Positioned(
              left: 12,
              top: 485,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: addressController,
                    decoration: InputDecoration(labelText: 'Address'),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 12,
              top: 550,
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 50,
                  child: TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                ),
              ),
            ),
            // Continue Button (Adjusted top position)
            Positioned(
              left: 59,
              top: 630,
              child: Align(
                child: SizedBox(
                  width: 252,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      // Call the registerUser function
                      registerUser(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff5fb0fb),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Continue',
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
            // Back Button (Adjusted top position)
            Positioned(
              left: 12,
              top: 630,
              child: Align(
                child: SizedBox(
                  width: 40,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate back to MainPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Color(0xff5fb0fb),
                    ),
                  ),
                ),
              ),
            ),
            // Already have an account? Text (Moved below Continue Button)
            Positioned(
              left: 12,
              top: 675, // Adjusted top position
              child: Align(
                child: SizedBox(
                  width: 365,
                  height: 30,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
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
                          TextSpan(text: 'Already have an account? '),
                          TextSpan(
                            text: 'Sign In',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
