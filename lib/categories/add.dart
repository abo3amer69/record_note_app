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
                onPressed: (){},
              ),
            ],
          )),
    );
  }
}
