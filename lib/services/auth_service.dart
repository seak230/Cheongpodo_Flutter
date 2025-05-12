import 'package:cheongpodo_flutter/model/auth/auth_request.dart';
import 'package:cheongpodo_flutter/model/auth/auth_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://cheongfordo.kr'));

  Future<AuthResponse?> login(AuthRequest request) async {
    try {
      final response = await _dio.post('/member/login', data: request.toJson());

      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('로그인 요청 실패: $e');
      return null;
    }
  }
}

Future<void> saveToken(String accessToken, String refreshToken) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('access_token', accessToken);
  await prefs.setString('refresh_token', refreshToken);
}

Future<String?> getAccessToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token');
}

Future<void> clearTokens() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('access_token');
  await prefs.remove('refresh_token');
}