import 'package:flutter/material.dart';

import '../../../config/form_field.dart';
import '../../../utils/color_assets.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
   bool isPassword=false;
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
        } else if (!RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
        ).hasMatch(value)) {
          return 'Your password is weak';
        }
        return null;
      },
      borderRadius: 10,
      borderSideColor: ColorAssets.kColor,
      focusColor: ColorAssets.kColor,
    );
  }
}
