import 'package:flutter/material.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'verified_phone_number_page.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  final _formKey = new GlobalKey<FormState>();

  String _phoneNumber;

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
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
            child: ShapeRound(_showForm(context)),
          ),
        ],
      ),
    );
  }

  Widget _showForm(context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            textTitle(),
            textMessage(),
            showNumberInput(),
            enviarSMSButton(),
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
      padding: EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      child: Center(
        child: Text(
          MENSAGEM_SMS_VERIFICACAO,
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

  Widget showNumberInput() {
    var controller = MaskedTextController(mask: '(00) 0 0000-0000');
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        maxLines: 1,
        keyboardType: TextInputType.phone,
        autofocus: false,
        decoration: InputDecoration(
          hintText: '(XX) X XXXX-XXXX',
        ),
        controller: controller,
        validator: (value) => value.isEmpty ? DIGITE_NUMERO_TELEFONE : null,
        onSaved: (value) => _phoneNumber = value.trim(),
      ),
    );
  }

  Widget enviarSMSButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: PrimaryButton(
            text: RECEBER_SMS,
            onPressed: validateAndSubmit
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

  void validateAndSubmit() {
    if (validateAndSave()) {
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return VerifiedPhoneNumberPage(phoneNumber: _phoneNumber,);
        }),
      );
    }
  }

}

