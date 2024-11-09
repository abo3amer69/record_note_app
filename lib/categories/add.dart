import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:record_notes_app/component/custombuttonauth.dart';
import 'package:record_notes_app/component/customtextfieldadd.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController name = TextEditingController();

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  addCategory() async {
    if (formState.currentState!.validate()) {
      try {
        DocumentReference response = await categories.add(
            {'name': name.text, 'id': FirebaseAuth.instance.currentUser!.uid});
        Navigator.of(context).pushReplacementNamed('homepage');
      } catch (e) {
        print("error $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
      ),
      body: Form(
          key: formState,
          child: Column(
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
                title: 'Add',
                onPressed: () {
                  addCategory();
                },
              ),
            ],
          )),
    );
  }
}
