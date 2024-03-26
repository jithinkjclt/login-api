import 'package:flutter/material.dart';
import 'package:login_interface/local_storage.dart';
import 'Login.dart';
import 'homeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  flash(context) async {
    token = await LocalStorage().setApi();
    print(">>>>>>>>>>>>>>>>>>>>>>>.$token");

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => token == null ? login() : HomeScreen()),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    flash(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image(image: AssetImage("Assets/Multi-Profile.png")),
            Text(
              "Loading",
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
