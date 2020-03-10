import 'package:default_app_flutter/contract/login/forgot_password_contract.dart';
import 'package:default_app_flutter/presenter/login/forgot_password_presenter.dart';
import 'package:default_app_flutter/view/login/login_page.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class ForgotPasswordPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPasswordPage> implements ForgotPasswordContractView {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ForgotPasswordContractPresenter presenter;

  String _email;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    presenter = ForgotPasswordPresenter(this);
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
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
            emailInput(),
            textMensagem(),
            _isLoading ? showCircularProgress() : sendButton()
          ],
        ),
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        RECUPERAR_SENHA,
        style: TextStyle(
          fontSize: 24,
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget emailInput() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: EMAIL,
        ),
        validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget textMensagem() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          FORGOT_PASSWORD_TEXT,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget showCircularProgress() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
      child: CircularProgressIndicator(),
    );
  }

  Widget sendButton() {
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
            ENVIAR,
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          onPressed: () {
            if (validateAndSave()) {
              setState(() {
                _isLoading = true;
              });
              presenter.sendEmail(_email);
            }
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

  @override
  hideProgress() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  showProgress() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  onFailure(String error) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Colors.redAccent,
    ));
  }

  @override
  onSuccess(String result) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(result),
      backgroundColor: Colors.green,
    ));
  }

}
