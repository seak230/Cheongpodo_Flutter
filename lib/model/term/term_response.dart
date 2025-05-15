class TermResponse {
  final int status;
  final String message;
  final List<Term> data;

  TermResponse({
    required this.status,
    required this.message,
    required this.data
  });

  factory TermResponse.fromJson(Map<String, dynamic> json) {
    return TermResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((item) => Term.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Term {
  final int termId;
  final String termNm;
  final String termExplain;
  final String termDifficulty;
  // final bool termLike;

  Term({
    required this.termId,
    required this.termNm,
    required this.termExplain,
    required this.termDifficulty
  });

  factory Term.fromJson(Map<String, dynamic> json) {
    return Term(
      termId: json['termId'],
      termNm: json['termNm'],
      termExplain: json['termExplain'],
      termDifficulty: json['termDifficulty'],
    );
  }
} 