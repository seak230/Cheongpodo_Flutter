class GrapeResponse {
  final int status;
  final String message;
  final List<Grape> data;

  GrapeResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GrapeResponse.fromJson(Map<String, dynamic> json) {
    return GrapeResponse(
      status: json['status'],
      message: json['message'],
      data:
          (json['data'] as List<dynamic>)
              .map((item) => Grape.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }
}

class Grape {
  final int gpseId;
  final String gpseNm;
  final int gpseTm;
  final bool gpseTf;

  Grape({
    required this.gpseId,
    required this.gpseNm,
    required this.gpseTm,
    required this.gpseTf,
  });

  factory Grape.fromJson(Map<String, dynamic> json) {
    return Grape(
      gpseId: json['gpseId'],
      gpseNm: json['gpseNm'],
      gpseTm: json['gpseTm'],
      gpseTf: json['gpseTf'] ?? false,
    );
  }
}
