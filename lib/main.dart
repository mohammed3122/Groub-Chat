import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groub_chat/firebase_options.dart';
import 'package:groub_chat/screens/chat_screen.dart';
import 'package:groub_chat/screens/profile_screen.dart';
import 'package:groub_chat/screens/sign_in_screen.dart';
import 'package:groub_chat/screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(GroubChat());
}

class GroubChat extends StatefulWidget {
  const GroubChat({super.key});

  @override
  State<GroubChat> createState() => _GroubChatState();
}

class _GroubChatState extends State<GroubChat> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groub Chat',
      debugShowCheckedModeBanner: false,
      initialRoute: SignInScreen.id,
      routes: {
        SignInScreen.id: (context) => SignInScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
