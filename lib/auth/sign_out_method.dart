import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groub_chat/screens/sign_in_screen.dart';

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  GoogleSignIn googleSignIn = GoogleSignIn();
  googleSignIn.disconnect();
  Navigator.pushNamedAndRemoveUntil(
    // ignore: use_build_context_synchronously
    context,
    SignInScreen.id,
    (route) => false,
  );
}
