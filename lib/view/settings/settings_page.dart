import 'package:default_app_flutter/contract/user/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/presenter/user/user_presenter.dart';
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
  String userName, userPhoto;

  @override
  void initState() {
    super.initState();
    presenter = UserPresenter(this);
    userName = SingletonUser.instance.name;
    userPhoto = SingletonUser.instance.avatarURL;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(SETTINGS, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundCard(height: 150,),
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
            imgUser(),
            textUserName(),
          ],
        ),
      ),
    );
  }

  Widget textUserName() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          userName,
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

  Widget imgUser() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Center(
        child: Hero(
          tag: 'hero',
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child: ClipOval(
              child: loadImage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget loadImage() {
    return (userPhoto == null || userPhoto.isEmpty) ?
    CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 60,
      child: Image.asset("assets/user_default_img_white.png"),
    )
        :
    Image.network(userPhoto,fit: BoxFit.cover, width: 120,
      loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ?
            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.person_outline, color: Colors.black45,),
              ),
              Expanded(
                child: Text(PERFIL, style: TextStyle(fontSize: 18.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.notifications_none, color: Colors.black45,),
              ),
              Expanded(
                child: Text(NOTIFICATIONS, style: TextStyle(fontSize: 18.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.color_lens, color: Colors.black45,),
              ),
              Expanded(
                child: Text("Dark Mode", style: TextStyle(fontSize: 18.0, color: Colors.black45),),
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.info_outline, color: Colors.black45,),
              ),
              Expanded(
                child: Text(ABOUT, style: TextStyle(fontSize: 18.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.help_outline, color: Colors.black45,),
              ),
              Expanded(
                child: Text(TERMOS, style: TextStyle(fontSize: 18.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.delete, color: Colors.black45,),
              ),
              Expanded(
                child: Text(DISABLE_ACCOUNT, style: TextStyle(fontSize: 18.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
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
        height: 60,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            //side: BorderSide(color: Colors.black26),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                child: Icon(Icons.exit_to_app, color: Colors.black45,),
              ),
              Expanded(
                child: Text(SIGNOUT, style: TextStyle(fontSize: 18.0, color: Colors.redAccent),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
              ),
            ],
          ),
          onPressed: () {
            showDialogLogOut();
          },
        ),
      ),
    );
  }

  void showDialogLogOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(SIGNOUT),
          content: Text("Deseja sair do ${APP_NAME} ?"),
          actions: <Widget>[
            FlatButton(
              child: Text(CANCELAR),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(SIGNOUT),
              onPressed: () {
                Navigator.of(context).pop();
                presenter.signOut().whenComplete(() {
                  widget.logoutCallback();
                });
              },
            ),
          ],
        );
      },
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