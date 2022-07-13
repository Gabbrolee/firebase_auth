
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:use_firebase_riverpod/ui/login_screen.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
 final _emailController = TextEditingController();
 final _passwordController = TextEditingController();

 late bool _success;
 late String _userEmail;
 late String _userPassword;

 void _register() async {
   final User user = (_auth.createUserWithEmailAndPassword(
       email: _emailController.text,
       password: _passwordController.text)) as User;


   if(user != null) {
     setState(() {
       _success = true;
       _userEmail = user.email!;
       _userPassword = _passwordController.text;
     });
   } else {
     setState(() {
       _success = false;
     });
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.teal,
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ))
        ],
      ),
      body: Form(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              // const Text("FirstName"),
              // TextFormField(
              //   decoration: const InputDecoration(border: OutlineInputBorder()),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // const Text("LastName"),
              // TextFormField(
              //   decoration: const InputDecoration(border: OutlineInputBorder()),
              //
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Text("Email"),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(border: OutlineInputBorder()),

              ),
              SizedBox(
                height: 20.0,
              ),
              Text("Password"),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.teal,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      _register();
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
