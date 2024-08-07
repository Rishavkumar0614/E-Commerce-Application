import "package:flutter/material.dart";

String uri = 'http://localhost:3000';

class GlobalVars {
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const backgroundColor = Colors.white;
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
}