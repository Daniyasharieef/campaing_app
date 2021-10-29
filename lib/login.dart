import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'otp.dart';

class MyLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyLoginState();
  }
}

class MyLoginState extends State<MyLogin> {
  TextEditingController mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child:Container(
            child: Column(
      children: [ const Image(
                width: 100,
                height: 100,
                image: AssetImage("assets/logo.jpg"),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Enter Mobile Number",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.black, fontSize: 20),
              ),
                Padding(padding:const EdgeInsets.all(20),child:
        Row(
          children:
           [
            SizedBox(
                height: 50,
                width: 70,
                child: TextField(
                  style: TextStyle(height: 2, fontSize: 15),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      labelText:"+91"),
                  keyboardType: TextInputType.number,
                  ),),
            SizedBox(width:20),
            SizedBox(
                height: 50,
                width: 230,
                child: TextField(
                   controller: mobileNumber,
                  style: TextStyle(height: 2, fontSize: 15),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      hintText: "0000000000"),
                  keyboardType: TextInputType.number,
                  ),),
          ],
        ),),
               const  SizedBox(
                    height: 20),
                ElevatedButton(
                child: const Text(
                  'LOGIN',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                  fixedSize: const Size(300, 20),
                  primary: Colors.white,
                  backgroundColor: const Color(0xFFFF6D00)
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyOtp(mobileNumber.text,)));
                },
              ),
              const SizedBox(
                height: 50,
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
                                      padding: const EdgeInsets.all(10),
                                      color:const Color(0xFFFF6D00),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      width: MediaQuery.of(context).size.width,
                                          child: const Image(
                                           colorBlendMode: BlendMode.clear,
                                            alignment:
                                            AlignmentDirectional.bottomEnd,
                                            width: 500,
                                            height: 350,
                                            image: AssetImage("assets/design.jpg"),
                                    )))
                          ),
                   ] ))
                )])

    ]))));
  }
}
