class GpseResponse {
  final int status;
  final String message;
  final Gpse data;


  GpseResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory GpseResponse.fromJson(Map<String, dynamic> json) {
    return GpseResponse(
      status: json['status'],
      message: json['message'],
      data: Gpse.fromJson(json['data']),
    );
  }
}

class Gpse {
  final String gpseName;
  final String gpseContent;
  final int gpseTime;
  final bool gpseTF;
  final bool gpseLike;
  final int gpseExp;
  final int gpseQtId;
  final String gpseUrl;
  final String? gpseVerification;

  Gpse({
    required this.gpseName,
    required this.gpseContent,
    required this.gpseTime,
    required this.gpseTF,
    required this.gpseLike,
    required this.gpseExp,
    required this.gpseQtId,
    required this.gpseUrl,
    required this.gpseVerification,
  });

  factory Gpse.fromJson(Map<String, dynamic> json) {
    return Gpse(
      gpseName: json['gpseName'],
      gpseContent: json['gpseContent'],
      gpseTime: json['gpseTime'],
      gpseTF: json['gpseTF'],
      gpseLike: json['gpseLike'],
      gpseExp: json['gpseExp'],
      gpseQtId: json['gpseQtId'],
      gpseUrl: json['gpseUrl'],
      gpseVerification: json['gpseVerification'],
    );
  }
}
