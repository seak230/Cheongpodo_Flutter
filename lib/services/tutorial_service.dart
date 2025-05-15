import 'package:cheongpodo_flutter/model/tutorial/tutorial_response.dart';
import 'package:dio/dio.dart';

import 'auth_service.dart';

class TutorialService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://cheongfordo.kr'));

  Future<TutorialResponse?> getGps() async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      print('토큰이 없음');
      return null;
    }

    try {
      final response = await _dio.get(
        '/gps/category',
        queryParameters: {
          'age' : '',
          'work' : '',
        },
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return TutorialResponse.fromJson(response.data);
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('포도송이 요청 실패: $e');
      return null;
    }
  }
}