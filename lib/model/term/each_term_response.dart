import 'package:cheongpodo_flutter/model/term/term_response.dart';

class EachTermResponse {
  final int status;
  final String message;
  final Term data;

  EachTermResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory EachTermResponse.fromJson(Map<String, dynamic> json) {
    return EachTermResponse(
      status: json['status'],
      message: json['message'],
      data: Term.fromJson(json['data']),
    );
  }
}
