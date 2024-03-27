import 'dart:convert';
import 'package:login_interface/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_interface/postMethode.dart';
import 'homeScreen.dart';
 String? token;
class login extends StatelessWidget {
  login({super.key});
  TextEditingController userctr = TextEditingController();
  TextEditingController passctr = TextEditingController();
  String url = "https://crm-beta-api.vozlead.in/api/v2/account/login/";
  apiPostData(context) async {
    var body = {
      "username": userctr.text.trim(),
      "password": passctr.text.trim(),
    };
    final response = await http.post(
      Uri.parse(url),
      body: body,
    );
    print(response.body);
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      final data=Postmethode.fromJson(res);
      token=data.data!.token;
      final data1 = LocalStorage();
      data1.getApi(token!);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(milliseconds: 100), content: Text("Wrong")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                SizedBox(
                  width: 15,
                ),
                Text(
                  "welcome back ! please enter yoyur credentials to login",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, bottom: 10, top: 15),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ]),
                width: 390,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: userctr,
                    decoration: const InputDecoration(
                        hintText: "user name",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer)
                    ]),
                width: 390,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: passctr,
                    decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                        border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Forget your ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Password?",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                apiPostData(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              blurStyle: BlurStyle.outer)
                        ]),
                    width: 390,
                    height: 60,
                    child: const Center(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Don't have any account? ",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
                Text(
                  "Sign Up?",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}