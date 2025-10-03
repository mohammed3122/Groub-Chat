import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/models/info_model.dart';
import 'package:groub_chat/auth/sign_out_method.dart';
import 'package:groub_chat/widgets/custom_button.dart';
import 'package:groub_chat/widgets/info_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static final String id = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return StreamBuilder<DocumentSnapshot>(
      stream: users
          .doc(currentUser!.uid)
          .snapshots(), // ✅ متابعة التغيرات مباشرة
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          var data = snapshot.data!;
          List<InfoModel> userinfo = [
            InfoModel(
              icon: Icons.person,
              desc: data['fristName'] ?? 'لم يتم ادخالها',
              title: 'Frist Name',
            ),
            InfoModel(
              icon: Icons.person_outline_outlined,
              desc: data['lastName'] ?? 'لم يتم ادخالها',
              title: 'End Name',
            ),
            InfoModel(
              icon: Icons.cake,
              desc: data['age'] ?? 'لم يتم ادخالها',
              title: 'Your age',
            ),
            InfoModel(
              icon: Icons.phone,
              desc: data['phoneNumber'] ?? 'لم يتم ادخالها',
              title: 'Your Number',
            ),
            InfoModel(
              icon: Icons.email,
              desc: data['email'] ?? 'لم يتم ادخالها',
              title: 'Your Email',
            ),
          ];

          return Scaffold(
            backgroundColor: kMainColor,
            appBar: AppBar(
              centerTitle: true,
              iconTheme: const IconThemeData(size: 30, color: Colors.white),
              backgroundColor: Colors.transparent,
              title: Text(
                'Your Profile',
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            body: ListView(
              children: [
                SizedBox(
                  height: 430,
                  child: ListView.builder(
                    itemCount: userinfo.length,
                    itemBuilder: (context, index) {
                      return InfoWidget(info: userinfo[index]);
                    },
                  ),
                ),

                CustomButton(
                  colorTitle: Colors.red,
                  titleButton: 'تسجيل الخروج',
                  onTap: () async {
                    await signOut(context);
                  },
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            backgroundColor: kMainColor,
            body: const Center(child: Text('There is an error')),
          );
        }
        return Scaffold(
          backgroundColor: kMainColor,
          body: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        );
      },
    );
  }
}
