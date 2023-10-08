import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  const FormFields(
      {Key? key,
      required this.hintText,
      required this.controller,
      required this.suffixIcon,
      this.validator,
      this.textInputType,
      this.onSaved,
      required this.obscureText,
      required this.borderSideColor,
      required this.borderRadius,
      required this.fontColor,
      required this.focusColor})
      : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final dynamic suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final Color borderSideColor;
  final double borderRadius;
  final Color fontColor;
  final Color focusColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: focusColor
      ),
      obscureText: obscureText,
      onSaved: onSaved,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: fontColor),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          focusedBorder: buildOutlineInputBorder(
              color: focusColor, borderRadius: borderRadius),
          enabledBorder: buildOutlineInputBorder(
              color: borderSideColor, borderRadius: borderRadius)),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(
      {required Color color, required double borderRadius}) {
    return OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(borderRadius));
  }
}
