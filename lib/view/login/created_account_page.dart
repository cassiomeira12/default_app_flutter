import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:flutter/material.dart';

class CreatedAccountPage extends StatefulWidget {
  CreatedAccountPage({this.user});

  final BaseUser user;

  @override
  State<StatefulWidget> createState() => _CreatedAccountPageState();
}

class _CreatedAccountPageState extends State<CreatedAccountPage> implements CreateAccountContractView {

  CreateAccountContractPresenter presenter;

  @override
  void initState() {
    super.initState();
    //presenter;
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
          //_shapeRound(),
          //textOU(),
          //googleButton(),
          //googleButton2(),
          //showSecondaryButton(),
        ],
      ),
    );
  }

  @override
  hideProgress() {
    // TODO: implement hideProgress
    return null;
  }

  @override
  onFailure(String error) {
    // TODO: implement onFailure
    return null;
  }

  @override
  onSuccess() {
    // TODO: implement onSuccess
    return null;
  }

  @override
  showProgress() {
    // TODO: implement showProgress
    return null;
  }



}