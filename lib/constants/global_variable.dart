import 'package:flutter/material.dart';
String uri ='http://192.168.1.2:5000';
class GlobalVariables {
  static const LinearGradient appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800];
  static const unselectedNavBarColor = Colors.black87;
//fonts
  static const headingStyle = TextStyle( fontWeight:FontWeight.w500,
  fontSize: 22,
  );
  static const bodyStyle = TextStyle( fontWeight:FontWeight.bold,
  );
  static const subBodyStyle = TextStyle( fontWeight:FontWeight.w600,
    letterSpacing: 2,
    color: Colors.grey,
  );


}
