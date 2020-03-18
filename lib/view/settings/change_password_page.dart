import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Alterar Senha", style: TextStyle(color: Colors.white),),
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
            currentPasswordInput(),
            newPasswordInput(),
            confirmePasswordInput(),
            salvarButton(),
          ],
        ),
      ),
    );
  }

  Widget currentPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: "Senha atual",
          //icon: new Icon(Icons.email, color: Colors.grey,)
        ),
        //validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget newPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: "Nova senha",
          //icon: new Icon(Icons.email, color: Colors.grey,)
        ),
        //validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget confirmePasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: "Repita a senha",
          //icon: new Icon(Icons.email, color: Colors.grey,)
        ),
        //validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget salvarButton() {
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: SizedBox(
        width: double.infinity,
        height: 42.0,
        child: RaisedButton(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.lightBlueAccent,
          child: new Text(
            "Salvar",
            style: new TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          onPressed: () {
            //validateAndSubmit();
          },
        ),
      ),
    );
  }

}