import 'package:flutter/material.dart';

import '../const/colors.dart';

class ButtonList extends StatelessWidget {
  final List<String> category;
  final Function(String category) onCategorySelected;

  const ButtonList({
    super.key,
    required this.category,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 20),
          ...category.map((name) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  switch (name) {
                    case '증권':
                      onCategorySelected('securities');
                      break;
                    case '금융':
                      onCategorySelected('finance');
                      break;
                    case '경제 일반':
                      onCategorySelected('economy');
                      break;
                    case '부동산':
                      onCategorySelected('realEstate');
                      break;
                    case '산업/재계':
                      onCategorySelected('industrialBusiness');
                      break;
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: PRIMARY_COLOR,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
