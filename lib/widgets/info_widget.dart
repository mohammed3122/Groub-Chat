import 'package:flutter/material.dart';
import 'package:groub_chat/consts.dart';
import 'package:groub_chat/helper/show_dialog.dart';
import 'package:groub_chat/models/info_model.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.info});
  final InfoModel info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: [
            info.desc == 'لم يتم ادخالها'
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.normal,
                            blurRadius: 2,
                            // ignore: deprecated_member_use
                            color: Colors.black.withOpacity(0.5),
                            offset: Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade300,
                      ),
                      height: 40,
                      child: IconButton(
                        onPressed: () {
                          showEditDialog(context, info: info);
                        },
                        icon: const Icon(Icons.edit, color: kMainColor),
                      ),
                    ),
                  )
                : const SizedBox(),
            Spacer(flex: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  info.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: kMainColor,
                    fontFamily: kFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  info.desc,
                  style: TextStyle(
                    fontSize: 18,
                    color: info.desc == 'لم يتم ادخالها'
                        ? Colors.grey
                        : Colors.black,
                    fontFamily: kFontFamily,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(info.icon, color: kMainColor, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
