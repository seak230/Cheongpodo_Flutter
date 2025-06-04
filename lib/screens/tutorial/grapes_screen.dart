import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/tutorial/GpsResponse.dart';
import '../../viewmodels/tutorial_viewmodel.dart';

class GrapesScreen extends StatelessWidget {
  final int gpsId;

  const GrapesScreen({super.key, required this.gpsId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('제목'),
        leading: BackButton(),
      ),
      body: FutureBuilder(
        future: Provider.of<TutorialViewmodel>(context, listen: false).fetchOneGps(gpsId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          final gps = Provider.of<TutorialViewmodel>(context).gpsResponse?.data;

          if (gps == null) {
            return const Center(child: Text('데이터가 없습니다.'));
          }

          return ListView(
            children: [
              _GpsHeader(gps),
              ...gps.gpList.map((gp) => OneGpsCard(gp: gp)).toList(),
            ],
          );
        },
      ),
    );
  }

  Widget _GpsHeader(Gps gps) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(gps.gpsName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('${gps.gpsTime}분 - 포도송이 - ${gps.gpCnt}/${gps.gpCntMax}포도알'),
          const SizedBox(height: 8),
          Text(gps.gpsContent),
        ],
      ),
    );
  }
}

class OneGpsCard extends StatelessWidget {
  final Gp gp;

  const OneGpsCard({super.key, required this.gp});

  @override
  Widget build(BuildContext context) {
    // print(gp.gpId);
    // return Container();
    return FutureBuilder(
      future: Provider.of<TutorialViewmodel>(context, listen: false).fetchGrape(gp.gpId),
      builder: (context, snapshot) {
        final grapeList = Provider.of<TutorialViewmodel>(context).grapeResponse?.data;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(gp.gpNm, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Text('${gp.gpTm}분 - 포도알 - ${gp.gpseCnt}/${gp.gpseCntMax}'),
                  const SizedBox(height: 10),
                  if (snapshot.connectionState != ConnectionState.done)
                    const CircularProgressIndicator()
                  else if (grapeList == null || grapeList.isEmpty)
                    const Text('해당 자료가 없습니다.')
                  else
                    ...grapeList.map((g) => Text(g.gpseNm)).toList(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
