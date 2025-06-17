import 'dart:convert';
import 'dart:math';

import 'package:cheongpodo_flutter/model/term/each_term_response.dart';
import 'package:cheongpodo_flutter/model/term/term_response.dart';
import 'package:cheongpodo_flutter/services/term_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermViewModel extends ChangeNotifier {
  final TermService _termService = TermService();
  TermResponse? _termResponse;
  EachTermResponse? _eachTermResponse;

  TermResponse? get termResponse => _termResponse;
  EachTermResponse? get eachTermResponse => _eachTermResponse;
  List<Term> todayTerms = [];

  String summary = '';

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

  Future<void> fetchSummary(String termNm) async {
    final result = await _termService.explainTerm(termNm: termNm);
    if (result != null) {
      summary = result;
      notifyListeners();
    }
  }

  Future<void> loadDailyTerms() async {
    final prefs = await SharedPreferences.getInstance();
    final todayKey = DateFormat('yyyy-MM-dd').format(DateTime.now());

    // 저장된 날짜 확인
    final savedDate = prefs.getString('daily_terms_date');
    if (savedDate == todayKey && prefs.containsKey('daily_terms')) {
      // 오늘 날짜에 이미 저장된 단어가 있다면 불러오기
      final savedTermsJson = prefs.getStringList('daily_terms') ?? [];
      todayTerms = savedTermsJson.map((e) => Term.fromJson(Map<String, dynamic>.from(jsonDecode(e)))).toList();
      notifyListeners();
      return;
    }

    try {
      // 전체 단어 목록 불러오기
      final result = await _termService.getTerm(page: 0, size: 1000);
      if (result != null) {
        final allTerms = result.data;
        allTerms.shuffle(Random());

        todayTerms = allTerms.take(10).toList();

        // 저장
        await prefs.setString('daily_terms_date', todayKey);
        await prefs.setStringList(
          'daily_terms',
          todayTerms.map((e) => jsonEncode({
            'termId': e.termId,
            'termNm': e.termNm,
            'termExplain': e.termExplain,
            'termDifficulty': e.termDifficulty,
          })).toList(),
        );

        notifyListeners();
      }
    } catch (e) {
      print('오늘의 단어 로딩 실패: $e');
    }
  }
}