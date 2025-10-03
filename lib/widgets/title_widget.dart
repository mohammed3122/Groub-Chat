import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: kFontFamily,
        fontSize: 30,
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
    );
  }
}
