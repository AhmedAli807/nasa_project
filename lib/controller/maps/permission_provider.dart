import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class PermissionProvider extends ChangeNotifier {
   Future<Position> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
    return Future.error('Location services are disabled. Please enable the services')  ;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error('Location permission is denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are denied , we can't request permissions")  ;

    }
    Position position=await Geolocator.getCurrentPosition();
    notifyListeners();
    return position;

  }
}