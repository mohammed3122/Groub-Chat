import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/widgets/messanger_snack_bar_widget.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({super.key, required this.email});
  final TextEditingController email;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (email.text.isEmpty) {
          showSnackBarMessage(
            context,
            message: 'Please Enter Email',
            icon: Icons.warning,
            backgroundColor: Colors.yellow,
          );
          return;
        }

        try {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
          showSnackBarMessage(
            // ignore: use_build_context_synchronously
            context,
            message: 'Check You Email If Your Is Wrong',
            icon: Icons.email,
            backgroundColor: Colors.orange,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-email') {
            showSnackBarMessage(
              // ignore: use_build_context_synchronously
              context,
              message: 'Please Enter a Correct Email',
              icon: Icons.warning,
              backgroundColor: Colors.yellow,
            );
            return;
          }
        }
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          'forget password?',
          style: TextStyle(
            fontFamily: kFontFamily,
            fontSize: 19,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
