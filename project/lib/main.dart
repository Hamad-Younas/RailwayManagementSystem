import 'package:flutter/material.dart';
import 'package:project/addstation.dart';
import 'package:project/mainpage.dart';
import 'package:project/signup.dart';
import 'package:project/signin.dart';
import 'package:project/userprofile.dart';
import 'package:project/userenteringpage.dart';
import 'package:project/adminmainpage.dart';
import 'package:project/managestations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage()
    );
  }
}
