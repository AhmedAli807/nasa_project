import 'package:flutter/material.dart';
import 'package:nasa_project/config/form_field.dart';

import '../../../utils/color_assets.dart';

class PasswordLogin extends StatefulWidget {
  const PasswordLogin({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordLogin> createState() => _PasswordLoginState();
}

class _PasswordLoginState extends State<PasswordLogin> {
   bool isPassword =false;

  @override
  Widget build(BuildContext context) {
    return FormFields(
      hintText: 'Password',
      fontColor: ColorAssets.kColor,
      controller: widget.passwordController,
      suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
          icon: isPassword
              ? Icon(
            Icons.visibility_off_outlined,
            color: ColorAssets.kColor,
          )
              : Icon(
            Icons.remove_red_eye_outlined,
            color: ColorAssets.kColor,
          )),
      obscureText: isPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this is field is required';
        }
      },
      borderRadius: 10,
      borderSideColor: ColorAssets.kColor,
      focusColor: ColorAssets.kColor,
    );
  }
}
