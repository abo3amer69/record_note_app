import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:record_notes_app/component/custombuttonauth.dart';
import 'package:record_notes_app/component/customtextfieldadd.dart';

class EditCategory extends StatefulWidget {
  final String docId;
  final String oldName;
  const EditCategory.EditCategory(
      {super.key, required this.docId, required this.oldName});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  bool isLoading = false;

  editCategory() async {
    if (formState.currentState!.validate()) {
      try {
        isLoading = true;
        setState(() {});
        await categories.doc(widget.docId).set({'name': name.text});

        Navigator.of(context)
            .pushNamedAndRemoveUntil('homepage', (Route) => false);
      } catch (e) {
        isLoading = false;
        setState(() {});
        print("error $e");
      }
    }
  }

  @override
  void dispose() {
    name.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    name.text = widget.oldName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
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
                        hinttext: 'Enter Name',
                        mycontroller: name,
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
                        editCategory();
                      },
                    ),
                  ],
                )),
    );
  }
}
