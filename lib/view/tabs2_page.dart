import 'package:default_app_flutter/view/comanda/comanda_page.dart';
import 'package:default_app_flutter/view/historico/historico_page.dart';
import 'package:default_app_flutter/view/home/home_page.dart';
import 'package:default_app_flutter/view/notifications/notifications_page.dart';
import 'package:default_app_flutter/view/settings/settings_page.dart';
import 'package:flutter/material.dart';

class Tabs2Page extends StatefulWidget {
  @override
  _Tabs2PageState createState() => _Tabs2PageState();
}

class _Tabs2PageState extends State<Tabs2Page> {

  int currentTab = 0;
  final List<Widget> screens = [
    HomePage(),
    NotificationsPage(),
    ComandaPage(),
    HistoricoPage(),
    SettingsPage(),
  ];

  Widget currentScreen = HomePage();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        backgroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            currentScreen = ComandaPage();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[


                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.home, color: currentTab == 0 ? Colors.blue : Colors.grey,),
                        currentTab == 0 ? Text("Home", style: TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey),) : Container()
                      ],
                    ),
                  ),


                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = NotificationsPage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.notifications, color: currentTab == 1 ? Colors.blue : Colors.grey,),
                        currentTab == 1 ? Text("Notifications", style: TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey),) : Container()
                      ],
                    ),
                  ),

                  //SizedBox(width: 20,),

                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HistoricoPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.history, color: currentTab == 3 ? Colors.blue : Colors.grey,),
                        currentTab == 3 ? Text("Historico", style: TextStyle(color: currentTab == 3 ? Colors.blue : Colors.grey),) : Container()
                      ],
                    ),
                  ),


                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = SettingsPage();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings, color: currentTab == 4 ? Colors.blue : Colors.grey,),
                        currentTab == 4 ? Text("Settings", style: TextStyle(color: currentTab == 4 ? Colors.blue : Colors.grey),) : Container()
                      ],
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),


    );
  }
}
