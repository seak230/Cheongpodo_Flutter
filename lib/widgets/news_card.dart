// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class NewsCard extends StatelessWidget {
//   const NewsCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 200, // 필수! 높이 안 주면 PageView 안 보임
//       child: PageView.builder(
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20.0),
//             decoration: BoxDecoration(
//               color: Colors.blue[100 * (index + 1)],
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Center(
//               child: Text(
//                 '페이지 ${index + 1}',
//                 style: const TextStyle(fontSize: 24),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../../model/news/news_response.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      elevation: 2,
      child: ListTile(
        leading: Image.network(news.thumbnail, width: 80, fit: BoxFit.cover),
        title: Text(news.title),
        subtitle: Text('${news.company} • ${news.uploadTime}'),
        onTap: () {
          // 웹뷰로 연결 등 가능
        },
      ),
    );
  }
}
