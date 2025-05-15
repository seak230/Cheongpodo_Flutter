import 'package:cheongpodo_flutter/model/term/each_term_response.dart';
import 'package:cheongpodo_flutter/model/term/term_response.dart';
import 'package:cheongpodo_flutter/services/term_service.dart';
import 'package:flutter/cupertino.dart';

class TermViewModel extends ChangeNotifier {
  final TermService _termService = TermService();
  TermResponse? _termResponse;
  EachTermResponse? _eachTermResponse;

  TermResponse? get termResponse => _termResponse;
  EachTermResponse? get eachTermResponse => _eachTermResponse;

  Future<void> getTerms({final int page = 0, final int size = 20}) async {
    try {
      _termResponse = await _termService.getTerm(page: page, size: size);
      notifyListeners();
    } catch (e) {
      print('단어 데이터 로딩 실패: $e');
    }
  }

  Future<void> getTermsKeyword({required String keyword}) async {
    try {
      if (keyword.isEmpty) {
        _termResponse = TermResponse(status: 0, message: '', data: []);  // 빈 키워드는 빈 리스트 반환
        notifyListeners();
        return;
      }

      final result = await _termService.getTermsKeyword(keyword: keyword);
      _termResponse = result ?? TermResponse(status: 0, message: '', data: []);  // null 응답 처리
      notifyListeners();
    } catch (e) {
      print('키워드 단어 데이터 로딩 실패: $e');
      _termResponse = TermResponse(status: 0, message: '', data: []);  // 실패 시에도 상태 초기화
      notifyListeners();
    }
  }

  Future<void> getEachTerm({required int termId}) async {
    try {
      final result = await _termService.getEachTerm(termId: termId);
      _eachTermResponse = result ?? EachTermResponse(status: 0, message: '', data: Term(termId: 0, termNm: '', termExplain: '', termDifficulty: ''));  // null 응답 처리
      notifyListeners();
    } catch (e) {
      print('한 개의 단어 데이터 로딩 실패: $e');
      _eachTermResponse = EachTermResponse(status: 0, message: '', data: Term(termId: 0, termNm: '', termExplain: '', termDifficulty: ''));
      notifyListeners();
    }
  }
}