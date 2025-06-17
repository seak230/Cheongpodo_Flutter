import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/viewmodels/term_viewmodel.dart';
import 'package:cheongpodo_flutter/widgets/appbar_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../term/term_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TermViewModel termViewModel;

  @override
  void initState() {
    super.initState();
    termViewModel = Provider.of<TermViewModel>(context, listen: false);
    termViewModel.loadDailyTerms();
  }

  @override
  Widget build(BuildContext context) {
    termViewModel = Provider.of<TermViewModel>(context);

    return CustomScrollView(
      slivers: [
        AppbarTextfiled(textField: false),
        SliverList(
          delegate: SliverChildListDelegate([
            Stack(
              clipBehavior: Clip.none,
              children: [
                // 배경 Container
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 8.0,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                ),

                // 가운데 정렬된 버튼
                Positioned(
                  bottom: -25, // Container 밖으로 20만큼 아래로
                  left: 0,
                  right: 0, // left, right 둘 다 주면 가운데 정렬됨
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
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
              ],
            ),
            SizedBox(height: 55),

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
                              fontWeight: FontWeight.w500,
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
                                    // Get.to(() => TermScreen(term: '제목 ${index + 1}'), preventDuplicates: false, transition: Transition.fadeIn);
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
