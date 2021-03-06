import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/comanda/comanda_page.dart';
import 'package:default_app_flutter/view/historico/historico_page.dart';
import 'package:default_app_flutter/view/home/home_page.dart';
import 'package:default_app_flutter/view/notifications/notifications_page.dart';
import 'package:default_app_flutter/view/settings/settings_page.dart';
import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  TabsPage({this.logoutCallback});

  final VoidCallback logoutCallback;

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {

  int currentTab = 0;
  List<Widget> screens = null;
  Widget currentScreen;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();
    screens = [
      HomePage(),
      NotificationsPage(),
      ComandaPage(),
      HistoricoPage(),
      SettingsPage(logoutCallback: widget.logoutCallback,),
    ];
    currentScreen = screens[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.album),
        backgroundColor: currentTab == 2 ? Theme.of(context).primaryColorDark : Colors.grey,
        onPressed: () {
          setState(() {
            currentScreen = screens[2];
            currentTab = 2;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[0];
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.home, color: currentTab == 0 ? Theme.of(context).primaryColorDark : Colors.grey,),
                    currentTab == 0 ? Text(HOME, style: TextStyle(color: currentTab == 0 ? Theme.of(context).primaryColorDark : Colors.grey),) : Container()
                  ],
                ),
              ),

              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[1];
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.notifications, color: currentTab == 1 ? Theme.of(context).primaryColorDark : Colors.grey,),
                    currentTab == 1 ? Text(NOTIFICATIONS, style: TextStyle(color: currentTab == 1 ? Theme.of(context).primaryColorDark : Colors.grey),) : Container()
                  ],
                ),
              ),

              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[3];
                    currentTab = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.history, color: currentTab == 3 ? Theme.of(context).primaryColorDark : Colors.grey,),
                    currentTab == 3 ? Text(HISTORICO, style: TextStyle(color: currentTab == 3 ? Theme.of(context).primaryColorDark : Colors.grey),) : Container()
                  ],
                ),
              ),

              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentScreen = screens[4];
                    currentTab = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.settings, color: currentTab == 4 ? Theme.of(context).primaryColorDark : Colors.grey,),
                    currentTab == 4 ? Text(SETTINGS, style: TextStyle(color: currentTab == 4 ? Theme.of(context).primaryColorDark : Colors.grey),) : Container()
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
