import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class PickedImageProvider extends ChangeNotifier{
  File? _imageFile;
  String? uploadedImageUrl;
  String ?url;
  bool ?imageLoaded;
  Future<void> pickImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {

        _imageFile = File(pickedFile.path);
        imageLoaded=true;


      await uploadImageToFirebaseStorage();
    }
    notifyListeners();
  }
  Future<void> uploadImageToFirebaseStorage() async {
    final storage = FirebaseStorage.instance;
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageRef = storage.ref().child('images/$fileName.jpg');

    await storageRef.putFile(_imageFile!);
    final imageUrl = await storageRef.getDownloadURL();
      uploadedImageUrl = imageUrl;
      notifyListeners();
  }



}