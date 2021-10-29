import 'package:campaign_app/page/create_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}

class SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
         padding:const EdgeInsets.fromLTRB(30,50,10,10),
            child:  SingleChildScrollView(child:
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ), const SizedBox(height: 10),
                  const Text(
                    "Your Profile Settings",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black38, fontSize: 15),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Name",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    style: TextStyle(fontSize: 12),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        hintText: "Enter Your Name"),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Mobile Number",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "+918569523689",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight:FontWeight.bold,
                      color: Colors.black, fontSize: 10),
                  ),
                  const SizedBox(height: 200),
                  Center(child:
                  ElevatedButton(
                    child: const Text('SIGN OUT'
                    ,style: TextStyle(
                        fontWeight:FontWeight.bold,),),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(300, 50),
                      primary: Colors.white,
                      backgroundColor: Colors.orange[800],
                    ),
                    onPressed: () {
                    },
                  ),
                  )]))));
  }
}
