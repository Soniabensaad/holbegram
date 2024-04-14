import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './widgets/text_field.dart'; // Import the TextFieldInput widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCTcm9oWhr_-0OIilos0FYU68JFl88wBmo",
      authDomain: "holbegram-3ea13.firebaseapp.com",
      projectId: "holbegram-3ea13",
      storageBucket: "holbegram-3ea13.appspot.com",
      messagingSenderId: "917272556950",
      appId: "1:917272556950:web:4932a454c75649e6c899b7",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TextFieldInput(
          controller: TextEditingController(),
          isPassword: true, 
          hintText: 'Password', 
          keyboardType: TextInputType.emailAddress, 
          suffixIcon: const Icon(Icons.visibility_off, color: Colors.red), 
        ),
      ),
    );
  }
}
