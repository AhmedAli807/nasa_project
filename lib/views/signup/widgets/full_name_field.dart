import 'package:flutter/material.dart';
import 'package:nasa_project/config/form_field.dart';
import 'package:nasa_project/utils/color_assets.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
    required this.nameController,
  });

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return FormFields(
      hintText: 'Full Name',
      fontColor: ColorAssets.kColor,
      controller: nameController,
      suffixIcon: Icon(
        Icons.person,
        color: ColorAssets.kColor,
      ),
      obscureText: false,
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
