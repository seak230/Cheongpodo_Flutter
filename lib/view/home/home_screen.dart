import 'package:cheongpodo_flutter/component/appbar_textfiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {

  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppbarTextfiled(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
                (context, index) => ListTile(title: Text('Item $index')),
          ),
        ),
      ],
    );
  }
}
