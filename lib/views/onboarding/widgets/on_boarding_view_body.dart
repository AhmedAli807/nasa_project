import 'package:flutter/material.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/views/home/home_view.dart';
import 'package:nasa_project/views/onboarding/widgets/Fourth_on_boarding/fourth_on_boarding_view.dart';
import 'package:nasa_project/views/onboarding/widgets/Second_on_boarding/second_on_boarding_view.dart';
import 'package:nasa_project/views/onboarding/widgets/Third_on_boarding/third_on_boarding_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/font_style.dart';
import 'First_on_boarding/first_onboarding_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  OnBoardingViewBody({Key? key}) : super(key: key);
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenSize.height(context) * 0.1,
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.7,
              child: PageView(
                controller: _controller,
                children: const [
                  FirstOnBoardingView(),
                  SecondOnBoardingView(),
                  ThirdOnBoardingView(),
                  FourthOnBoardingView()
                ],
              ),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: ExpandingDotsEffect(
                  activeDotColor: ColorAssets.secondaryColor,
                  dotColor: ColorAssets.secondaryColor.withOpacity(0.5),
                  dotHeight: ScreenSize.height(context) * 0.02,
                  dotWidth: ScreenSize.width(context) * 0.05
              ),
            ),
            SizedBox(
              height: ScreenSize.height(context) * 0.02,
            ),
            Container(
                height: ScreenSize.height(context) * 0.06,
                width: ScreenSize.width(context) * 0.6,
                decoration: BoxDecoration(
                  color: ColorAssets.kColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: MaterialButton(onPressed: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => const HomeView()), (
                          route) => false);
                },
                  child: Center(
                    child: Text('Next',
                        style: Styles.textStyle16.copyWith(
                            color: ColorAssets.backgroundColor)),
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
