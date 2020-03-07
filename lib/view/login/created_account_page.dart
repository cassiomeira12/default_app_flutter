import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/presenter/login/create_account_presenter.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class CreatedAccountPage extends StatefulWidget {
  CreatedAccountPage({this.user});

  final BaseUser user;

  @override
  State<StatefulWidget> createState() => _CreatedAccountPageState();
}

class _CreatedAccountPageState extends State<CreatedAccountPage> implements CreateAccountContractView {

  CreateAccountContractPresenter presenter;

  bool _isLoading = false;
  String _textMessage = "Estamos criando sua conta...";
  String _imgURL = "";

  @override
  void initState() {
    super.initState();
    presenter = CreateAccountPresenter(this);
    presenter.createAccount(widget.user);
  }

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
        //key: _formKey,
        child: Column(
          children: <Widget>[
            textTitle(),
            _isLoading ? showCircularProgress() : imagem(), textMensagem(),
          ],
        ),
      ),
    );
  }

  Widget textTitle() {
    return Center(
      child: Text(
        CRIANDO_CONTA,
        style: TextStyle(
          fontSize: 28,
          color: Colors.black38,
        ),
      ),
    );
  }

  Widget imagem() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset(_imgURL),
        ),
      ),
    );
  }

  Widget showCircularProgress() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: CircularProgressIndicator(),
    );
  }

  Widget textMensagem() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: Center(
        child: Text(
          _textMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
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
  onSuccess() {
    setState(() {
      _imgURL = "assets/sucesso.png";
      _textMessage = "Sua conta foi criada com sucesso!";
    });
  }

  @override
  onFailure(String error) {
    setState(() {
      _imgURL = "assets/error.png";
      _textMessage = error;
    });
  }

}