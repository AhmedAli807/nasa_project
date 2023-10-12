import 'package:flutter/material.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';

import '../../../utils/font_style.dart';

class DescriptionItem extends StatelessWidget {
  const DescriptionItem({Key? key, required this.nameImage, required this.title, required this.desc}) : super(key: key);
final String nameImage;
final String title;
final String desc;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(title,style: Styles.textStyle16.copyWith(color: ColorAssets.kColor),),
        backgroundColor: ColorAssets.backgroundColor,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.keyboard_backspace_rounded,
        color: ColorAssets.kColor,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Container(
          height: ScreenSize.height(context) ,
          width: ScreenSize.width(context) ,
          decoration: BoxDecoration(
              color: ColorAssets.secondaryColor,
              borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(nameImage,
                          height: ScreenSize.height(context) * 0.5,
                          width: ScreenSize.width(context) ,),
                      ),
                        SizedBox(
                          height: ScreenSize.height(context)*0.02,
                        ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(desc,
                        style: Styles.textStyle14.copyWith(color: ColorAssets.backgroundColor),),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ) ,
    ));
  }
}
