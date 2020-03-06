
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/presenter/login/login_presenter.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../strings.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.loginCallback});

  //final BaseAuth auth;
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
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    pr = ProgressDialog(context);
    presenter = LoginPresenter(this);
  }

  @override
  void dispose() {
    super.dispose();

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
  onSuccess() {
    //pr.dismiss();
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Sucesso"),
      backgroundColor: Colors.blue,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            backgroudCard(),
            bodyAppScrollView(),
          ],
        ),
      ),
    );
  }

  Widget backgroudCard() {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.greenAccent,
    );
  }

  Widget bodyAppScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _shapeRound(),
          textOU(),
          //googleButton(),
          //googleButton2(),
          showSecondaryButton(),
        ],
      ),
    );
  }

  Widget _shapeRound() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )
      ),
      child: _showForm(),
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
            showPrimaryButton(),
            showErrorMessage(),
          ],
        ),
      ),
    );
  }

  Widget showCircularProgress() {
    if (true) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset("assets/logo_app.png"),
        ),
      ),
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
      child: Container(
        alignment: Alignment.bottomRight,
        child: FlatButton(
          child: Text(
            RECUPERAR_SENHA,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 14,
            ),
          ),
          onPressed: () {
//            Navigator.of(context).push(
//              MaterialPageRoute(
//                  builder: (context) {
//                    return ForgotPasswordPage();
//                  }
//              ),
//            );
          },
        ),
      ),
    );
  }

  Widget showPrimaryButton() {
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
      padding: EdgeInsets.fromLTRB(80.0, 12.0, 80.0, 0.0),
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
          child: Row(
            children: <Widget>[
              SizedBox(
                child: Image.asset("assets/google_logo.png"),
                width: 28,
                height: 28,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                LOGAR_COM_GOOGLE.toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          onPressed: () {
            //presenter.signInWithGoogle();
//            setState(() {
//              _isLoading = true;
//            });
//            Scaffold.of(context).showSnackBar(new SnackBar(
//                content: new Text("asdf")
//            ));
//            widget.auth.signInWithGoogle().whenComplete(() {
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (context) {
//                    return Home();
//                  }
//                ),
//              );
//            });
          },
        ),
      ),
    );
  }

//  Widget googleButton2() {
//    return OutlineButton(
//      splashColor: Colors.grey,
//      onPressed: () {},
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//      highlightElevation: 0,
//      borderSide: BorderSide(color: Colors.grey),
//      child: Padding(
//        padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
//        child: Row(
//          mainAxisSize: MainAxisSize.min,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Image(image: AssetImage("assets/google_logo.png"), height: 28.0),
//            Padding(
//              padding: EdgeInsets.only(left: 10),
//              child: Text(
//                LOGAR_COM_GOOGLE,
//                style: TextStyle(
//                  fontSize: 14,
//                  color: Colors.grey,
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }

  Widget showSecondaryButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(80.0, 12.0, 80.0, 16.0),
      child: SizedBox(
        width: double.infinity,
        height: 42.0,
        child: FlatButton(
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

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300,
        ),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }





  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });

    //showProgress();
    //CollectionReference _collection = Firestore.instance.collection("teste");
    //_collection.document("cassio").delete();

    if (validateAndSave()) {
      presenter.signIn(_email, _password);
    }

//    if (validateAndSave()) {
//      String userId = "";
//      try {
//
//        userId = await widget.auth.signIn(_email, _password);
//
//        setState(() {
//          _isLoading = false;
//        });
//
//        if (userId.length > 0 && userId != null && _isLoginForm) {
//          widget.loginCallback();
//        }
//      } catch (e) {
//        print('Error $e');
//        setState(() {
//          _isLoading = false;
//          _errorMessage = e.message;
//          _formKey.currentState.reset();
//        });
//      }
//    }

  }



}