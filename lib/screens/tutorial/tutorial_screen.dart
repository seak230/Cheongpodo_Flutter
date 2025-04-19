import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/widgets/button_list.dart';
import 'package:cheongpodo_flutter/widgets/tutorial_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> ageCategory = ["10대", "20대", "30대", "40대", "50대"];
    List<String> category = ["사회구성원", "공무원", "직원", "실업가"];

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.square_rounded,
                      color: PRIMARY_COLOR,
                      size: 30.0,
                    ),
                    Text(
                      '튜토리얼',
                      style: TextStyle(
                        color: PRIMARY_COLOR,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                Text('자신에게 맞는 포도송이를 획득할 수 있어요.'),
              ],
            ),
          ),
          ButtonList(category: ageCategory),
          ButtonList(category: category),

          RouteCard(),
          RouteCard()
        ],
      ),
    );
  }
}
