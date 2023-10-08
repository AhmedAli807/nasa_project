import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_project/models/fire_data.dart';

import '../../config/assets_data.dart';

class MarkerIconProvider extends ChangeNotifier{
  BitmapDescriptor markerIcon=BitmapDescriptor.defaultMarker;
  void addCustomIcon(){
    List<FireData>?fire;
    for(int i=0;i<fire!.length;i++){
      if(fire[i].frp<=0.5){
        BitmapDescriptor.fromAssetImage(ImageConfiguration(),AssetsData.low ).then((icon)=>
          markerIcon=icon);
      }
      else if(fire[i].frp>0.5&&fire[i].frp<=1){
        BitmapDescriptor.fromAssetImage(ImageConfiguration(),AssetsData.medium ).then((icon) => markerIcon=icon);
      }
      else{
        BitmapDescriptor.fromAssetImage(ImageConfiguration(),AssetsData.high ).then((icon) => markerIcon=icon);

      }
    }
notifyListeners();
  }
}
