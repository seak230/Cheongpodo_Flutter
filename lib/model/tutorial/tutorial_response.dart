class TutorialResponse {
  final int status;
  final String message;
  final List<Gps> data;

  TutorialResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TutorialResponse.fromJson(Map<String, dynamic> json) {
    return TutorialResponse(
      status: json['status'],
      message: json['message'],
      data:
      (json['data'] as List<dynamic>)
          .map((item) => Gps.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Gps {
  final int gpsId;
  final String gpsName;
  final String gpsContent;
  final int gpsTime;
  final bool gpsLike;
  final String gpsAgeGroup;
  final String gpsWork;

  Gps({
    required this.gpsId,
    required this.gpsName,
    required this.gpsContent,
    required this.gpsTime,
    required this.gpsLike,
    required this.gpsAgeGroup,
    required this.gpsWork,
  });

  factory Gps.fromJson(Map<String, dynamic> json) {
    return Gps(
        gpsId: json['gpsId'],
        gpsName: json['gpsName'],
        gpsContent: json['gpsContent'],
        gpsTime: json['gpsTime'],
        gpsLike: json['gpsLike'],
        gpsAgeGroup: json['gpsAgeGroup'],
        gpsWork: json['gpsWork']
    );
  }
}
