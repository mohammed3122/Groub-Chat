import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titleButton,
    required this.onTap,
    this.colorTitle = kMainColor,
  });
  final String titleButton;
  final VoidCallback onTap;
  final Color colorTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.5),
                offset: Offset(2, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(30),
            color: Color(0xfffffdfe),
          ),
          child: Center(
            child: Text(
              titleButton,
              style: TextStyle(
                fontFamily: kFontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: colorTitle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
