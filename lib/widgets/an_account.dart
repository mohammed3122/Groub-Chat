import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';

class AnAccount extends StatelessWidget {
  const AnAccount({
    super.key,
    required this.partOneText,
    required this.partTwoText,
    required this.onTap,
  });
  final String partOneText;
  final String partTwoText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: partOneText,
              style: TextStyle(
                fontFamily: kFontFamily,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 4, 71, 148),
              ),
            ),

            TextSpan(
              text: partTwoText,
              style: TextStyle(
                fontFamily: kFontFamily,
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
