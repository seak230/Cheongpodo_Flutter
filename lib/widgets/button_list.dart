import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/colors.dart';

class ButtonList extends StatelessWidget {
  final List<String> category;


  const ButtonList({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 가로 스크롤
      child: Row(
        children: [
          const SizedBox(width: 20), // 시작 여백
          ...category.map((name) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  print('$name 버튼 클릭됨');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                child: Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }).toList(),
          const SizedBox(width: 20), // 끝 여백
        ],
      ),
    );
  }
}
