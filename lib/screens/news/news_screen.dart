import 'package:cheongpodo_flutter/widgets/button_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/news_viewmodel.dart';
import '../../widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                // NewsCard(),
                SizedBox(height: 20),
                ButtonList(
                  category: ['증권', '금융', '경제 일반', '부동산', '산업/재계'],
                  onCategorySelected: (category) {
                    newsViewModel.getNews(category: category);  // 선택된 카테고리로 뉴스 요청
                  },
                ),
                NewsList(newsViewModel)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

Widget NewsList(NewsViewModel newsViewModel) {
  if (newsViewModel.newsResponse == null) {
    newsViewModel.getNews(category: 'securities');
    return Center(child: CircularProgressIndicator());
  }

  if (newsViewModel.newsResponse!.data.isEmpty) {
    return Center(child: Text('뉴스가 없습니다.'));
  }

  final newsList = newsViewModel.newsResponse!.data;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Text(
          '오늘의 뉴스',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      ...newsList.map((news) => NewsCard(news: news)).toList(),
    ],
  );
}