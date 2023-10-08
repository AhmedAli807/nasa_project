import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasa_project/models/factories_data.dart';

class FactoryMapProvider extends ChangeNotifier{
  List items = [];
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/factories.json');
    final data = await json.decode(response);
      items = data["items"];
notifyListeners();
  }
}