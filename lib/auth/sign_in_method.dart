import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/screens/chat_screen.dart';
import 'package:groub_chat/widgets/messanger_snack_bar_widget.dart';

Future<void> signIn(
  BuildContext context, {
  required TextEditingController email,
  required TextEditingController password,
  required GlobalKey<FormState> formKey,
}) async {
  if (formKey.currentState!.validate()) {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      userCredential.user!.displayName;
      if (userCredential.user!.emailVerified) {
        Navigator.pushReplacementNamed(
          // ignore: use_build_context_synchronously
          context,
          ChatScreen.id,
          arguments: email.text,
        );
        // ignore: use_build_context_synchronously
        showSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          message: 'Welcome In Groub Chat',
          icon: Icons.verified,
          backgroundColor: kMainColor,
        );
      } else {
        showSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          message: 'Please check your email.',
          icon: Icons.email,
          backgroundColor: Colors.orange,
        );
      }
    } on FirebaseAuthException catch (e) {
      log(e.code.toString());
      if (e.code == 'invalid-credential') {
        // ignore: use_build_context_synchronously
        showSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          message: 'Email or Password is wrong',
          icon: Icons.close,
          backgroundColor: Colors.red,
        );
      } else if (e.code == 'invalid-email') {
        // ignore: use_build_context_synchronously
        showSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          message: 'Please Enter a Correct Email',
          icon: Icons.alternate_email_sharp,
          backgroundColor: Colors.yellow,
        );
      }
    }
  }
}
