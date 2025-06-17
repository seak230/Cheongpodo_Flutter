import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/viewmodels/term_viewmodel.dart';
import 'package:cheongpodo_flutter/widgets/appbar_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../term/term_screen.dart';
import '../tutorial/grapes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TermViewModel termViewModel;

  int? _lastGpsId;
  String? _lastGpsName;
  int? _lastGpsTime;


  @override
  void initState() {
    super.initState();
    termViewModel = Provider.of<TermViewModel>(context, listen: false);
    termViewModel.loadDailyTerms();
    _loadLastTutorial(); // 추가
  }

  void _loadLastTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lastGpsId = prefs.getInt('last_gps_id');
      _lastGpsName = prefs.getString('last_gps_name');
      _lastGpsTime = prefs.getInt('last_gps_time');
    });
  }


  @override
  Widget build(BuildContext context) {
    termViewModel = Provider.of<TermViewModel>(context);

    return CustomScrollView(
      slivers: [
        AppbarTextfiled(textField: false),
        SliverList(
          delegate: SliverChildListDelegate([
            if (_lastGpsId != null && _lastGpsName != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.history, color: PRIMARY_COLOR),
                        SizedBox(width: 8),
                        Text(
                          '최근 본 튜토리얼',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        // Get.to(() => GrapesScreen(
                        //   gpsId: _lastGpsId!,
                        //   gpsName: _lastGpsName!,
                        // ));
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _lastGpsName ?? '',
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.timer, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text(
                                    '$_lastGpsTime분 소요',
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0,),

                    // 가운데 정렬된 버튼
                    Positioned(
                      bottom: -25, // Container 밖으로 20만큼 아래로
                      left: 0,
                      right: 0, // left, right 둘 다 주면 가운데 정렬됨
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            final prefs = await SharedPreferences.getInstance();
                            final gpsId = prefs.getInt('last_gps_id');
                            final gpsName = prefs.getString('last_gps_name');

                            if (gpsId != null && gpsName != null) {
                              Get.to(() => GrapesScreen(gpsId: gpsId, gpsName: gpsName));
                            } else {
                              Get.snackbar(
                                '알림',
                                '최근에 본 튜토리얼이 없습니다.',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },

                          style: ElevatedButton.styleFrom(
                            backgroundColor: PRIMARY_COLOR,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60.0,
                              vertical: 10,
                            ),
                            child: Text(
                              '튜토리얼 보기',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0,),
                  ],
                ),
              ),
            ],

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    // 제목
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.square_rounded, color: PRIMARY_COLOR),
                          SizedBox(width: 5),
                          Text(
                            '오늘의 경제 단어',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // 단어 목록
                    AnimatedBuilder(
                      animation: termViewModel,
                      builder: (context, _) {
                        final terms = termViewModel.todayTerms;
                        if (terms.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: terms.length,
                          itemBuilder: (context, index) {
                            final term = terms[index];
                            return ListTile(
                              title: Material(
                                color: Colors.transparent, // 배경색 유지하고 싶다면 투명하게
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => TermScreen(term: term.termNm, termId: term.termId,), preventDuplicates: false, transition: Transition.fadeIn);
                                  },
                                  borderRadius: BorderRadius.circular(12), // 클릭 효과 모양도 둥글게
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      term.termNm,
                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
