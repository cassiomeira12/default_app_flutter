import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  //RootPage({this.auth});

  //final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_LOGGED_IN;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    //widget.auth.getCurrentUser().then((user) {
      //setState(() {
//        if (user != null) {
//          _userId = user?.uid;
//        }
//        authStatus = user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage(
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        //return new RecuperarSenha();
        return new LoginPage(
          loginCallback: loginCallback,
        );
        break;
      default:
        return buildWaitingScreen();
    }
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  void loginCallback() {
//    widget.auth.getCurrentUser().then((user) {
//      setState(() {
//        //_userId = user.uid.toString();
//      });
//    });
//    setState(() {
//      authStatus = AuthStatus.LOGGED_IN;
//    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

}