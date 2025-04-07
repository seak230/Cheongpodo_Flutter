import 'package:cheongpodo_flutter/view/term/term_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermSearchScreen extends StatelessWidget {
  const TermSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true, // (1) 키보드에 따라 화면 조정
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
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
                              borderSide: BorderSide.none,
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
                            final term = controller.text.trim();
                            if (term.isNotEmpty) {
                              Get.to(() => TermScreen(term: term));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 키보드가 올라올 때 아래 패딩을 자동 반영
              SliverPadding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 20,
                        (context, index) => ListTile(title: Text('Item $index')),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
