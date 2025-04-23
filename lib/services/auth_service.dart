import 'package:dio/dio.dart';

import '../model/login_request.dart';
import '../screens/auth/login_response.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://cheongfordo.kr'));

  Future<LoginResponse?> login(LoginRequest request) async {
    try {
      final response = await _dio.post('/member/login', data: request.toJson());

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
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
