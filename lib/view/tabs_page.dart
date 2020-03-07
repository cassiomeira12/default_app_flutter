import 'package:default_app_flutter/view/comanda/comanda_page.dart';
import 'package:default_app_flutter/view/historico/historico_page.dart';
import 'package:default_app_flutter/view/home/home_page.dart';
import 'package:default_app_flutter/view/notifications/notifications_page.dart';
import 'package:default_app_flutter/view/settings/settings_page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePage(),
    NotificationsPage(),
    ComandaPage(),
    HistoricoPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Mapa'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Promoções'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            title: Text('Comanda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Histórico'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}