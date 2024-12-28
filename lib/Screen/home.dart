import 'package:flutter/material.dart';
import 'package:imagine_cup/Screen/search_screen.dart';

class Home extends StatefulWidget {
  final int pageIndex;
  String userId;
  Home({super.key, required this.pageIndex, required this.userId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _selectedIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;

    pages = <Widget>[
      SearchScreen(userId: "userID"),
      SearchScreen(userId: "userID"),
      _buildPageWithBackground(const Color(0xffF8F8F8), SearchScreen(userId: "userID")),
      SearchScreen(userId: "userID"),
      SearchScreen(userId: "userID"),
    ];
  }

  Widget _buildPageWithBackground(Color backgroundColor, Widget child) {
    return Container(
      color: backgroundColor,
      child: child,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('todo'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('add memo'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('search'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('calendar'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_rounded),
              title: const Text('setting'),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff469D7B),
        unselectedItemColor: const Color(0xff757575),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in), label: 'todo'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle), label: 'add memo'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
