import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/models/message_model.dart';
import 'package:groub_chat/screens/profile_screen.dart';
import 'package:groub_chat/widgets/message_text_field.dart';
import 'package:groub_chat/widgets/puble_chat_widget.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static final String id = 'ChatScreen';
  CollectionReference messages = FirebaseFirestore.instance.collection(
    'messages',
  );
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController controller = TextEditingController();
  ScrollController controllerListView = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    String displayEmail = email.split('@').first;
    return StreamBuilder(
      stream: messages.orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MessageModel> messagesList = [];
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (controllerListView.hasClients) {
              controllerListView.animateTo(
                controllerListView.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            }
          });

          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(MessageModel.fromjson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            backgroundColor: kMainColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Image.asset(klogoApp, height: 170),
                  Text('#$displayEmail', style: TextStyle(fontSize: 15)),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ProfileScreen.id);
                  },
                  icon: Icon(Icons.person, color: Colors.white, size: 40),
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: controllerListView,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return PubleChat(
                        message: messagesList[index],
                        email: email,
                      );
                    },
                  ),
                ),
                MessageTextField(
                  controller: controller,
                  messages: messages,
                  email: email,
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text(' there is an err')));
        }
        return Scaffold(
          backgroundColor: kMainColor,
          body: Center(child: CircularProgressIndicator(color: Colors.white)),
        );
      },
    );
  }
}
