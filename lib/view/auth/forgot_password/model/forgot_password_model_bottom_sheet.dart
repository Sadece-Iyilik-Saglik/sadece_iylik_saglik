import 'package:flutter/material.dart';

import '../../../../core/constants/text_strings.dart';
import '../view/forgot_password_btn_widget.dart';
import '../view/forgot_password_mail.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_rounded,
              title: "E-mail",
              subtitle: resetViaEmail,
              onTap: () {
                Navigator.pop(context); //bottom sheetten öncekine döneriz
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordMailScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
