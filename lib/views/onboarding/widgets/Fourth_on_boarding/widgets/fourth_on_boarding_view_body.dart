import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/utils/font_style.dart';

class FourthOnBoardingViewBody extends StatelessWidget {
  const FourthOnBoardingViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            height: ScreenSize.height(context)*0.7,
            width: ScreenSize.width(context),
            decoration: BoxDecoration(
                color: ColorAssets.secondaryColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize.height(context)*0.02,
                  ),
                  Center(child: Lottie.asset('lottie/gps.json')),
                  SizedBox(
                    height: ScreenSize.height(context) * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'You can join and volunteer with us to discover the locations of fires firsthand by taking a picture of the fire, determining the type of fire, and determining your current location by opening the GPS.',
                        style: Styles.textStyle16.copyWith(color: ColorAssets.backgroundColor)),
                  ),
                  SizedBox(
                    height: ScreenSize.height(context)*0.02,
                  )


                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
