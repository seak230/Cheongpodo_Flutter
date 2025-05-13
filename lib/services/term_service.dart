import 'package:cheongpodo_flutter/model/term/each_term_response.dart';
import 'package:cheongpodo_flutter/model/term/term_response.dart';
import 'package:cheongpodo_flutter/services/auth_service.dart';
import 'package:dio/dio.dart';

class TermService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://cheongfordo.kr'));

  Future<TermResponse?> getTerm({final int page = 0, final int size = 20}) async {
    final accessToken = await getAccessToken();

    if (accessToken == null) {
      print('토큰이 없음');
      return null;
    }

    try {
      final response = await _dio.get(
        '/terms',
        queryParameters: {
          'page' : page,
          'size' : size
        },
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return TermResponse.fromJson(response.data);
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('단어 요청 실패: $e');
      return null;
    }
  }

  Future<TermResponse?> getTermsKeyword({required String keyword}) async {
    final accessToken = await getAccessToken();
    if (accessToken == null) {
      print('토큰이 없음');
      return TermResponse(status: 0, message: '', data: []); // 빈 리스트로 반환
    }

    try {
      final response = await _dio.get(
        '/terms/keyword',
        queryParameters: {
          'keyword' : keyword
        },
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return TermResponse.fromJson(response.data);
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return TermResponse(status: 0, message: '', data: []); // 서버 오류도 빈 리스트로 처리
      }
    } catch (e) {
      print('키워드 단어 요청 실패: $e');
      return TermResponse(status: 0, message: '', data: []); // 예외 발생 시도 마찬가지
    }
  }

  Future<EachTermResponse?> getEachTerm({required int termId}) async {
    final accessToken = await getAccessToken();
    if (accessToken == null) {
      print('토큰이 없음');
      return EachTermResponse(status: 0, message: '', data: Term(termId: 0, termNm: '', termExplain: '', termDifficulty: ''));
    }

    try {
      final response = await _dio.get(
        '/terms/$termId',
        options: Options(
          headers: {
            'Authorization': accessToken
          },
        ),
      );

      if (response.statusCode == 200) {
        return EachTermResponse.fromJson(response.data);
      } else {
        print('서버 응답 오류: ${response.statusCode}');
        return EachTermResponse(status: 0, message: '', data: Term(termId: 0, termNm: '', termExplain: '', termDifficulty: ''));
      }
    } catch (e) {
      print('한 개의 단어 요청 실패: $e');
      return EachTermResponse(status: 0, message: '', data: Term(termId: 0, termNm: '', termExplain: '', termDifficulty: ''));
    }
  }
}