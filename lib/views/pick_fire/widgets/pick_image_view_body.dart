
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nasa_project/config/screen_size.dart';
import 'package:nasa_project/utils/color_assets.dart';
import 'package:provider/provider.dart';
import '../../../controller/image_picker/image_picker_provider.dart';
import '../../../controller/maps/permission_provider.dart';
class PickImageViewBody extends StatefulWidget {
   const PickImageViewBody({Key? key}) : super(key: key);

  @override
  State<PickImageViewBody> createState() => _PickImageViewBodyState();
}

class _PickImageViewBodyState extends State<PickImageViewBody> {
  String dropdownValue = 'Agricultural waste';
  late GoogleMapController googleMapController;

  CameraPosition initialPosition =
  const CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 14);

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    final currentPosition=Provider.of<PermissionProvider>(context, listen: false)
        .handleLocationPermission();

    CollectionReference fireData =
    FirebaseFirestore.instance.collection("fire data");
    Future<void> addFireData() async{
      Position position =  await currentPosition;

      return  fireData.add({
        "location": {"latitude":position.latitude,"longitude":position.longitude},
        "type":dropdownValue
      }).then((value) => print("fire added")).catchError((error)=>print(error));
    }

    final pickedImageProvider=Provider.of<PickedImageProvider>(context,listen: false);
    return SafeArea(
        child: Scaffold(

      appBar: AppBar(
        backgroundColor: ColorAssets.backgroundColor,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: ()async{
pickedImageProvider.uploadImageToFirebaseStorage();
addFireData();
setState(() {

                  });
              },
              icon: Icon(
                Icons.check,
                color: ColorAssets.kColor,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Consumer<PickedImageProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                pickedImageProvider.imageLoaded==true?
                         Center(
                            child: Column(
                              children: [

                                if (pickedImageProvider.uploadedImageUrl != null)
                                  Image.network(
                                    pickedImageProvider.uploadedImageUrl!,
                                    width: ScreenSize.width(context)*0.7,
                                    height: ScreenSize.height(context)*0.6,
                                  ),
                                SizedBox(
                                  height: ScreenSize.height(context)*0.02,
                                ),
                                DropdownButton<String>(
                                  // Step 3.
                                  value: dropdownValue,
                                  // Step 4.
                                  items: <String>['Agricultural waste', 'Buildings', 'Forests']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(fontSize: 18,
                                        color: ColorAssets.kColor),
                                      ),
                                    );
                                  }).toList(),
                                  // Step 5.
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  height: ScreenSize.height(context)*0.4,
                                  width: ScreenSize.width(context)*0.7,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey
                                  ),
                                  child: const Icon(Icons.photo,
                                    size: 50,),
                                ),
                              ),
                              SizedBox(
                                height: ScreenSize.height(context)*0.02,
                              ),
                              Container(
                                height: ScreenSize.height(context)*0.06,
                                width: ScreenSize.width(context)*0.6,
                                decoration: BoxDecoration(
                                  color: ColorAssets.secondaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(  onPressed: ()  {

                                  Provider.of<PickedImageProvider>(context,listen:false).pickImageFromCamera();
                                },
                                  child:  Text('Pick the fire',
                                    style: TextStyle(
                                        color: ColorAssets.backgroundColor
                                    ),),),
                              ),

                            ],
                          ),
                        ),

                    SizedBox(
                      height: ScreenSize.height(context)*0.02,
                    ),
                    SizedBox(
                      height: ScreenSize.height(context)*0.5,
                      width: ScreenSize.width(context)*0.9,
                      child: GoogleMap(
                        initialCameraPosition: initialPosition,
                        markers: markers,
                        zoomControlsEnabled: false,
                        mapType: MapType.satellite,
                        onMapCreated: (GoogleMapController controller) {
                          googleMapController = controller;
                        },
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.height(context)*0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: ScreenSize.height(context)*0.06,
                        width: ScreenSize.width(context)*0.6,
                        decoration: BoxDecoration(
                          color: ColorAssets.kColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: MaterialButton(  onPressed: () async {
                          Position position = await currentPosition;
                          googleMapController.animateCamera(CameraUpdate.newCameraPosition(
                              CameraPosition(
                                  target: LatLng(position.latitude, position.longitude))));
                          markers.clear();
                          markers.add(Marker(markerId: const MarkerId('Current location'),
                              position: LatLng(position.latitude, position.longitude)),);
                          setState(() {

                          });
                        },
                          child:  Text('Current location',
                            style: TextStyle(
                                color: ColorAssets.backgroundColor
                            ),),),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.height(context)*0.02,
                    ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
