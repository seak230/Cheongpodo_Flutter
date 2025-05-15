import 'package:cheongpodo_flutter/model/tutorial/tutorial_response.dart';
import 'package:cheongpodo_flutter/services/tutorial_service.dart';
import 'package:flutter/cupertino.dart';

class TutorialViewmodel extends ChangeNotifier {
  final TutorialService _termService = TutorialService();
  TutorialResponse? _tutorialResponse;

  TutorialResponse? get tutorialResponse => _tutorialResponse;

  Future<void> getTerms() async {
    try {
      _tutorialResponse = await _termService.getGps();
      notifyListeners();
    } catch (e) {
      print('포도송이 데이터 로딩 실패: $e');
    }
  }
}