import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/widgets/button_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> category = ["증권", "금융", "경제 일반", "부동산", "산업/재계"];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                NewsCard(),
                SizedBox(height: 20),
                ButtonList(category: category),
                Column(
                  children: List.generate(
                    10,
                    (index) => ListTile(
                      title: Material(
                        color: Colors.transparent, // 배경색 유지하고 싶다면 투명하게
                        child: InkWell(
                          onTap: () {
                            // Get.to(() => TermScreen(term: '제목 ${index + 1}'), preventDuplicates: false, transition: Transition.fadeIn);
                          },
                          borderRadius: BorderRadius.circular(12),
                          // 클릭 효과 모양도 둥글게
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  // 이미지 들어갈 부분
                                  height: 100,
                                  width: 150,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 20.0),
                                Text(
                                  // 글 들어갈 부분
                                  '제목 ${index + 1}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}