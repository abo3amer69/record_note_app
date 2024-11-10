import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:record_notes_app/component/custombuttonauth.dart';
import 'package:record_notes_app/component/customtextfieldadd.dart';
import 'package:record_notes_app/note/view.dart';

class EditNote extends StatefulWidget {
  final String notedocid;
  final String categorydocid;
  final String value;
  const EditNote({super.key, required this.notedocid, required this.categorydocid, required this.value});

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController note = TextEditingController();

  bool isLoading = false;

  editNote() async {
    CollectionReference collectionnote = FirebaseFirestore.instance
        .collection('categories')
        .doc(widget.categorydocid)
        .collection('note');
    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});
      
            await collectionnote.doc(widget.notedocid).update({'note': note.text});

        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteView(categoryid: widget.categorydocid)));
      } catch (e) {
        isLoading = false;
        setState(() {});
        print("error $e");
      }
    }
  }
  @override
  void initState() {
    note.text=widget.value;
    super.initState();
  }

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      body: Form(
          key: formState,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 25,
                      ),
                      child: CustomTextFormAdd(
                        hinttext: 'Edit Your Note',
                        mycontroller: note,
                        validator: (val) {
                          if (val == '') {
                            return 'Can Not be Empty';
                          }
                        },
                      ),
                    ),
                    CustomButtonAuth(
                      title: 'Save',
                      onPressed: () {
                        editNote();
                      },
                    ),
                  ],
                )),
    );
  }
}
