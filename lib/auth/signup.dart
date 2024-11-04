import 'package:flutter/material.dart';
import 'package:record_notes_app/component/custombuttonauth.dart';
import 'package:record_notes_app/component/customlogoauth.dart';
import 'package:record_notes_app/component/textformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController email=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password = TextEditingController();
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
                const CustomLogoAuth(),
                Container(
                  height: 20,
                ),
                const Text(
                  'SignUp',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 10,
                ),
                const Text(
                  'SignUp To Continue Using The App',
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 20,
                ),
                 const Text(
                  'UserName',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(height: 10,),
                CustomTextForm(hinttext: 'Enter Your UserName', mycontroller: username),
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                CustomTextForm(hinttext: 'Enter Your Email', mycontroller: email),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                CustomTextForm(hinttext: 'Enter Your Password', mycontroller: password),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.topRight,
                  child: const Text(
                    'Forget Password?',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            CustomButtonAuth(title: 'SignUp',onPressed: (){}),
            Container(
              height: 20,
            ),
            
            Container(
              height: 20,
            ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('login');
            },
            child: const Center(
               child:  Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Have AN Account? ',
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
             ),
          ),
          ],
        ),
      ),
    );
  }
}
