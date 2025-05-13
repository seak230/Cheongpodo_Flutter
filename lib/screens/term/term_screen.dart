import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              AppbarTextfiled(
                textField: true,
              ),
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
                              Icon(
                                Icons.bookmark,
                                size: 30,
                                color: PRIMARY_COLOR,
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
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1
                                  )
                                ),
                                child: InkWell(
                                  onTap: () {

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '쉬운용어 풀이',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // ElevatedButton(
                              //   onPressed: () {},
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.orange,
                              //   ),
                              //   child:
                              // ),
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
