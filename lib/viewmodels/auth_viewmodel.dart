import 'package:cheongpodo_flutter/model/auth/auth_request.dart';
import 'package:cheongpodo_flutter/model/auth/auth_response.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  AuthResponse? loginResponse;

  Future<bool> login(String id, String password) async {
    final response = await _authService.login(AuthRequest(id: id, password: password));
    if (response != null) {
      loginResponse = response;
      print('로그인 성공: ${response.data.accessToken}');
      saveToken(response.data.accessToken, response.data.refreshToken);
      return true;
    } else {
      print('로그인 실패');
      return false;
    }
    notifyListeners();
  }
}
