import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const/colors.dart';
import '../../viewmodels/tutorial_viewmodel.dart';
import '../../widgets/tutorial_card.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tutorialViewModel = Provider.of<TutorialViewmodel>(context, listen: false);

    return SafeArea(
      child: Column(
        children: [
          const _TutorialHeader(),
          const SizedBox(height: 12),
          Expanded(
            child: FutureBuilder(
              future: tutorialViewModel.fetchGps(), // getGps → fetchGps 이름 변경 권장
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                final gpsList = tutorialViewModel.tutorialResponse?.data;

                if (gpsList == null || gpsList.isEmpty) {
                  return const Center(child: Text('해당 자료가 없습니다.'));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: gpsList.length,
                  itemBuilder: (context, index) {
                    final gps = gpsList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GpsCard(gps: gps),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TutorialHeader extends StatelessWidget {
  const _TutorialHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.square_rounded, color: PRIMARY_COLOR, size: 30.0),
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
          SizedBox(height: 4),
          Text('자신에게 맞는 포도송이를 획득할 수 있어요.'),
        ],
      ),
    );
  }
}
