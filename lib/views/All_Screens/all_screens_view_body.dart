import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import 'package:nasa_project/views/pick_fire/pick_image_view.dart';

import '../../utils/color_assets.dart';
import '../../utils/font_style.dart';
import '../factory_map/factory_map_view.dart';
import '../home/home_view.dart';
import '../map_fire/map_view.dart';

class AllScreensViewBody extends StatefulWidget {
  const AllScreensViewBody({Key? key}) : super(key: key);

  @override
  State<AllScreensViewBody> createState() => _AllScreensViewBodyState();
}

class _AllScreensViewBodyState extends State<AllScreensViewBody> {
  int selectedIndex = 0;
  List<Widget> tabItems = [
    const HomeView(),
   const  MapView(),
    const FactoryMapView(),
    const PickImageView(),
  ];
  Widget build(BuildContext context) {
    // var provider = Provider.of<BottomNavigationProvider>(
    //     context, listen: false);
    // var selectIndex = provider.selectedIndex;
    return SafeArea(child:
    Scaffold(
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: selectedIndex
            ,
        iconSize: 30,
        showElevation: false,
        onItemSelected: (index) {
          setState(() {
            selectedIndex=index;

          });
        },
        items: [
          FlashyTabBarItem(icon: Icon(Icons.home,
            color: ColorAssets.secondaryColor,), title: Text('Home',
            style: Styles.textStyle14.copyWith(color: ColorAssets.kColor),)),
          FlashyTabBarItem(icon: Icon(Icons.local_fire_department_sharp,
            color: ColorAssets.secondaryColor,), title: Text('Fire ',
            style: Styles.textStyle14.copyWith(color: ColorAssets.kColor),)),
          FlashyTabBarItem(icon: Icon(Icons.factory,
            color: ColorAssets.secondaryColor,), title: Text('Factory ',
            style: Styles.textStyle14.copyWith(color: ColorAssets.kColor),)),
          FlashyTabBarItem(icon: Icon(Icons.volunteer_activism,
            color: ColorAssets.secondaryColor,), title: Text('Volunteer',
            style: Styles.textStyle14.copyWith(color: ColorAssets.kColor),)),
        ],
      ),
      body: tabItems[selectedIndex],
    ));
  }
}
