import 'package:flutter/material.dart';

import 'navigation_pages/chat_page.dart';
import 'navigation_pages/home_page.dart';
import 'navigation_pages/my_listings_page.dart';
import 'navigation_pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    MyListingsPage(),
    ChatPage(),
    ProfilePage()
  ];
  static const List<String> _titles = <String>[
    "Home Page",
    "My Listings",
    "Chat",
    "My Profile"
  ];

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.home_work), label: "My Listings"),
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chat"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(_titles.elementAt(_selectedIndex)),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}
