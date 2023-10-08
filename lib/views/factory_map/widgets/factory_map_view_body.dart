import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_project/utils/color_assets.dart';

class FactoryMapViewBody extends StatefulWidget {
  const FactoryMapViewBody({Key? key}) : super(key: key);

  @override
  State<FactoryMapViewBody> createState() => _FactoryMapViewBodyState();
}

class _FactoryMapViewBodyState extends State<FactoryMapViewBody> {
  late GoogleMapController googleMapController;

  CameraPosition initialPosition =
  const CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 14);




  @override
  Widget build(BuildContext context) {
    List<Marker> markers = [
       Marker(markerId: MarkerId('1',
      ),
          position: const LatLng(30.974116373185318, 31.283286467781075),
      onTap: (){
        AwesomeDialog(context: context,
          animType: AnimType.rightSlide,
          title: 'Nabil Mostafa Imran Factory',
          titleTextStyle: TextStyle(
              color: ColorAssets.kColor
          ),
          desc: ' Phone : 01000966846',
          descTextStyle: TextStyle(
              color: ColorAssets.kColor
          ),
        )..show();
      }),
      Marker(markerId: MarkerId('2',
      ),
          position: const LatLng(31.22858588322469, 31.311639082463838),
          onTap: (){
          AwesomeDialog(context: context,
            animType: AnimType.rightSlide,
            title: ' Almotaheda Factory',
            titleTextStyle: TextStyle(
              color: ColorAssets.kColor
            ),
            desc: ' Phone : 01289009998',
            descTextStyle: TextStyle(
                color: ColorAssets.kColor
            ),
          )..show();
setState(() {

});
          })
    ];
    return SafeArea(child: Scaffold(
      body:
          GoogleMap(
            initialCameraPosition: initialPosition,
            markers: markers.toSet(),
            mapType: MapType.normal,

          )

      ),
    );
  }
}
