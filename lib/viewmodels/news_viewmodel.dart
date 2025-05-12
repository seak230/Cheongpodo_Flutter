import 'package:cheongpodo_flutter/model/news/news_response.dart';
import 'package:cheongpodo_flutter/services/news_service.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsService _newsService = NewsService();
  NewsResponse? _newsResponse;

  NewsResponse? get newsResponse => _newsResponse;
  bool get hasNews => _newsResponse != null && _newsResponse!.data.isNotEmpty;

  Future<void> getNews({required String category}) async {
    try {
      _newsResponse = await _newsService.getNews(category: category);
      notifyListeners();  // UI에 상태 변화를 알림
    } catch (e) {
      print('뉴스 데이터 로딩 실패: $e');
    }
  }
}