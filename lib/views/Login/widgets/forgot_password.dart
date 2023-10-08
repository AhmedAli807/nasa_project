import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/authentication/login/reset_password_provider.dart';
import '../../../utils/color_assets.dart';
import '../../../utils/font_style.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            if (emailController.text == "") {
              AwesomeDialog(context: context,
                  title: 'Error',
                  desc: 'Please enter the email to reset your password',
                  descTextStyle: TextStyle(
                      color: ColorAssets.kColor
                  ),
                  animType: AnimType.rightSlide,
                  dialogType: DialogType.error
              ).show();
            }
            try {
              Provider.of<ResetPasswordProvider>(
                  context, listen: false).resetPassword(
                  email: emailController.text);
            }catch(e){
              print(e);
            }
          }

          ,
          child: Text('Forgot password ?',
              style: Styles.textStyle14
                  .copyWith(color: ColorAssets
                  .secondaryColor))),
    );
  }
}
