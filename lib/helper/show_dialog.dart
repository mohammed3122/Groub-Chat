import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/models/info_model.dart';

void showEditDialog(BuildContext context, {required InfoModel info}) {
  final TextEditingController controller = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          info.title,
          style: TextStyle(
            fontFamily: kFontFamily,
            fontWeight: FontWeight.bold,
            color: kMainColor,
          ),
        ),
        content: TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          decoration: InputDecoration(
            hintText: "enter ${info.title.toLowerCase()}",
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: const Color.fromARGB(255, 4, 71, 148),
                width: 2,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // إغلاق من غير حفظ
            },
            child: const Text(
              "close",
              style: TextStyle(
                fontFamily: kFontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: kMainColor),
            onPressed: () async {
              String newValue = controller.text.trim();
              if (newValue.isNotEmpty) {
                try {
                  final currentUser = FirebaseAuth.instance.currentUser;
                  if (currentUser != null) {
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUser.uid)
                        .update({getFieldName(info: info): newValue});
                    log("تم تحديث ${info.title}: $newValue");
                  }
                } catch (e) {
                  log("خطأ في التحديث: $e");
                }
              }
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Text(
              "done",
              style: TextStyle(
                fontFamily: kFontFamily,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}

/// 📝 دالة تجيب اسم الحقل المناسب من Firestore
String getFieldName({required InfoModel info}) {
  switch (info.title) {
    case 'First Name':
      return 'fristName'; // خليه نفس اللي في Firestore
    case 'Last Name':
      return 'lastName';
    case 'Your age':
      return 'age';
    case 'Your Number':
      return 'phoneNumber';
    case 'Your Email':
      return 'email';
    default:
      return 'unknown';
  }
}
