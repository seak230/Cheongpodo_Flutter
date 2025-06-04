import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/tutorial/grape_response.dart';

class GrapeScreen extends StatelessWidget {
  final Grape grape;

  const GrapeScreen({required this.grape, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(grape.gpseNm)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('test'),
      ),
    );
  }
}
