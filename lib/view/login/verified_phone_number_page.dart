import 'package:flutter/material.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class VerifiedPhoneNumberPage extends StatefulWidget {
  VerifiedPhoneNumberPage({this.phoneNumber});

  final String phoneNumber;

  @override
  State<StatefulWidget> createState() => _VerifiedPhoneNumberPageState();
}

class _VerifiedPhoneNumberPageState extends State<VerifiedPhoneNumberPage> {
  final _formKey = new GlobalKey<FormState>();

  String _code;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          ShapeRound(_showForm()),
        ],
      ),
    );
  }

  Widget _showForm() {
    return new Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            textTitle(),
            textMessage(),
            textPhoneNumber(),
            showCodeInput(),
            showConfirmationButton(),
          ],
        ),
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        NUMERO_CELULAR,
        style: TextStyle(
          fontSize: 32,
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget textMessage() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          MENSAGEM_SMS_ENVIADO,
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

  Widget textPhoneNumber() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          widget.phoneNumber,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget showCodeInput() {
    var controller = MaskedTextController(mask: '0000');
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'XXXX',
        ),
        controller: controller,
        validator: (value) => value.isEmpty ? DIGITE_CODIGO_VALIDACAO : null,
        onSaved: (value) => _code = value.trim(),
      ),
    );
  }

  Widget showConfirmationButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: PrimaryButton(
            text: CONFIRMAR,
            onPressed: sendCode
        )
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

  void sendCode() {
    if (validateAndSave()) {
      print(_code);
//      Navigator.of(context).push(
//        MaterialPageRoute(builder: (context) {
//          return VerifiedPhoneNumberPage(phoneNumber: _phoneNumber,);
//        }),
//      );
    }
  }

}
