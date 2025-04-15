import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/widgets/appbar_textfiled.dart';
import 'package:cheongpodo_flutter/widgets/news_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../term/term_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> dummyWidgets = List.generate(
      10,
      (index) => ListTile(
        title: Material(
          color: Colors.transparent, // 배경색 유지하고 싶다면 투명하게
          child: InkWell(
            onTap: () {
              Get.to(() => TermScreen(term: '제목 ${index + 1}'), preventDuplicates: false, transition: Transition.fadeIn);
            },
            borderRadius: BorderRadius.circular(12), // 클릭 효과 모양도 둥글게
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '제목 ${index + 1}',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        // trailing: Icon(Icons.arrow_forward_ios),
      ),
    );

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
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 10),
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
            SizedBox(height: 35),
            NewsCard(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                // height: 180,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.square_rounded, color: PRIMARY_COLOR,),
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
                    Column(children: dummyWidgets),
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
