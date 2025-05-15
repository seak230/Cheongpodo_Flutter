  import 'package:cheongpodo_flutter/const/colors.dart';
  import 'package:cheongpodo_flutter/viewmodels/news_viewmodel.dart';
  import 'package:cheongpodo_flutter/viewmodels/tutorial_viewmodel.dart';
import 'package:cheongpodo_flutter/widgets/tutorial_card.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';

  class TutorialScreen extends StatelessWidget {
    const TutorialScreen({super.key});

    @override
    Widget build(BuildContext context) {
      final tutorialViewModel = Provider.of<TutorialViewmodel>(context);
      // final gpsList = tutorialViewModel.tutorialResponse?.data;

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
                      SizedBox(width: 8),
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
                  const SizedBox(height: 4),
                  Text('자신에게 맞는 포도송이를 획득할 수 있어요.'),
                ],
              ),
            ),
            const SizedBox(height: 12),
            GpsList(tutorialViewModel),
            // Expanded(
            //   child: tutorialViewModel.tutorialResponse == null
            //       ? const Center(child: CircularProgressIndicator())
            //       : ListView.builder(
            //     padding: const EdgeInsets.symmetric(horizontal: 16),
            //     itemCount: gpsList!.length,
            //     itemBuilder: (context, index) {
            //       final gps = gpsList[index];
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 8),
            //         child: Text(
            //           gps.gpsName,
            //           style: const TextStyle(fontSize: 16),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      );
    }
  }

  Widget GpsList(TutorialViewmodel tutorialViewModel) {
    if(tutorialViewModel.tutorialResponse == null) {
      tutorialViewModel.getTerms();
      return Center(child: CircularProgressIndicator());
    }

    if(tutorialViewModel.tutorialResponse!.data.isEmpty) {
      return Center(child: Text('해당 자료가 없습니다.'),);
    }

    final gpsList = tutorialViewModel.tutorialResponse!.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...gpsList.map((gps) => GpsCard(gps: gps,)).toList(),
      ],
    );
  }
