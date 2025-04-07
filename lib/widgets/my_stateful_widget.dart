import 'package:cheongpodo_flutter/const/colors.dart';
import 'package:cheongpodo_flutter/icon/bottom_bar_icon_icons.dart';
import 'package:cheongpodo_flutter/view/News/news_screen.dart';
import 'package:cheongpodo_flutter/view/Route/route_screen.dart';
import 'package:cheongpodo_flutter/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  // 아이콘이 클릭되었을 때의 이벤트 리스너
  // 클릭된 인덱스로 _selectedIndex에 할당하고 build 함수를 호출한다(setState)
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double icon_size = 20;

    return Scaffold(
      // body에 넣어줄 아이템
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon:
            _selectedIndex == 0
                ? Icon(BottomBarIcon.route, color: PRIMARY_COLOR, size: icon_size,)
                : Icon(BottomBarIcon.route, color: LIGHT_GRAY_COLOR, size: icon_size,),
            label: 'route',
          ),
          BottomNavigationBarItem(
            icon:
            _selectedIndex == 1
                ? Icon(BottomBarIcon.news, color: PRIMARY_COLOR, size: icon_size,)
                : Icon(BottomBarIcon.news, color: LIGHT_GRAY_COLOR, size: icon_size,),
            label: 'news',
          ),
          BottomNavigationBarItem(
            icon:
            _selectedIndex == 2
                ? Icon(BottomBarIcon.home, color: PRIMARY_COLOR, size: icon_size,)
                : Icon(BottomBarIcon.home, color: LIGHT_GRAY_COLOR, size: icon_size,),
            label: 'home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        //(1)
        showUnselectedLabels: false,
        //(1)
        type: BottomNavigationBarType.fixed, //(2)
      ),
    );
  }
}
