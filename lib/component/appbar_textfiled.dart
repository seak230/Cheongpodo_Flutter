import 'package:cheongpodo_flutter/view/term/term_search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppbarTextfiled extends StatelessWidget {
  final bool floating;
  const AppbarTextfiled({required this.floating, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: floating,
      title: InkWell(
        highlightColor: Colors.black12,
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          Get.to(() => const TermSearchScreen(), transition: Transition.fadeIn,);
        },
        onLongPress: () {
          Get.to(() => const TermSearchScreen());
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  '검색',
                  style: TextStyle(color: Color(0xff7d7d7d), fontSize: 18),
                ),
              ),
              Flexible(fit: FlexFit.tight, child: Container(),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xff7d7d7d),
                  size: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}

class SearchFocusBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchFocusController());
  }
}

class SearchFocusController extends GetxController {
  final TextEditingController _controller = TextEditingController();

  TextEditingController get searchController => _controller;

  //완료버튼 클릭 시 결과화면으로 이동함
  void submitted(String value) {
    //결과화면은 페이지가 전환되야함.
    Get.off(() => const TermSearchScreen());
  }
}