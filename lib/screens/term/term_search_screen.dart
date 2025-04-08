import 'package:cheongpodo_flutter/widgets/appbar_textfiled.dart';
import 'package:flutter/material.dart';

class TermSearchScreen extends StatelessWidget {
  const TermSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              AppbarTextfiled(textField: true),
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
