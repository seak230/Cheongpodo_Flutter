import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/term_viewmodel.dart';
import '../../widgets/appbar_textfiled.dart';

class TermScreen extends StatelessWidget {
  final String term;
  final int termId;

  TermScreen({required this.term, required this.termId, super.key});

  @override
  Widget build(BuildContext context) {
    final termViewModel = Provider.of<TermViewModel>(context);
    termViewModel.getEachTerm(termId: termId);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return CustomScrollView(
            slivers: [
              AppbarTextfiled(textField: false,),
              SliverList(
                delegate: SliverChildListDelegate([
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, size: 20, color: Colors.red),
                              Icon(Icons.star, size: 20, color: Colors.red),
                              Icon(Icons.star, size: 20, color: Colors.red),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(color: Colors.black),
                              ),
                            ],
                          ),
                          Container(height: 10.0,),
                          Row(
                            children: [
                              Text(
                                '$term',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Flexible(
                                fit: FlexFit.tight,
                                child: Container(color: Colors.black),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.orange
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 3.0, bottom: 3.0),
                                  child: InkWell(
                                    onTap: () async {
                                      await termViewModel.fetchSummary(term);
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            child: Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: SingleChildScrollView(
                                                child: MarkdownBody(
                                                  data: termViewModel.summary.isNotEmpty
                                                      ? termViewModel.summary
                                                      : '불러올 내용이 없습니다.',
                                                  styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Text("쉬운용어 풀이", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                                  ),
                                )

                                // InkWell(
                                //   onTap: () async {
                                //     showDialog(
                                //       context: context,
                                //       barrierDismissible: false,
                                //       builder: (_) => const Center(child: CircularProgressIndicator()),
                                //     );
                                //
                                //     await termViewModel.fetchTermSummary('예: 인플레이션');
                                //
                                //     Navigator.pop(context); // 로딩 끝나면 다이얼로그 닫기
                                //
                                //     showDialog(
                                //       context: context,
                                //       builder: (context) {
                                //         return AlertDialog(
                                //           title: const Text('용어 설명'),
                                //           content: Text(termViewModel.summary),
                                //           actions: [
                                //             TextButton(
                                //               onPressed: () => Navigator.pop(context),
                                //               child: const Text('닫기'),
                                //             ),
                                //           ],
                                //         );
                                //       },
                                //     );
                                //   },
                                //   child: const Padding(
                                //     padding: EdgeInsets.all(8.0),
                                //     child: Text(
                                //       '쉬운용어 풀이',
                                //       style: TextStyle(
                                //         fontWeight: FontWeight.w700,
                                //         fontSize: 10.0,
                                //         color: Colors.black,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                          Container(height: 10.0,),
                          Text(
                              termViewModel.eachTermResponse == null ? '':termViewModel.eachTermResponse!.data.termExplain
                          ),
                          Row(
                            children: [
                              Flexible(child: Container()),
                              Text('출처 : 경제금융용어 700선', style: TextStyle(fontWeight: FontWeight.w200, fontSize: 10, color: Colors.black ),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
