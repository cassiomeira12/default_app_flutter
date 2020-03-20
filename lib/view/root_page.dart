import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/presenter/login/user_presenter.dart';
import 'package:default_app_flutter/view/tabs_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';
import 'login/verified_email_page.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  EMAIL_NOT_VERIFIED,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> implements UserContractView {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;

  UserContractPresenter presenter;

  @override
  void initState() {
    super.initState();
    presenter = UserPresenter(this);
    presenter.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginPage(loginCallback: loginCallback,);
        break;
      case AuthStatus.LOGGED_IN:
        return TabsPage(logoutCallback: logoutCallback,);
        break;
      case AuthStatus.EMAIL_NOT_VERIFIED:
        return VerifiedEmailPage(logoutCallback: logoutCallback,);
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
    if (SingletonUser.instance.emailVerified) {
      setState(() {
        authStatus = AuthStatus.LOGGED_IN;
      });
    } else {
      setState(() {
        authStatus = AuthStatus.EMAIL_NOT_VERIFIED;
      });
    }
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
    });
  }

  @override
  onFailure(String error) {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
    });
  }

  @override
  onSuccess(BaseUser user) {
    SingletonUser.instance.update(user);
    if (user.emailVerified) {
      setState(() {
        authStatus = AuthStatus.LOGGED_IN;
      });
    } else {
      setState(() {
        authStatus = AuthStatus.EMAIL_NOT_VERIFIED;
      });
    }
  }

}