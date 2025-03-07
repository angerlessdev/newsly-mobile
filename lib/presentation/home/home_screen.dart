import 'package:flutter/material.dart';
import 'package:newsly/presentation/favoriteNews/favorite_news_page.dart';
import 'package:newsly/presentation/searchnews/search_news_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [SearchNewsPage(), FavoriteNewsPage()];

  void _onTapPressed(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            // or _onTapPressed,
            _onTapPressed(index);
          }),
      body: SafeArea(child: _pages[_selectedIndex]),
    );
  }
}
