
import 'package:flutter/material.dart';

import '../screens/create_product_page.dart';
import '../screens/home_page.dart';
import '../style/style.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    HomePage(),
    CreateProductPage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index); // Smooth navigation without reloading
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: _pages, // Prevent swipe navigation
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: colorGreen,
        currentIndex: _selectedIndex,
        onTap: _onTapped, // Handle index change
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Create',
          ),
        ],
      ),
    );
  }
}
