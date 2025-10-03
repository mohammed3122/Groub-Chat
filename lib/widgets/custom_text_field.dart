import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.isPassword,
    this.hideText = false,
    required this.keyboardType,
    required this.myController,
    required this.onChanged,
  });

  final String hintText;
  final String labelText;
  final Widget prefixIcon;
  final bool isPassword;
  final bool hideText;
  final Function(String) onChanged;
  final TextEditingController myController;
  final TextInputType keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _hideText = widget.hideText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: (data) {
          if (data!.isEmpty) {
            return 'this field required';
          }
          return null;
        },
        controller: widget.myController,
        obscureText: _hideText,
        keyboardType: widget.keyboardType,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _hideText = !_hideText;
                    });
                  },
                  icon: _hideText == true
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                )
              : null,
          prefixIcon: widget.prefixIcon,
          hintText: widget.hintText,
          labelText: widget.labelText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: kFontFamily,
            fontSize: 20,
          ),
          labelStyle: TextStyle(
            color: Colors.black,
            fontFamily: kFontFamily,

            fontSize: 23,
          ),
          filled: true,
          // ignore: deprecated_member_use
          fillColor: Colors.white.withOpacity(.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 4, 71, 148),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 4, 71, 148),
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 4, 71, 148),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
