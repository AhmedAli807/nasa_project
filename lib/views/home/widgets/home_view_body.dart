import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:nasa_project/utils/font_style.dart';
import 'home_drawer.dart';
import 'list_view_awareness.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
          elevation: 0,
          title: Text('Hello',
            style: Styles.textStyle18.copyWith(
                color: ColorAssets.secondaryColor),),
          backgroundColor: ColorAssets.backgroundColor,
          actions: [
            IconButton(onPressed: () {},
                icon: Icon(
                  Icons.notifications, color: ColorAssets.secondaryColor,))
          ],
          leading: IconButton(onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          }, icon: Icon(Icons.menu, color: ColorAssets.secondaryColor,))
      ),
      drawer: const HomeDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text("Let's protect you from fires",
                  style: Styles.textStyle14.copyWith(
                      color: ColorAssets.kColor),),
              ),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Text("Articles on the impact of fires around the world.",
                style: Styles.textStyle18.copyWith(color: ColorAssets.kColor),),
              SizedBox(
                height: ScreenSize.height(context) * 0.02,
              ),
              Column(
                children: [
                  SizedBox(
                    height: ScreenSize.height(context) * 0.68,
                    child:const  ListViewAwareness(),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    ));
  }
}


