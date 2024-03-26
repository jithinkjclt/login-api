import 'package:flutter/material.dart';
import 'package:login_interface/splashScreen.dart';

import 'homeScreen.dart';


void main() {
  runApp(const User());
}

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
