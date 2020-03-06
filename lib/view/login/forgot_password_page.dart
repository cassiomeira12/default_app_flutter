import 'package:default_app_flutter/view/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';
import 'signup_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.greenAccent,
                ),
                container(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget container(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          card(context),
        ],
      ),
    );
  }

  Widget card(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
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
      margin: EdgeInsets.only(top: 200, left: 40, right: 40, bottom: 20),
      child: ListView(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        children: <Widget>[
          Center(
            child: Text(
              RECUPERAR_SENHA,
              style: TextStyle(
                fontSize: 32,
                color: Colors.black38,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: EMAIL,
              labelStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Será enviado um email para..."
          ),
          SizedBox(
            height: 10,
          ),
          buttonEnviar(context),
        ],
      ),
    );
  }

  Widget buttonEnviar(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          )
      ),
      child: SizedBox.expand(
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          color: Theme.of(context).buttonColor,
          child: Text(
            CRIAR_CONTA.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
      ),
    );
  }

}
