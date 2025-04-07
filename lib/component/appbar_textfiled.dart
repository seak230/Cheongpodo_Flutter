import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarTextfiled extends StatelessWidget {
  const AppbarTextfiled({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      title: InkWell(
        highlightColor: Colors.black12,
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          // Get.to(() => const SearchFocusScreen());
        },
        onLongPress: () {
          // Get.to(() => const SearchFocusScreen());
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
