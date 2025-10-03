import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/auth/google_sign_in.dart';

class GoogleSingInButton extends StatelessWidget {
  const GoogleSingInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await signInWithGoogle(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(2, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In with ',
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[
                        Colors.red,
                        Colors.orange,
                        Colors.green,
                        Colors.blue,
                      ],
                    ).createShader(const Rect.fromLTWH(70.0, 70.0, 70.0, 70.0)),
                ),
              ),
              Image.asset(
                'assets/images/google_logo.png',
                height: 60,
                width: 35,
              ),
              Text(
                'oogle',
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[
                        Colors.red,
                        Colors.orange,
                        Colors.green,
                        Colors.blue,
                      ],
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
