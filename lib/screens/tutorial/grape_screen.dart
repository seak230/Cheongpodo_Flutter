import 'package:cheongpodo_flutter/viewmodels/tutorial_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import '../../model/tutorial/grape_response.dart';

class GrapeScreen extends StatelessWidget {
  final Grape grape;
  final int gpseId;

  const GrapeScreen({required this.grape, required this.gpseId, super.key});

  @override
  Widget build(BuildContext context) {
    final grapeViewModel = Provider.of<TutorialViewmodel>(context);
    grapeViewModel.fetchOneGpse(gpseId);
    return Scaffold(
      appBar: AppBar(title: Text(grape.gpseNm)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Markdown(data: grapeViewModel.gpseResponse == null ? '' : grapeViewModel.gpseResponse!.data.gpseContent)
      ),
    );
  }
}
