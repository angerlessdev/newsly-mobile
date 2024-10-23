import 'package:flutter/material.dart';
import 'package:newsly/news.dart';
import 'package:newsly/utils.dart';

class SearchNewsPage extends StatefulWidget {
  const SearchNewsPage({super.key});

  @override
  State<SearchNewsPage> createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage> {
  final TextEditingController _controller = TextEditingController();
  List<News> _news = [];

  void loadData() async {
    List maps = await loadJsonFromAssets('assets/articles.json');
    setState(() {
      _news = maps.map((map) => News.fromJson(map)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _news.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      _news[index].urlToImage,
                      width: width,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    Text(_news[index].title),
                    Text(_news[index].author)
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
