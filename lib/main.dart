import 'package:campaign_app/page/save_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp( MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppstate();
  }
}

class MyAppstate extends State<MyApp> {
  late String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                    width: 100,
                    height: 100,
                    image: AssetImage("assets/logo.jpg"),
                  ),
                  const Image(
                    width: 500,
                    height: 300,
                    image: AssetImage("assets/cal.jpg"),
                  ),
                  Stack(children: [
                    ClipPath(
                        clipper: WaveClipperTwo(
                          reverse: true,
                        ),
                        child: Container(
                            height: MediaQuery.of(context).size.height / 2.7,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    child: ClipPath(
                                      clipper: WaveClipperTwo(
                                        reverse: true,
                                      ),
                                      child: Container(
                                          color: const Color(0xFFFF6D00),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              3,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  "Login below to create and check campaigns",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                ElevatedButton(
                                                  child: const Text(
                                                    'LOGIN',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  style: TextButton.styleFrom(
                                                    fixedSize:
                                                        const Size(300, 40),
                                                    primary: Colors.green,
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    MyLogin()));
                                                  },
                                                ),
                                              ])),
                                    ),
                                  )
                                ])))
                  ])
                ])));
  }
}
