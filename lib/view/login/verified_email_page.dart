import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/presenter/login/user_presenter.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:default_app_flutter/view/widgets/secondary_button.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class VerifiedEmailPage extends StatefulWidget {
  VerifiedEmailPage({this.logoutCallback});

  final VoidCallback logoutCallback;

  @override
  State<StatefulWidget> createState() => _VerifiedEmailPageState();
}

class _VerifiedEmailPageState extends State<VerifiedEmailPage> implements UserContractView {

  String email = "";
  String imgEmail = "assets/error.png";
  bool sendingEmail = true;
  String textMessage = "";

  UserContractPresenter presenter;

  @override
  void initState() {
    super.initState();
    email = SingletonUser.instance.email;
    presenter = UserPresenter(this);
    presenter.sendEmailVerification();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundCard(),
            SingleChildScrollView(
              child: ShapeRound(
                  _showForm()
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
        //key: _formKey,
        child: Column(
          children: <Widget>[
            textTitle(),
            showLogo(),
            textMensagem(),
            sendEmailButton(),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        EMAIL_VERIFICACAO,
        style: TextStyle(
          fontSize: 24,
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget showLogo() {
    return sendingEmail ?
    Padding(
      padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 25.0),
      child: CircularProgressIndicator(),
    ) :
    Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset(imgEmail),
        ),
      ),
    );
  }

  Widget textMensagem() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              textMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              email,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sendEmailButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: SecondaryButton(
        text: REENVIAR_EMAIL,
        onPressed: () {
          setState(() {
            sendingEmail = true;
          });
          presenter.sendEmailVerification();
        },
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: PrimaryButton(
        text: FAZER_LOGIN,
        onPressed: () {
          widget.logoutCallback();
        },
      ),
    );
  }

  @override
  onFailure(String error) {
    setState(() {
      sendingEmail = false;
      this.textMessage = error;
      this.imgEmail = "assets/error.png";
    });
  }

  @override
  onSuccess(BaseUser user) {
    setState(() {
      sendingEmail = false;
      this.textMessage = EMAIL_VERIFICACAO_ENVIADO;
      this.imgEmail = "assets/email.png";
    });
  }

}