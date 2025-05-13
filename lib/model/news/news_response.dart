class NewsResponse {
  final int status;
  final String message;
  final List<News> data;

  NewsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>)
          .map((item) => News.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class News {
  final String? title;
  final String? url;
  final String? company;
  final String? thumbnail;
  final String? uploadTime;

  News({
    this.title,
    this.url,
    this.company,
    this.thumbnail,
    this.uploadTime,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      url: json['url'],
      company: json['company'],
      thumbnail: json['thumbnail'],
      uploadTime: json['uploadTime'],
    );
  }
}
