import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/screens/sign_in_screen.dart';
import 'package:groub_chat/auth/sign_up_method.dart';
import 'package:groub_chat/widgets/custom_button.dart';
import 'package:groub_chat/widgets/an_account.dart';
import 'package:groub_chat/widgets/input_fields.dart';
import 'package:groub_chat/widgets/logo_app_widget.dart';
import 'package:groub_chat/widgets/title_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static String id = 'SignUpSreen';
  final TextEditingController fristName = TextEditingController();
  final TextEditingController endName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController age = TextEditingController();
  final CollectionReference users = FirebaseFirestore.instance.collection(
    'users',
  );
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(child: LogoAppWidget()),
              TitleWidget(title: 'Sign Up'),
              const SizedBox(height: 10),
              InputFields(
                fristName: fristName,
                endName: endName,
                email: email,
                password: password,
                phoneNumber: phoneNumber,
                age: age,
              ),
              // 🔹 تلميح للمستخدم إنه يعمل Scroll
              Center(
                child: Text(
                  '⇠  Swipe to fill all required fields  ⇢',
                  style: TextStyle(
                    fontFamily: kFontFamily,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              CustomButton(
                titleButton: 'Sign Up',
                onTap: () async {
                  await signUp(
                    context,
                    formKey: formKey,
                    fristName: fristName,
                    endName: endName,
                    email: email,
                    phoneNumber: phoneNumber,
                    password: password,
                    age: age,
                    users: users,
                  );
                },
              ),
              const SizedBox(height: 10),

              AnAccount(
                partOneText: 'You have an account ?',
                partTwoText: ' Sign In !',
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignInScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
