import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/term/term_screen.dart';
import '../screens/term/term_search_screen.dart';

class AppbarTextfiled extends StatelessWidget {
  final bool textField;

  const AppbarTextfiled({required this.textField, super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return SliverAppBar(
      automaticallyImplyLeading: !textField,
      pinned: textField,
      floating: true,
      title: InkWell(
        highlightColor: Colors.black12,
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          if (!textField) {
            Get.to(
              () => const TermSearchScreen(),
              transition: Transition.fadeIn,
            );
          }
        },
        onLongPress: () {
          if (!textField) {
            Get.to(
              () => const TermSearchScreen(),
              transition: Transition.fadeIn,
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              if (!textField) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '검색',
                    style: TextStyle(color: Color(0xff7d7d7d), fontSize: 18),
                  ),
                ),
                Flexible(fit: FlexFit.tight, child: Container()),
              ] else ...[
                Flexible(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
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
              ],
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: textField ? () {
                    final term = controller.text.trim();
                    if (term.isNotEmpty) {
                      Get.to(() => TermScreen(term: term));
                    }
                  } : null,
                  borderRadius: BorderRadius.circular(20), // 터치 영역 모양 설정 가능
                  child: Icon(
                    Icons.search,
                    color: Color(0xff7d7d7d),
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}