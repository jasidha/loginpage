import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Login2 extends StatefulWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  State<Login2> createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  Future signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  bool ?_passwordvisible;
  @override
  void initState() {
    _passwordvisible=false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("FIREBASE"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email or Phone number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12,),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
               suffixIcon: IconButton(onPressed: (){
                 setState(() {
                   _passwordvisible=_passwordvisible;
                 });
               }, icon: Icon(
                   _passwordvisible!?
               Icons.visibility:Icons.visibility_off)),

              ),

            ),
            SizedBox(height: 12,),
            ElevatedButton(onPressed: (){
              signIn();
            //  Navigator.push(context, MaterialPageRoute(builder: (context)=>Logout1()));
            }, child: Text("Login")),
          ],),
      ) ,
    );
  }
}
