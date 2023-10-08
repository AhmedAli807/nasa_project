import 'package:nasa_project/models/info_factory.dart';

class  FactoriesData {
final double lat;
final double lon;
final InfoFactory info;

FactoriesData({
required this.lat,
required this.lon,
required this.info,
});

factory FactoriesData.fromJson(Map<String, dynamic> json) {
return FactoriesData(
lat: json['lat'],
lon: json['lon'],
info: InfoFactory.fromJson(json['info']),
);
}
}
