import 'package:flutter/material.dart';

import '../../../config/form_field.dart';
import '../../../utils/color_assets.dart';

class EmailSignup extends StatelessWidget {
  const EmailSignup({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return FormFields(
      hintText: 'Email',
      fontColor: ColorAssets.kColor,
      controller: emailController,
      suffixIcon: Icon(
        Icons.mail_outline,
        color: ColorAssets.kColor,
      ),
      obscureText: false,
      validator: (value) {
        if (value!.isEmpty) {
          return 'this is field is required';
        } else if (!RegExp(
            r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$')
            .hasMatch(value)) {
          return 'Invalid email address';
        }
        return null;
      },
      borderRadius: 10,
      borderSideColor: ColorAssets.kColor,
      focusColor: ColorAssets.kColor,
    );
  }
}
