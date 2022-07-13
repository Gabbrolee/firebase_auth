import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:use_firebase_riverpod/ui/signup_screen.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  int _success = 1;
  String _userEmail = "";
  String _userPassword = "";

  void singleIn() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _success = 2;
        _userEmail = _emailController.text;
        _userPassword = _passwordController.text;
      });
    } else {
      setState(() {
        _success = 3;
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: const Text(
                'SignUp',
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
              const SizedBox(
                height: 20.0,
              ),
              const Text("Email"),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text("Password"),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                obscureText: true,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  _success == 1
                      ? ""
                      : (_success == 2
                          ? "successfully sign in " + _userEmail
                          : "sign in failed"),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.teal,
                  ),
                  child: TextButton(
                    onPressed: () {
                      singleIn();
                    },
                    child: const Text(
                      'Login',
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
