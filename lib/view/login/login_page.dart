import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/presenter/login/login_presenter.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/light_button.dart';
import 'package:default_app_flutter/view/widgets/secondary_button.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../strings.dart';
import 'forgot_password_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.loginCallback});

  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginContractView {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  LoginContractPresenter presenter;

  String _email;
  String _password;

  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    pr = ProgressDialog(context);
    presenter = LoginPresenter(this);
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }

  @override
  hideProgress() {
    pr.dismiss();
  }

  @override
  showProgress() {
    pr.show();
  }

  @override
  onFailure(String error) {
    hideProgress();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Colors.red,
    ));
  }

  @override
  onSuccess(BaseUser result) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Sucesso"),
      backgroundColor: Colors.blue,
    ));
    widget.loginCallback();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundCard(),
            bodyAppScrollView(),
          ],
        ),
      ),
    );
  }

  Widget bodyAppScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ShapeRound(
            _showForm()
          ),
          textOU(),
          googleButton(),
          signupButton(),
        ],
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
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showForgotPasswordButton(),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget showLogo() {
    return Column(
      children: <Widget>[
        Hero(
          tag: 'hero',
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 48.0,
              child: Image.asset("assets/logo_app.png"),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          APP_NAME,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: EMAIL,
          //icon: new Icon(Icons.email, color: Colors.grey,)
        ),
        validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: SENHA,
          //icon: new Icon(Icons.lock, color: Colors.grey,)
        ),
        validator: (value) => value.isEmpty ? SENHA_INVALIDA : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showForgotPasswordButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
        child: LightButton(
          alignment: Alignment.bottomRight,
          text: RECUPERAR_SENHA,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return ForgotPasswordPage();
                  }
              ),
            );
          },
        ),
    );
  }

  Widget loginButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 16.0),
        child: SizedBox(
          width: double.infinity,
          height: 42.0,
          child: RaisedButton(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.lightBlueAccent),
            ),
            color: Colors.lightBlueAccent,
            child: new Text(
              LOGAR,
              style: new TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            onPressed: () {
              validateAndSubmit();
            },
          ),
        ),
    );
  }

  Widget textOU() {
    return Text(
      "--- $OU ---",
      style: TextStyle(
        fontSize: 18,
        color: Colors.black38,
      ),
    );
  }

  Widget googleButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(60.0, 12.0, 60.0, 0.0),
        child: SecondaryButton(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              SizedBox(
                child: Image.asset("assets/google_logo.png"),
                width: 28,
                height: 28,
              ),
              Container(
                //color: Colors.black,
                alignment: Alignment.center,
                child: Text(
                  LOGAR_COM_GOOGLE.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            //presenter.signInWithGoogle();
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Recurso indisponível"),
              backgroundColor: Colors.redAccent,
            ));
          },
        ),
    );
  }

  Widget signupButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(60.0, 12.0, 60.0, 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 42.0,
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: Colors.black12),
          ),
          color: Colors.white,
          child: Text(
            CRIAR_CONTA,
            style: new TextStyle(
              fontSize: 18.0,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return SignUpPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() {
    if (validateAndSave()) {
      presenter.signIn(_email, _password);
    }
  }

}