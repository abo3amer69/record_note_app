import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:record_notes_app/auth/login.dart';
import 'package:record_notes_app/auth/signup.dart';
import 'package:record_notes_app/categories/add.dart';
import 'package:record_notes_app/firebase_options.dart';
import 'package:record_notes_app/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('==================User is currently signed out!');
      } else {
        print('=======================User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey[50],
            titleTextStyle: const TextStyle(
                color: Colors.orange,
                fontSize: 17,
                fontWeight: FontWeight.bold),
            iconTheme: const IconThemeData(
              color: Colors.orange,
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: (FirebaseAuth.instance.currentUser != null &&
              FirebaseAuth.instance.currentUser!.emailVerified)
          ? HomePage()
          : Login(),
      routes: {
        'signup': (context) => const SignUp(),
        'login': (context) => const Login(),
        'homepage': (context) => const HomePage(),
        'addcategory': (context) => const AddCategory(),
      },
    );
  }
}
