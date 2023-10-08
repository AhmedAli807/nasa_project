import 'package:flutter/material.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key,required this.title,required this.height,required this.width,required this.onPressed, required this.primaryColor, required this.secondaryColor, required this.fontSize}) : super(key: key);
final String title;
final double height;
final double width;
  final void Function() onPressed;
  final Color primaryColor;
  final Color secondaryColor;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          height:ScreenSize.height(context)*height,
          width: ScreenSize.width(context)*width,
          decoration:  BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10)
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
