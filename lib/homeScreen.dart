import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Login.dart';
import 'dataMethode.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String url = "https://crm-beta-api.vozlead.in/api/v2/lead/lead_list/";
  Future<MethodeData> apidata() async {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'token $token',
    });
    print(response.body);
    final res = jsonDecode(response.body);
    final data = MethodeData.fromJson(res);
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    apidata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
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
                  child: const Row(
                    children: [
                      Icon(Icons.menu),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Lead list",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.notifications),
                    ],
                  )),
            ),
            FutureBuilder(
              future: apidata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                      backgroundColor: Colors.red,
                    )),
                  );
                } else {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.data!.leads!.length,
                    itemBuilder: (context, index) {
                      return Padding(
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
                            height: 100,
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 50,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "01",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 180,
                                  height: 100,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "jhonathan james",
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Exapmle@gmail.com",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                      const Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "Created:05/03/2023",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            snapshot.data!.data!.leads![index]
                                                .mobile!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 25,
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      snapshot
                                          .data!.data!.leads![index].interest!,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_sharp,
                                          size: 10,
                                        ),
                                        Text(
                                          "calicut",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.wifi_calling_3,
                                      size: 35,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ],
                                )
                              ],
                            )),
                      );
                    },
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}