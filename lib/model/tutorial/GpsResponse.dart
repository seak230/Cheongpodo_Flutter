class GpsResponse {
  final int status;
  final String message;
  final Gps data;

  GpsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GpsResponse.fromJson(Map<String, dynamic> json) {
    return GpsResponse(
      status: json['status'],
      message: json['message'],
      data: Gps.fromJson(json['data']),
    );
  }
}

class Gps {
  final String gpsName;
  final String gpsContent;
  final int gpsTime;
  final bool gpsLike;
  final String gpsImg;
  final int gpCnt;
  final int gpCntMax;
  final String gpsAgeGroup;
  final String gpsWork;
  final List<Gp> gpList;

  Gps({
    required this.gpsName,
    required this.gpsContent,
    required this.gpsTime,
    required this.gpsLike,
    required this.gpsImg,
    required this.gpCnt,
    required this.gpCntMax,
    required this.gpsAgeGroup,
    required this.gpsWork,
    required this.gpList,
  });

  factory Gps.fromJson(Map<String, dynamic> json) {
    return Gps(
      gpsName: json['gpsName'],
      gpsContent: json['gpsContent'],
      gpsTime: json['gpsTime'],
      gpsLike: json['gpsLike'],
      gpsImg: json['gpsImg'],
      gpCnt: json['gpCnt'],
      gpCntMax: json['gpCntMax'],
      gpsAgeGroup: json['gpsAgeGroup'],
      gpsWork: json['gpsWork'],
      gpList:
          (json['gpList'] as List<dynamic>)
              .map((item) => Gp.fromJson(item as Map<String, dynamic>))
              .toList(),
    );
  }
}

class Gp {
  final String gpImg;
  final int gpId;
  final String gpNm;
  final int gpExp;
  final int gpTm;
  final bool gpLike;
  final int gpseCnt;
  final int gpseCntMax;

  Gp({
    required this.gpImg,
    required this.gpId,
    required this.gpNm,
    required this.gpExp,
    required this.gpTm,
    required this.gpLike,
    required this.gpseCnt,
    required this.gpseCntMax,
  });

  factory Gp.fromJson(Map<String, dynamic> json) {
    return Gp(
      gpImg: json['gpImg'],
      gpId: json['gpId'],
      gpNm: json['gpNm'],
      gpExp: json['gpExp'],
      gpTm: json['gpTm'],
      gpLike: json['gpLike'],
      gpseCnt: json['gpseCnt'],
      gpseCntMax: json['gpseCntMax'],
    );
  }
}
