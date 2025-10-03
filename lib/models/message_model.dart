import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String email;
  final Timestamp time;
  MessageModel({
    required this.time,
    required this.email,
    required this.message,
  });

  factory MessageModel.fromjson(json) {
    return (MessageModel(
      message: json['message'],
      email: json['email'],
      time: json['time'] ?? Timestamp.now(),
    ));
  }
}
