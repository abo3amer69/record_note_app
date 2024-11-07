import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.of(context).pushNamed('addcategory');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
              onPressed: () async {
                GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('login', (Route) => false);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 160),
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    'imags/folder.png',
                    height: 100,
                  ),
                  Text('Company'),
                ],
              ),
            ),
          ),
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.asset(
                    'imags/folder.png',
                    height: 100,
                  ),
                  Text('Home'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
