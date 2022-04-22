import 'package:flutter/material.dart';
import 'package:music_practice/Screens/Library.dart';
import 'package:music_practice/helper/helpers.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    Library(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  final List<IconData> _icons = const [
    Icons.home,
    Icons.search,
    Icons.favorite_outline_sharp,
    Icons.person_outline
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: _icons.length,
          child: Scaffold(
            body: IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
            bottomNavigationBar: TabBar(
                indicatorColor: Colors.transparent,
              tabs: _icons
                  .asMap()
                  .map((i, e) => MapEntry(
                      i,
                      Tab(
                        icon: Icon(
                          e,
                          color: i == _selectedIndex ? AppStyle.getStartedButtonColor :Colors.black,
                          size: 30.0,
                        ),
                      )))
                  .values
                  .toList(),
              onTap:  (index) => setState(() => _selectedIndex = index),
            ),
          ),
        );
  }
}
