import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:record_notes_app/categories/edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;

  getData() async {
    QuerySnapshot querySnapShot = await FirebaseFirestore.instance
        .collection('categories')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapShot.docs);
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

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
      body: isLoading == true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 160),
              itemBuilder: (context, i) {
                return InkWell(
                  onLongPress: () {
                    AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'What DO You Want',
                        btnCancelText: 'Delet',
                        btnOkText: 'Updat',
                        btnCancelOnPress: () async {
                          await FirebaseFirestore.instance
                              .collection('categories')
                              .doc(data[i].id)
                              .delete();
                          Navigator.of(context)
                              .pushReplacementNamed('homepage');
                        },
                        btnOkOnPress: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditCategory.EditCategory(
                                  docId: data[i].id,
                                  oldName: data[i]['name'])));
                        }).show();
                  },
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset(
                            'imags/folder.png',
                            height: 100,
                          ),
                          Text('${data[i]['name']}')
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
