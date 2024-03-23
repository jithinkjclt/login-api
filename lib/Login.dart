import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 350,
            width: 384,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("Assets/Multi-Profile.png")),
                color: Colors.green,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(150))),
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const Row(
            children: [
              SizedBox(width: 15,),
              const Text("welcome back ! please enter yoyur credentials to login",style: TextStyle(fontSize: 12),)
            ],
          )
        ],
      ),
    );
  }
}
