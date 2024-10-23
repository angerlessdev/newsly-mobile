import 'package:flutter/material.dart';
import 'package:newsly/news.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.news});
  final News news;

  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              widget.news.urlToImage,
              height: height * 0.4,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.news.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.news.author),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.news.content),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton.outlined(
                    onPressed: () {}, icon: const Icon(Icons.web)),
                IconButton.outlined(
                    onPressed: () {
                      setState(() {
                        _isFavorite = !_isFavorite;
                      });
                    },
                    icon: const Icon(Icons.favorite),
                    color: _isFavorite
                        ? ThemeData().primaryColor
                        : ThemeData().hintColor)
              ],
            )
          ],
        ),
      ),
    );
  }
}
