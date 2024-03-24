import 'package:flutter/material.dart';

import 'Login.dart';


void main(){

  runApp(const User());
}
class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      home:login() ,
    );
  }
}
