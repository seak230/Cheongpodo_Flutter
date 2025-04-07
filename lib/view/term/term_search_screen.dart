import 'package:cheongpodo_flutter/view/term/term_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermSearchScreen extends StatelessWidget {
  const TermSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none, // 투명한 라인
                        ),
                        hintText: '검색',
                        hintStyle: TextStyle(
                          color: Color(0xff7d7d7d),
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Color(0xff7d7d7d),
                        size: 20.0,
                      ),
                      onPressed: () {
                        final term = controller.text.trim(); // (3) 텍스트 가져오기
                        if (term.isNotEmpty) {
                          Get.to(() => TermScreen(term: term)); // (4) 화면 이동
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 20,
              (context, index) => ListTile(title: Text('Item $index')),
            ),
          ),
        ],
      ),
    );
  }
}
