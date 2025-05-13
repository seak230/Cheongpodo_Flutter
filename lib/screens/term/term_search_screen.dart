import 'package:cheongpodo_flutter/model/term/term_response.dart';
import 'package:cheongpodo_flutter/screens/term/term_screen.dart';
import 'package:cheongpodo_flutter/viewmodels/term_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

class TermSearchScreen extends StatefulWidget {
  const TermSearchScreen({super.key});

  @override
  State<TermSearchScreen> createState() => _TermSearchScreenState();
}

class _TermSearchScreenState extends State<TermSearchScreen> {
  @override
  void initState() {
    super.initState();
    // 화면 진입 시 한 번만 실행
    Future.microtask(() {
      final termViewModel = Provider.of<TermViewModel>(context, listen: false);
      termViewModel.getTerms(page: 0, size: 10000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final termViewModel = Provider.of<TermViewModel>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextField(
                onChanged: (value) {
                  termViewModel.getTermsKeyword(keyword: value);
                },
                decoration: InputDecoration(
                  hintText: '용어를 검색하세요',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Expanded(
              child: Consumer<TermViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.termResponse == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final terms = viewModel.termResponse!.data;

                  if (terms.isEmpty) {
                    return const Center(child: Text('검색 결과가 없습니다.'));
                  }

                  return ListView.builder(
                    itemCount: terms.length,
                    itemBuilder: (context, index) {
                      final term = terms[index];
                      return TermCard(term);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    // return Scaffold(
    //   resizeToAvoidBottomInset: true,
    //   body: LayoutBuilder(
    //     builder: (context, constraints) {
    //       return CustomScrollView(
    //         slivers: [
    //           AppbarTextfiled(textField: true),
    //           SliverToBoxAdapter(
    //             child: TermsList(termViewModel),
    //           ),
    //         ],
    //       );
    //     },
    //   ),
    // );
  }
}

Widget TermsList(TermViewModel termViewModel) {
  if (termViewModel.termResponse == null) {
    return Center(child: CircularProgressIndicator());
  }

  if (termViewModel.termResponse!.data.isEmpty) {
    return Center(child: Text('단어가 없습니다.'));
  }

  final termsList = termViewModel.termResponse!.data;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...termsList.map((term) => TermCard(term)).toList()
    ],
  );
}

Widget TermCard(Term term) {
  return InkWell(
    onTap: () {
      Get.to(() => TermScreen(term: term.termNm, termId: term.termId,));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(Icons.search, size: 30.0, color: Color(0xFFADB0BF),),
          SizedBox(width: 5.0,),
          Text(term.termNm, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.0, color: Color(0xFFADB0BF)),)
        ],
      ),
    ),
  );
}