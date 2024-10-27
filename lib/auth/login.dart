import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 80,
                    height: 80,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Image.asset(
                      'imags/logo.jpg',
                      width: 40,
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 10,
                ),
                const Text(
                  'Login To Continue Using The App',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 20,
                ),
                const Text('Email'),
                TextFormField(),
                const Text('Password'),
                TextFormField(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
