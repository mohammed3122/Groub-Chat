import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/screens/sign_in_screen.dart';
import 'package:groub_chat/widgets/messanger_snack_bar_widget.dart';

Future<void> signUp(
  BuildContext context, {
  required GlobalKey<FormState> formKey,
  required TextEditingController fristName,
  required TextEditingController endName,
  required TextEditingController email,
  required TextEditingController phoneNumber,
  required TextEditingController password,
  required TextEditingController age,
  required CollectionReference users,
}) async {
  if (formKey.currentState!.validate()) {
    try {
      // ignore: unused_local_variable
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email.text,
            password: password.text,
          );
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      await users.doc(credential.user!.uid).set({
        'fristName': fristName.text,
        'lastName': endName.text,
        'email': email.text,
        'phoneNumber': phoneNumber.text,
        'age': age.text,
      });
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, SignInScreen.id);
      showSnackBarMessage(
        // ignore: use_build_context_synchronously
        context,
        message: 'Now You Can Sign In In App',
        icon: Icons.verified,
        backgroundColor: Colors.green,
      );
    } on FirebaseAuthException catch (e) {
      log(e.code.toString());
      if (e.code == 'weak-password') {
        showSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          message: 'Password is very Weak',
          icon: Icons.info,
          backgroundColor: Colors.purple,
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
      } else if (e.code == 'email-already-in-use') {
        showSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          message: 'The account already exists for that email',
          icon: Icons.arrow_circle_down,
          backgroundColor: kMainColor,
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
