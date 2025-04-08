import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermScreen extends StatelessWidget {
  final String term;
  const TermScreen({required this.term, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('term')
        ],
      ),
    );
  }
}
