import 'package:flutter/material.dart';
import '../model/login_request.dart';
import '../screens/auth/login_response.dart';
import '../services/auth_service.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();
  LoginResponse? loginResponse;

  Future<bool> login(String id, String password) async {
    final response = await _authService.login(LoginRequest(id: id, password: password));
    if (response != null) {
      loginResponse = response;
      print('로그인 성공: ${response.data.accessToken}');
      return true;
    } else {
      print('로그인 실패');
      return false;
    }
    notifyListeners();
  }
}
