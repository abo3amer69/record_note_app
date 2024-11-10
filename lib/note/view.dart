import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:record_notes_app/categories/edit.dart';
import 'package:record_notes_app/note/add.dart';
import 'package:record_notes_app/note/edit.dart';

class NoteView extends StatefulWidget {
  final String categoryid;
  const NoteView({super.key, required this.categoryid});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;

  getData() async {
    QuerySnapshot querySnapShot = await FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.categoryid)
        .collection('note')
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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddNote(docid: widget.categoryid)));
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('Note'),
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
        body: WillPopScope(
            child: isLoading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 160),
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditNote(
                                  notedocid: data[i].id,
                                  categorydocid: widget.categoryid,
                                  value: data[i]['note'])));
                        },
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              children: [Text('${data[i]['note']}')],
                            ),
                          ),
                        ),
                      );
                    }),
            onWillPop: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('homepage', (Route) => false);
              return Future.value(false);
            }));
  }
}
