import 'package:flutter/material.dart';

class MakeAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // You can define your own scaling factor if needed
    double ffem = 1.0; // ignore: unused_local_variable
    double fem = 1.0; // ignore: unused_local_variable

    return Container(
      width: double.infinity,
      height: 844, // Assuming you don't want to apply scaling factor here
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
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 1),
                  //   width: 34,
                  //   height: 34,
                  //   child: Image.network(
                  //     '[Image url]', // Replace with the actual image URL
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 360,
            child: Align(
              child: SizedBox(
                width: 151,
                height: 20,
                child: Text(
                  'Enter your message',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color(0xa5000000),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 182,
            child: Align(
              child: SizedBox(
                width: 352,
                height: 25,
                child: Text(
                  'Countdown to the big announcement',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.2125,
                    color: Color(0xa5000000),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 13,
            top: 423,
            child: Align(
              child: SizedBox(
                width: 365,
                height: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xb2000000),
                  ),
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
        ],
      ),
    );
  }
}
