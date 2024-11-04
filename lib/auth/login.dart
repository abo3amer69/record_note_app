import 'package:flutter/material.dart';
import 'package:record_notes_app/component/custombuttonauth.dart';
import 'package:record_notes_app/component/customlogoauth.dart';
import 'package:record_notes_app/component/textformfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email=TextEditingController();
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
            CustomButtonAuth(title: 'Login',onPressed: (){}),
            Container(
              height: 20,
            ),
            MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red[700],
              textColor: Colors.white,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   const Text('Login Whith Google'),
                  const SizedBox(width: 10,),
                  Image.asset(
                    'imags/google.png',
                    width: 20,
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
            ),
          InkWell(
            onTap: (){
              Navigator.of(context).pushNamed('signup');
            },
            child: const Center(
               child:  Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Dont Have AN Account? ',
                      ),
                      TextSpan(
                        text: 'Register',
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
