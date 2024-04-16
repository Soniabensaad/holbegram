import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';

class AuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      return "Please fill all the fields";
    }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      
      return "success";
    } catch (e) {
     
      return e.toString();
    }
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
  }) async {
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      return "Please fill all the fields";
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
       
        await _firestore.collection("users").doc(user.uid).set({
          'email': email,
          'username': username,
          
        });
      }

      return "success";
    } catch (e) {
      return e.toString();
    }
  }
}

class SignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  final bool passwordVisible;

  const SignUp({
    Key? key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    this.passwordVisible = true,
  }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late bool _passwordVisible;
  final AuthMethods _authMethods = AuthMethods();

  @override
  void initState() {
    super.initState();
    _passwordVisible = widget.passwordVisible;
  }

  @override
  Widget build(BuildContext context) {
    final passwordVisibleIcons = IconButton(
      alignment: Alignment.bottomLeft,
      color: const Color.fromARGB(218, 226, 37, 24),
      onPressed: () => setState(() {
        _passwordVisible = !_passwordVisible;
      }),
      icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          const Text(
            'Holbegram',
            style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 50,
            ),
          ),
          Image.asset(
            'assets/images/logo.webp',
            width: 80,
            height: 60,
          ),
          const SizedBox(height: 24),
          const Text(
            'Sign up to see photos and videos from your friends.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 24),
                TextField(
                  controller: widget.emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: widget.usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: widget.passwordController,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: passwordVisibleIcons,
                  ),
                  obscureText: !_passwordVisible,
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: widget.passwordConfirmController,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    suffixIcon: passwordVisibleIcons,
                  ),
                  obscureText: !_passwordVisible,
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      String signUpResult = await _authMethods.signUpUser(
                        email: widget.emailController.text.trim(),
                        password: widget.passwordController.text,
                        username: widget.usernameController.text.trim(),
                        file: null, 
                      );

                      if (signUpResult == "success") {
                        // Show success message or navigate to another screen
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign up successful!'),
                          ),
                        );
                        // Navigate to home screen or another screen
                      } else {
                        // Show error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(signUpResult),
                          ),
                        );
                      }
                    },
                    child: const Text('Sign up'),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            height: 2,
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Have an account?'),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen(
                      emailController: TextEditingController(),
                      passwordController: TextEditingController(),
                    ),
                  ),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(color: Color.fromARGB(218, 223, 45, 45)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
