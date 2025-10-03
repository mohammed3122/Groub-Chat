import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';

class LogoAppWidget extends StatelessWidget {
  const LogoAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Stack(
        children: [
          Image.asset(klogoApp, height: 250, width: 300, fit: BoxFit.cover),
          Positioned(
            bottom: 30, // المسافة من أسفل الصورة
            left: 0,
            right: 45, // يخلي النص في المنتصف أفقياً
            child: Text(
              'Groub Chat',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                fontFamily: kFontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 5,
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
