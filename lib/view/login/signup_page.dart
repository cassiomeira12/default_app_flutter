import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/login/created_account_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{
  final _formKey = new GlobalKey<FormState>();

  String _name;
  String _email;
  String _password;
  String _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
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
            textTitle(),
            nameInput(),
            emailInput(),
            passwordInput(),
            confirmPasswordInput(),
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
          hintText: NOME,
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
          hintText: EMAIL,
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
          hintText: SENHA,
        ),
        validator: (value) => value.isEmpty ? SENHA_MUITO_CURTA : null,
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
          hintText: REPITA_SENHA,
        ),
        validator: (value) => value.isEmpty ? REPITA_SENHA : null,
        onSaved: (value) => _confirmPassword = value.trim(),
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
      print(user.name);
      print(user.email);
      print(user.password);

      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) {
              return CreatedAccountPage(
                user: user,
              );
            }
        ),
      );
    }
  }



//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        iconTheme: IconThemeData(color: Colors.white),
//      ),
//      body: Container(
//        color: Colors.white,
//        child: ListView(
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                Container(
//                  width: double.infinity,
//                  height: 300,
//                  color: Colors.greenAccent,
//                ),
//                container(context),
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget container(BuildContext context) {
//    return SingleChildScrollView(
//      child: Column(
//        children: <Widget>[
//          card(context),
//        ],
//      ),
//    );
//  }
//
//  Widget card(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      height: 510,
//      decoration: BoxDecoration(
//          color: Colors.white,
//          border: Border.all(
//            width: 1,
//            color: Colors.black12,
//          ),
//          borderRadius: BorderRadius.all(
//            Radius.circular(10),
//          )
//      ),
//      margin: EdgeInsets.only(top: 60, left: 40, right: 40, bottom: 20),
//      child: ListView(
//        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
//        children: <Widget>[
//          Center(
//            child: Text(
//              CRIAR_CONTA,
//              style: TextStyle(
//                fontSize: 32,
//                color: Colors.black38,
//              ),
//            ),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextFormField(
//            autofocus: true,
//            keyboardType: TextInputType.emailAddress,
//            decoration: InputDecoration(
//              labelText: "Nome",
//              labelStyle: TextStyle(
//                color: Colors.black38,
//                fontWeight: FontWeight.w400,
//                fontSize: 20,
//              ),
//            ),
//            style: TextStyle(fontSize: 20),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextFormField(
//            keyboardType: TextInputType.text,
//            obscureText: true,
//            decoration: InputDecoration(
//              labelText: "Email",
//              labelStyle: TextStyle(
//                color: Colors.black38,
//                fontWeight: FontWeight.w400,
//                fontSize: 20,
//              ),
//            ),
//            style: TextStyle(fontSize: 20),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextFormField(
//            autofocus: true,
//            keyboardType: TextInputType.emailAddress,
//            decoration: InputDecoration(
//              labelText: "Telefone",
//              labelStyle: TextStyle(
//                color: Colors.black38,
//                fontWeight: FontWeight.w400,
//                fontSize: 20,
//              ),
//            ),
//            style: TextStyle(fontSize: 20),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextFormField(
//            keyboardType: TextInputType.text,
//            obscureText: true,
//            decoration: InputDecoration(
//              labelText: "Senha",
//              labelStyle: TextStyle(
//                color: Colors.black38,
//                fontWeight: FontWeight.w400,
//                fontSize: 20,
//              ),
//            ),
//            style: TextStyle(fontSize: 20),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          TextFormField(
//            autofocus: true,
//            keyboardType: TextInputType.emailAddress,
//            decoration: InputDecoration(
//              labelText: "Repita a senha",
//              labelStyle: TextStyle(
//                color: Colors.black38,
//                fontWeight: FontWeight.w400,
//                fontSize: 20,
//              ),
//            ),
//            style: TextStyle(fontSize: 20),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          termosApp(context),
//          SizedBox(
//            height: 10,
//          ),
//          buttonCriar(context),
//        ],
//      ),
//    );
//  }
//
//  Widget termosApp(BuildContext context) {
//    return Row(
//      children: <Widget>[
//        Text(
//            "Ao me cadastrar eu estou de"
//        ),
//      ],
//    );
//  }
//
//  Widget buttonCriar(BuildContext context) {
//    return Container(
//      height: 50,
//      alignment: Alignment.centerLeft,
//      margin: EdgeInsets.only(left: 10, right: 10),
//      decoration: BoxDecoration(
//          color: Colors.white,
//          border: Border.all(
//            width: 1,
//            color: Colors.white,
//          ),
//          borderRadius: BorderRadius.all(
//            Radius.circular(10),
//          )
//      ),
//      child: SizedBox.expand(
//        child: RaisedButton(
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.all(Radius.circular(10)),
//            side: BorderSide(color: Colors.black12),
//          ),
//          color: Theme.of(context).buttonColor,
//          child: Text(
//            CRIAR_CONTA.toUpperCase(),
//            style: TextStyle(
//              color: Colors.white,
//              fontWeight: FontWeight.bold,
//              fontSize: 14,
//            ),
//          ),
//          onPressed: () {
//            Navigator.push(
//                context, CupertinoPageRoute(builder: (context) => SignUpPage()),
//            );
//          },
//        ),
//      ),
//    );
//  }

}
