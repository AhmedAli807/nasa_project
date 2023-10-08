import 'package:flutter/material.dart';
import 'package:nasa_project/config/screen_size.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.primaryColor,
      required this.secondaryColor,
      required this.fontSize, required this.height, required this.width})
      : super(key: key);
  final String title;
  final void Function() onTap;
  final Color primaryColor;
  final Color secondaryColor;
  final double fontSize;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onTap,
        child: Container(
          height:ScreenSize.height(context)*height,
          width: ScreenSize.width(context)*width,
          decoration:  BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            border: Border.all(color: secondaryColor)
          ),
          child: Center(
            child: Text(title,style: TextStyle(
                fontSize: fontSize,
                color: secondaryColor
            ),),
          ),
        ),
      ),
    );
  }
}
