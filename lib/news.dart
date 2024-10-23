class News {
  String author;
  String title;
  String description;
  String publishedAt;
  String content;
  String url;
  String urlToImage;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.content,
      required this.url,
      required this.urlToImage});

  News.fromJson(Map<String, dynamic> json)
      : this(
            author: json['author'] ?? '',
            title: json['title'] ?? '',
            description: json['description'] ?? '',
            publishedAt: json['publishedAt'] ?? '',
            content: json['content'] ?? '',
            url: json['url'] ?? '',
            urlToImage: json['urlToImage'] ?? '');
}
