class AuthResponse {
  final int status;
  final String message;
  final TokenData data;

  AuthResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      status: json['status'],
      message: json['message'],
      data: TokenData.fromJson(json['data']),
    );
  }
}

class TokenData {
  final String accessToken;
  final String refreshToken;

  TokenData({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
