import 'package:flutter/material.dart';
import 'package:nasa_project/controller/maps/factory_map_provider.dart';
import 'package:nasa_project/controller/maps/get_maps_detect_provider.dart';
import 'package:nasa_project/views/home/widgets/home_view_body.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  Future<List<Map<String, dynamic>>> fetchCSVData() async {
    final csvUrl =
        'https://firms.modaps.eosdis.nasa.gov/api/area/csv/7647fc3fc947d0bcd255c371869a22dd/VIIRS_NOAA20_NRT/world/1';

    final response = await http.get(Uri.parse(csvUrl));
    if (response.statusCode == 200) {
      final csvData = response.body;
      final lines = csvData.split('\n');
      final headers = lines[0].split(',');

      List<Map<String, dynamic>> jsonData = [];

      for (var i = 1; i < lines.length; i++) {
        final values = lines[i].split(',');

        if (values.length == headers.length) {
          final entry = Map<String, dynamic>();
          for (var j = 0; j < headers.length; j++) {
            entry[headers[j]] = values[j];
          }
          jsonData.add(entry);
        }
      }

      return jsonData;
    } else {
      throw Exception('Failed to fetch CSV data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }}
