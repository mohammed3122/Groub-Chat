import 'package:flutter/material.dart';
import 'package:groub_chat/widgets/custom_text_field.dart';

// ignore: must_be_immutable
class InputFields extends StatelessWidget {
  const InputFields({
    super.key,
    required this.fristName,
    required this.endName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.age,
  });
  final TextEditingController fristName;
  final TextEditingController endName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController phoneNumber;
  final TextEditingController age;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: 350,
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Enter first name',
                  labelText: 'First Name',
                  prefixIcon: const Icon(Icons.person),
                  isPassword: false,
                  keyboardType: TextInputType.text,
                  myController: fristName,
                  onChanged: (data) {
                    data = fristName.text;
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  myController: endName,
                  hintText: 'Enter last name',
                  labelText: 'Last Name',
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(Icons.person_outline),
                  isPassword: false,
                  onChanged: (val) {
                    val = endName.text;
                  },
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),
          SizedBox(
            width: 350,
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  hintText: 'Enter email',
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  isPassword: false,
                  myController: email,
                  onChanged: (val) {
                    val = email.text;
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  myController: password,
                  keyboardType: TextInputType.text,
                  hintText: 'Enter password',
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  isPassword: true,
                  hideText: true,
                  onChanged: (val) {
                    val = password.text;
                  },
                ),
              ],
            ),
          ),

          const SizedBox(width: 15),
          SizedBox(
            width: 350,
            child: Column(
              children: [
                SizedBox(height: 10),
                CustomTextField(
                  keyboardType: TextInputType.phone,
                  hintText: 'Enter phone number',
                  labelText: 'Phone',
                  prefixIcon: const Icon(Icons.phone),
                  isPassword: false,
                  myController: phoneNumber,
                  onChanged: (val) {
                    val = phoneNumber.text;
                  },
                ),
                SizedBox(height: 15),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  hintText: 'Enter age',
                  labelText: 'Age',
                  prefixIcon: const Icon(Icons.cake),
                  isPassword: false,
                  myController: age,
                  onChanged: (val) {
                    val = age.text;
                  },
                ),
              ],
            ),
          ),
          // const SizedBox(width: 15),
        ],
      ),
    );
  }
}
