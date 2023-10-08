import 'package:flutter/material.dart';
import 'package:nasa_project/utils/color_assets.dart';

import '../../../config/form_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return FormFields(
      hintText: 'Phone number',
      textInputType: TextInputType.phone,
      controller: phoneController,
      suffixIcon: Icon(
        Icons.phone_enabled_outlined,
        color: ColorAssets.kColor,
      ),
      obscureText: false,
      borderSideColor: ColorAssets.kColor,
      borderRadius: 10,
      fontColor: ColorAssets.kColor,
      focusColor: ColorAssets.kColor,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        // else if(!RegExp(
        //   r'^\(\d{3}\) \d{3}-\d{4}$',
        // ).hasMatch(value)){
        //   return 'Invalid phone number';
        // }
        // return null;
      },
    );
  }
}
