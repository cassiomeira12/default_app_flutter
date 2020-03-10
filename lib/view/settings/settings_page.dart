import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/presenter/login/user_presenter.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/notifications/notifications_settings_page.dart';
import 'package:default_app_flutter/view/settings/about_app_page.dart';
import 'package:default_app_flutter/view/settings/disable_account_page.dart';
import 'package:default_app_flutter/view/settings/termos_app_page.dart';
import 'package:default_app_flutter/view/settings/user_page.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({this.logoutCallback});

  final VoidCallback logoutCallback;

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> implements UserContractView {
  final _formKey = new GlobalKey<FormState>();

  UserContractPresenter presenter;

  bool darkMode = true;

  @override
  void initState() {
    super.initState();
    presenter = UserPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(SETTINGS),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundCard(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _showForm(),
                  formOpcoes(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(12.0),
      child: new Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            imagem(),
            textMensagem(),
          ],
        ),
      ),
    );
  }

  Widget textMensagem() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          "Cássio Meira Silva",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget imagem() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Center(
        child: Hero(
          tag: 'hero',
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 60.0,
              child: Image.asset("assets/user_default_img_white.png"),
            ),
          ),
        ),
      ),
    );
  }

  Widget formOpcoes() {
    return Column(
      children: <Widget>[
        perfilButton(),
        notificationsSettingsButton(),
        darkModeButton(),
        aboutAppButton(),
        termosButton(),
        disableAccountButton(),
        signOutButton(),
        Padding(padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40),),
      ],
    );
  }

  Widget perfilButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.person, color: Colors.black54,),
              ),
              Expanded(
                child: Text(PERFIL, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black54,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return UserPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  Widget notificationsSettingsButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.notifications, color: Colors.black54,),
              ),
              Expanded(
                child: Text(NOTIFICATIONS, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black54,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return NotificationsSettingsPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  Widget darkModeButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.color_lens, color: Colors.black54,),
              ),
              Expanded(
                child: Text("Dark Mode", style: TextStyle(fontSize: 18.0, color: Colors.black54),),
              ),
              Container(
                child: Switch(
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
              ),
            ],
          ),
          onPressed: () {
            setState(() {
              darkMode = !darkMode;
            });
          },
        ),
      ),
    );
  }

  Widget aboutAppButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.add, color: Colors.black54,),
              ),
              Expanded(
                child: Text(ABOUT, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black54,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return AboutAppPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  Widget termosButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.star, color: Colors.black54,),
              ),
              Expanded(
                child: Text(TERMOS, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black54,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return TermosAppPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  Widget disableAccountButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.clear, color: Colors.black54,),
              ),
              Expanded(
                child: Text(DISABLE_ACCOUNT, style: TextStyle(fontSize: 18.0, color: Colors.black54),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black54,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return DisableAccountPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  Widget signOutButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.exit_to_app, color: Colors.black54,),
              ),
              Expanded(
                child: Text(SIGNOUT, style: TextStyle(fontSize: 18.0, color: Colors.redAccent),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black54,),
              ),
            ],
          ),
          onPressed: () {
            presenter.signOut().whenComplete(() {
              widget.logoutCallback();
            });
          },
        ),
      ),
    );
  }

  @override
  onFailure(String error) {
    return null;
  }

  @override
  onSuccess(BaseUser user) {
    return null;
  }

}