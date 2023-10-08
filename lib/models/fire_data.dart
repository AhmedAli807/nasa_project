class FireData {
  final int ?fireCount; // Made nullable
  final double? acqTime;
  final double latitude;
  final double longitude;
  final int brightTi4;
  final double scan;
  final double track;
  final String acqDate;
  final int satellite;
  final String instrument;
  final String confidence;
  final String version;
  final double brightTi5;
  final double frp;
  final String daynight;

  FireData({
     this.fireCount,
    this.acqTime,
    required this.latitude,
    required this.longitude,
    required this.brightTi4,
    required this.scan,
    required this.track,
    required this.acqDate,
    required this.satellite,
    required this.instrument,
    required this.confidence,
    required this.version,
    required this.brightTi5,
    required this.frp,
    required this.daynight,
  });

  factory FireData.fromJson(List<dynamic> json) {
    return FireData(
      fireCount: json[0] != null ? int.tryParse(json[0].toString()) : null,
      acqTime: json[1] != null ? double.tryParse(json[1].toString()) : null,
      latitude: json[2] != null ? double.tryParse(json[2].toString()) ?? 0.0 : 0.0,
      longitude: json[3] != null ? double.tryParse(json[3].toString()) ?? 0.0 : 0.0,
      brightTi4: json[4] != null ? int.tryParse(json[4].toString()) ?? 0 : 0,
      scan: json[5] != null ? double.tryParse(json[5].toString()) ?? 0.0 : 0.0,
      track: json[6] != null ? double.tryParse(json[6].toString()) ?? 0.0 : 0.0,
      acqDate: json[7]?.toString() ?? '',
      satellite: json[8] != null ? int.tryParse(json[8].toString()) ?? 0 : 0,
      instrument: json[9]?.toString() ?? '',
      confidence: json[10]?.toString() ?? '',
      version: json[11]?.toString() ?? '',
      brightTi5: json[12] != null ? double.tryParse(json[12].toString()) ?? 0.0 : 0.0,
      frp: json[13] != null ? double.tryParse(json[13].toString()) ?? 0.0 : 0.0,
      daynight: json[14]?.toString() ?? '',
    );
  }
}