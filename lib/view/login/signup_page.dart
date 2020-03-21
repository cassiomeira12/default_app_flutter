import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/login/create_account_page.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({this.loginCallback});

  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  final _formKey = new GlobalKey<FormState>();

  String _name;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
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
        key: _formKey,
        child: Column(
          children: <Widget>[
            textTitle(),
            nameInput(),
            emailInput(),
            passwordInput(),
            confirmPasswordInput(),
            textData(),
            createAccountButton(),
          ],
        ),
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        CRIAR_CONTA,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget nameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: NOME,
        ),
        validator: (value) => value.isEmpty ? DIGITE_SEU_NOME : null,
        onSaved: (value) => _name = value.trim(),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: EMAIL,
        ),
        validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget passwordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: SENHA,
        ),
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return SENHA_MUITO_CURTA;
          }
          _password = value;
          return null;
        },
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget confirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          labelText: REPITA_SENHA,
        ),
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return SENHA_MUITO_CURTA;
          }
          if (_password != value) {
            return SENHA_NAO_SAO_IGUAIS;
          }
          return null;
        },
      ),
    );
  }

  Widget textData() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          TEXT_DADOS,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget createAccountButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
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
            CRIAR_CONTA,
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          onPressed: () {
            createAccount();
          },
        ),
      ),
    );
  }

  bool validateData() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  BaseUser createBaseUser() {
    BaseUser user = new BaseUser();
    user.name = _name;
    user.email = _email;
    user.password = _password;
    return user;
  }

  void createAccount() {
    if (validateData()) {
      var user = createBaseUser();
      Navigator.pop(context);
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              return CreateAccountPage(loginCallback: widget.loginCallback, user: user,);
            }
        ),
      );
    }
  }

}
