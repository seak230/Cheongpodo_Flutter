import 'package:cheongpodo_flutter/model/tutorial/grape_response.dart';
import 'package:cheongpodo_flutter/model/tutorial/tutorial_response.dart';
import 'package:cheongpodo_flutter/services/tutorial_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/tutorial/GpsResponse.dart';

class TutorialViewmodel extends ChangeNotifier {
  final TutorialService _service = TutorialService();

  TutorialResponse? tutorialResponse;
  GpsResponse? gpsResponse;

  // ✅ 각 gpId별로 grapeList를 저장하는 맵
  final Map<int, List<Grape>> _grapeMap = {};

  List<Grape>? getGrapes(int gpId) => _grapeMap[gpId];

  Future<void> fetchGps() async {
    tutorialResponse = await _service.getGps();
    notifyListeners();
  }

  Future<void> fetchOneGps(int gpsId) async {
    gpsResponse = await _service.getOneGps(gpsId: gpsId);
    notifyListeners();
  }

  Future<void> fetchGrape(int gpId) async {
    if (_grapeMap.containsKey(gpId)) return; // 이미 불러왔으면 다시 안함

    final response = await _service.getGrape(gpId: gpId);
    if (response?.data != null) {
      _grapeMap[gpId] = response!.data!;
      notifyListeners();
    }
  }
}
