import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/screens/sign_up_screen.dart';
import 'package:groub_chat/auth/sign_in_method.dart';
import 'package:groub_chat/widgets/custom_button.dart';
import 'package:groub_chat/widgets/custom_text_field.dart';
import 'package:groub_chat/widgets/an_account.dart';
import 'package:groub_chat/widgets/forget_password_widget.dart';
import 'package:groub_chat/widgets/logo_app_widget.dart';
import 'package:groub_chat/widgets/google_sign_in_button.dart';
import 'package:groub_chat/widgets/title_widget.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  static String id = 'SignInSreen';
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
              TitleWidget(title: 'Sign In'),
              SizedBox(height: 10),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'enter email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                isPassword: false,
                myController: email,
                onChanged: (val) {
                  val = email.text;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                keyboardType: TextInputType.text,
                hintText: 'enter password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.password),
                isPassword: true,
                hideText: true,
                myController: password,
                onChanged: (val) {
                  val = password.text;
                },
              ),
              SizedBox(height: 5),
              ForgetPasswordWidget(email: email),
              SizedBox(height: 20),
              CustomButton(
                titleButton: 'Sign In',
                onTap: () async {
                  await signIn(
                    context,
                    email: email,
                    password: password,
                    formKey: formKey,
                  );
                },
              ),
              SizedBox(height: 10),
              AnAccount(
                partOneText: "You don't have an account?",
                partTwoText: ' Sign up !',
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignUpScreen.id);
                },
              ),
              SizedBox(height: 20),
              GoogleSingInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
