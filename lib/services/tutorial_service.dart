import 'package:cheongpodo_flutter/model/tutorial/grape_response.dart';
import 'package:cheongpodo_flutter/model/tutorial/tutorial_response.dart';
import 'package:dio/dio.dart';

import '../model/tutorial/GpsResponse.dart';
import '../model/tutorial/gpse_response.dart';
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

  Future<GpsResponse?> getOneGps({required int gpsId}) async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      print('토큰이 없음');
      return null;
    }

    try {
      final response = await _dio.get(
        '/gps/$gpsId',
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return GpsResponse.fromJson(response.data);
      } else {
        print('포도송이 일일 서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('포도송이 일일 요청 실패: $e');
      return null;
    }
  }

  Future<GrapeResponse?> getGrape({required int gpId}) async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      print('토큰이 없음');
      return null;
    }

    try {
      final response = await _dio.get(
        '/gp/${gpId}',
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return GrapeResponse.fromJson(response.data);
      } else {
        print('포도알 서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('포도알 요청 실패: $e');
      return null;
    }
  }

  Future<GpseResponse?> getOneGpse({required int gpseId}) async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      print('토큰이 없음');
      return null;
    }

    try {
      final response = await _dio.get(
        '/gpse/$gpseId',
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return GpseResponse.fromJson(response.data);
      } else {
        print('포도씨 일일 서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('포도씨 일일 요청 실패: $e');
      return null;
    }
  }
}