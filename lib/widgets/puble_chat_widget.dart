import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/models/message_model.dart';
import 'package:intl/intl.dart';

class PubleChat extends StatelessWidget {
  const PubleChat({super.key, required this.message, required this.email});
  final MessageModel message;
  final String email;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = message.time.toDate();
    String formattedTime = DateFormat('a hh:mm').format(dateTime);

    // ✂️ ناخد الجزء اللي قبل @ فقط
    String displayEmail = message.email.split('@').first;

    return Align(
      alignment: message.email == email
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: message.email == email ? Colors.white : Color(0xff00bf63),
            borderRadius: message.email == email
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )
                : const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,

            mainAxisSize: MainAxisSize.min,
            children: [
              // 👤 اسم المستخدم جوه البابل
              Text(
                '#$displayEmail',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: message.email == email
                      ? Colors.black87
                      : Colors.white70,
                ),
              ),
              const SizedBox(height: 4),
              // 📨 الرسالة
              Text(
                message.message,
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontSize: 16,
                  color: message.email == email ? Colors.black : Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              // ⏰ الوقت
              Text(
                formattedTime,
                style: TextStyle(
                  fontSize: 12,
                  color: (message.email == email ? Colors.black : Colors.white)
                      // ignore: deprecated_member_use
                      .withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
