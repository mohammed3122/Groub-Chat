import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';

class MessageTextField extends StatelessWidget {
  const MessageTextField({
    super.key,
    required this.controller,
    required this.messages,
    required this.email,
  });
  final TextEditingController controller;
  final CollectionReference messages;
  final String email;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (data) {
        messages.add({
          'message': data,
          'time': FieldValue.serverTimestamp(),
          'email': email,
        });

        controller.clear();
      },
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: kMainColor,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            height: 50,
            width: 50,
            child: Center(
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.send, color: Colors.white, size: 30),
              ),
            ),
          ),
        ),
        prefixIcon: Icon(Icons.face, color: Colors.white, size: 30),
        hintText: 'enter message...',
        hintStyle: TextStyle(
          color: Colors.grey,
          fontFamily: kFontFamily,
          fontSize: 20,
        ),
        filled: true,
        // ignore: deprecated_member_use
        fillColor: Colors.white.withOpacity(.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 4, 71, 148),
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 4, 71, 148),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 4, 71, 148),
            width: 2,
          ),
        ),
      ),
    );
  }
}
