import 'package:flutter/material.dart';
import '../widgets/text_field.dart';
import 'login_screen.dart';

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
                TextFieldInput(
                  controller: widget.emailController,
                  isPassword: false,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                TextFieldInput(
                  controller: widget.usernameController,
                  isPassword: false,
                  hintText: 'Username',
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 24),
                TextFieldInput(
                  controller: widget.passwordController,
                  isPassword: !_passwordVisible,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: passwordVisibleIcons,
                ),
                const SizedBox(height: 24),
                TextFieldInput(
                  controller: widget.passwordConfirmController,
                  isPassword: !_passwordVisible,
                  hintText: 'Confirm Password',
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: passwordVisibleIcons,
                ),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(218, 226, 37, 24)),
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
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
                      passwordController: TextEditingController()
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
