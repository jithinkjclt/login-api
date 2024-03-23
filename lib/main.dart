import 'package:flutter/material.dart';

import 'Login.dart';

void main(){

  runApp(User());
}
class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:login() ,
    );
  }
}
