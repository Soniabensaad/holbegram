import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/upload_image_screen.dart'; // Import the AddPicture screen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "YOUR_API_KEY",
      authDomain: "YOUR_AUTH_DOMAIN",
      projectId: "YOUR_PROJECT_ID",
      storageBucket: "YOUR_STORAGE_BUCKET",
      messagingSenderId: "YOUR_MESSAGING_SENDER_ID",
      appId: "YOUR_APP_ID",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a MaterialColor from the primary color
    MaterialColor primarySwatch = MaterialColor(
      Colors.white.value,
      <int, Color>{
        50: Colors.white,
        100: Colors.white,
        200: Colors.white,
        300: Colors.white,
        400: Colors.white,
        500: Colors.white,
        600: Colors.white,
        700: Colors.white,
        800: Colors.white,
        900: Colors.white,
      },
    );

    return MaterialApp(
      title: 'Holbegram',
      theme: ThemeData(
        primarySwatch: primarySwatch,
        colorScheme: ColorScheme.light(
          primary: Colors.white,
          onPrimary: Colors.black,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      initialRoute: '/', // Specify the initial route
      routes: {
        '/': (context) => MyHomePage(title: 'Holbegram'), // Change the title
        '/login': (context) => LoginScreen(
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
              passwordVisible: true,
            ),
        '/signup': (context) => SignUp(
              emailController: TextEditingController(),
              usernameController: TextEditingController(),
              passwordController: TextEditingController(),
              passwordConfirmController: TextEditingController(),
            ),
        '/add_picture': (context) => AddPicture( // Add the AddPicture screen route
              email: '', // Pass necessary parameters if needed
              password: '',
              username: '',
            ),
      },
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to login page
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Log in'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to sign up page
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Sign up'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to add picture page
                Navigator.pushNamed(context, '/add_picture');
              },
              child: Text('Add Picture'), // Add a button to navigate to the AddPicture screen
            ),
          ],
        ),
      ),
    );
  }
}
