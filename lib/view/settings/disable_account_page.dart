import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/widgets/danger_button.dart';
import 'package:flutter/material.dart';

class DisableAccountPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _DisableAccountState();
}

class _DisableAccountState extends State<DisableAccountPage> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(DISABLE_ACCOUNT, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                txtTitle(),
                txtMessage(),
                disableAccountButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget txtTitle() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
      child: Text(
        "Tem certeza que deseja desativar sua conta?",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget txtMessage() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0.0),
      child: Text(
        "Se você acha que não vai user o ${APP_NAME} novamente e desaja desativar sua conta, cuidaremos disso para você.",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black54,
          //fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget disableAccountButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 20.0),
        child: DangerButton(
          text: DISABLE_ACCOUNT,
          onPressed: () {

          },
        ),
    );
  }


}