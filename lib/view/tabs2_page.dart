import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/comanda/comanda_page.dart';
import 'package:default_app_flutter/view/historico/historico_page.dart';
import 'package:default_app_flutter/view/home/home_page.dart';
import 'package:default_app_flutter/view/notifications/notifications_page.dart';
import 'package:default_app_flutter/view/settings/settings_page.dart';
import 'package:flutter/material.dart';

class Tabs2Page extends StatefulWidget {
  Tabs2Page({this.logoutCallback});

  final VoidCallback logoutCallback;

  @override
  _Tabs2PageState createState() => _Tabs2PageState();
}

class _Tabs2PageState extends State<Tabs2Page> {

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
        child: Icon(Icons.star),
        backgroundColor: Colors.blue,
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
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
                        Icon(Icons.home, color: currentTab == 0 ? Colors.blue : Colors.grey,),
                        currentTab == 0 ? Text("Home", style: TextStyle(color: currentTab == 0 ? Colors.blue : Colors.grey),) : Container()
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
                        Icon(Icons.notifications, color: currentTab == 1 ? Colors.blue : Colors.grey,),
                        currentTab == 1 ? Text(NOTIFICATIONS, style: TextStyle(color: currentTab == 1 ? Colors.blue : Colors.grey),) : Container()
                      ],
                    ),
                  ),

                  //SizedBox(width: 20,),

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
                        Icon(Icons.history, color: currentTab == 3 ? Colors.blue : Colors.grey,),
                        currentTab == 3 ? Text(HISTORICO, style: TextStyle(color: currentTab == 3 ? Colors.blue : Colors.grey),) : Container()
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
                        Icon(Icons.settings, color: currentTab == 4 ? Colors.blue : Colors.grey,),
                        currentTab == 4 ? Text(SETTINGS, style: TextStyle(color: currentTab == 4 ? Colors.blue : Colors.grey),) : Container()
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
