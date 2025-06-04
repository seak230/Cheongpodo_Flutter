import 'package:cheongpodo_flutter/model/tutorial/grape_response.dart';
import 'package:cheongpodo_flutter/model/tutorial/tutorial_response.dart';
import 'package:cheongpodo_flutter/services/tutorial_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/tutorial/GpsResponse.dart';

class TutorialViewmodel extends ChangeNotifier {
  final TutorialService _service = TutorialService();

  TutorialResponse? tutorialResponse;
  GpsResponse? gpsResponse;
  GrapeResponse? grapeResponse;

  Future<void> fetchGps() async {
    tutorialResponse = await _service.getGps();
    notifyListeners();
  }

  Future<void> fetchOneGps(int gpsId) async {
    gpsResponse = await _service.getOneGps(gpsId: gpsId);
    notifyListeners();
  }

  Future<void> fetchGrape(int gpId) async {
    grapeResponse = await _service.getGrape(gpId: gpId);
    notifyListeners();
  }
}
