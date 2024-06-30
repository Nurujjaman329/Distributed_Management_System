import 'package:flutter/material.dart';

class CustomColor {
  static const Color primaryColor = Color(0XFF7f30fe);
  static const Color secondaryColor = Color(0XFF6380fb);

  static const Gradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
