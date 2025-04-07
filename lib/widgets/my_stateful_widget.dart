import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/icon/bottom_bar_icon_icons.dart';
import 'package:cheongpodo_flutter/view/News/news_screen.dart';
import 'package:cheongpodo_flutter/view/Route/route_screen.dart';
import 'package:cheongpodo_flutter/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 2;
  final List<Widget> _widgetOptions = [
    RouteScreen(),
    NewsScreen(),
    Homescreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double icon_size = 20;

    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              BottomBarIcon.route,
              color: _selectedIndex == 0 ? PRIMARY_COLOR : LIGHT_GRAY_COLOR,
              size: icon_size,
            ),
            label: 'route',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BottomBarIcon.news,
              color: _selectedIndex == 1 ? PRIMARY_COLOR : LIGHT_GRAY_COLOR,
              size: icon_size,
            ),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              BottomBarIcon.home,
              color: _selectedIndex == 2 ? PRIMARY_COLOR : LIGHT_GRAY_COLOR,
              size: icon_size,
            ),
            label: 'home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
