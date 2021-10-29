import 'package:campaign_app/page/home_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class MyOtp extends StatefulWidget {
  String? mobileNumber;
   MyOtp(this.mobileNumber, );

  @override
  State<StatefulWidget> createState() {
    return MyOtpState(mobileNumber);
  }
}
bool isVerifyPhoneMethodCalled = false;
class MyOtpState extends State<MyOtp> {
  String? mobileNumber;

  MyOtpState(this.mobileNumber);
  TextEditingController otpController = new TextEditingController();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
 late  String verificationId;

  @override
  void initstate() {
    otpController = TextEditingController();
    super.initState();
  }

  Future<void> verifyPhone(phoneNo) async {
    print("executing verifyPhone method");
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber:"+91 9597556606",
        codeAutoRetrievalTimeout: (String verId){
          // const CircularProgressIndicator();
          print("Timed Out");
        },
        codeSent: (String verificationId, [int? forceCodeResend]){
          this.verificationId = verificationId;
          print("Code Sent");
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential){
          print("Verified");
        },
        verificationFailed: (FirebaseAuthException exception){
          print('failed $exception');
        });
  }

  void verifyOTP(String smsCode) async {

    print(smsCode);
    await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode
        )).then((value) => print('success ${value.additionalUserInfo!}'))
        .onError((error, stackTrace) => print("Error $error"));
  }

  @override
  Widget build(BuildContext context) {

    print("Circular");
    /// To avoid calling verifyPhone method multiple times on each build
    if(!isVerifyPhoneMethodCalled){
      // const CircularProgressIndicator(
      //   semanticsLabel: 'Linear progress indicator',
      // );
      isVerifyPhoneMethodCalled = true;
      verifyPhone("+916379114746");
    }

    TextEditingController mobileNumber =TextEditingController() ;
    return MaterialApp(home:Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Image(
                    width: 100,
                    height: 200,
                    image: AssetImage("assets/logo.jpg"),
                  ),
                  const Text(
                    "One Time Password(OTP) has been sent to your "
                    "mobile number ",
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OTPTextField(
                    keyboardType:TextInputType.number,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceEvenly,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      // print("Changed: " + pin);
                    },
                    onCompleted: (pin) {
                      // print("Completed: " + pin);
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    child: const Text(
                      'VALIDATE',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: TextButton.styleFrom(
                      fixedSize: const Size(300, 40),
                      primary: Colors.white,
                      backgroundColor: const Color(0xFFFF6D00)
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>   HomeTabPage()));
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "RESENT OTP IN 0.30",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
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
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: const Image(
                                                colorBlendMode: BlendMode.clear,
                                                alignment: AlignmentDirectional
                                                    .bottomEnd,
                                                width: 250,
                                                height: 300,
                                                image: AssetImage(
                                                    "assets/design.jpg"),
                                              )))),
                                ])))
                  ])
                ]))));
  }
}
