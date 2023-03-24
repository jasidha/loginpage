import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Logout1 extends StatefulWidget {
  const Logout1({Key? key}) : super(key: key);

  @override
  State<Logout1> createState() => _Logout1State();
}

class _Logout1State extends State<Logout1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(width: double.maxFinite,
            child: ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              // Navigator.pop(context);
            }, child: Text("Logout"))),
      ],),
    );
  }
}
