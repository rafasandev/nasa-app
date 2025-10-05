import 'package:atmos_app/presentation/pages/dashboard.dart';
import 'package:atmos_app/presentation/pages/home.dart';
import 'package:atmos_app/presentation/pages/map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget> [
    HomePage(),
    DashboardPage(),
    MapPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.blue,
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: "Dashboard",
                activeIcon: Icon(
                  Icons.dashboard,
                  color: Colors.blue,
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: "Map",
                activeIcon: Icon(
                  Icons.map,
                  color: Colors.blue,
                )
            ),

          ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}