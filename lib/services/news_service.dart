import 'package:cheongpodo_flutter/model/news/news_response.dart';
import 'package:dio/dio.dart';

import 'auth_service.dart';

class NewsService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://cheongfordo.kr'));

  Future<NewsResponse?> getNews({required String category}) async {
    final accessToken = await getAccessToken();  // await 꼭 필요

    if (accessToken == null) {
      print('토큰이 없음');
      return null;
    }

    try {
      final response = await _dio.get(
        '/news',
        queryParameters: {
          'category' : category
        },
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return NewsResponse.fromJson(response.data);
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('뉴스 요청 실패: $e');
      return null;
    }
  }
}
