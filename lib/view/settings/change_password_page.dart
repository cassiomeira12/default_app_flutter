import 'package:default_app_flutter/contract/user/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/presenter/user/user_presenter.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class ChangePasswordPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordPage> implements UserContractView {
  final _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isLoading = false;

  String _currentPassword, _newPassword;
  UserContractPresenter presenter;

  var _controllerCurrentPassword = TextEditingController();
  var _controllerNewPassword = TextEditingController();
  var _controllerConfirmPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    presenter = UserPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(ALTERAR_SENHA, style: TextStyle(color: Colors.white),),
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

  @override
  onFailure(String error) {
    setState(() {
      _isLoading = false;
    });
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(error),
      backgroundColor: Colors.red,
    ));
  }

  @override
  onSuccess(BaseUser user) {
    _controllerCurrentPassword.clear();
    _controllerNewPassword.clear();
    _controllerConfirmPassword.clear();
    setState(() {
      _isLoading = false;
    });
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(SENHA_ALTERADA_SUCESSO),
      backgroundColor: Colors.green,
    ));
  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(12.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            currentPasswordInput(),
            newPasswordInput(),
            confirmePasswordInput(),
            _isLoading ? showCircularProgress() : salvarButton()
          ],
        ),
      ),
    );
  }

  Widget currentPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        obscureText: true,
        autofocus: false,
        controller: _controllerCurrentPassword,
        decoration: InputDecoration(
          labelText: SENHA_ATUAL,
        ),
        validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        onSaved: (value) => _currentPassword = value.trim(),
      ),
    );
  }

  Widget newPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        obscureText: true,
        autofocus: false,
        controller: _controllerNewPassword,
        decoration: InputDecoration(
          labelText: NOVA_SENHA,
        ),
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return SENHA_MUITO_CURTA;
          }
          _newPassword = value;
          return null;
        },
        onSaved: (value) => _newPassword = value.trim(),
      ),
    );
  }

  Widget confirmePasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        obscureText: true,
        autofocus: false,
        controller: _controllerConfirmPassword,
        decoration: InputDecoration(
          labelText: REPITA_SENHA,
        ),
        validator: (value) {
          if (value.isEmpty || value.length < 6) {
            return SENHA_MUITO_CURTA;
          }
          if (_newPassword != value) {
            return SENHA_NAO_SAO_IGUAIS;
          }
          return null;
        },
      ),
    );
  }

  Widget showCircularProgress() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
      child: CircularProgressIndicator(),
    );
  }

  Widget salvarButton() {
    return Padding(
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
          child: Text(
            SALVAR,
            style: TextStyle(fontSize: 18.0, color: Colors.white),
          ),
          onPressed: () {
            changePassword();
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

  void changePassword() {
    if (validateData()) {
      setState(() {
        _isLoading = true;
      });
      String email = SingletonUser.instance.email;
      presenter.changePassword(email, _currentPassword, _newPassword);
    }
  }

}