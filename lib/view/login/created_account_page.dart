import 'package:default_app_flutter/model/base_user.dart';
import 'package:flutter/material.dart';

class CreatedAccountPage extends StatefulWidget {
  CreatedAccountPage({this.user});

  final BaseUser user;

  @override
  State<StatefulWidget> createState() => _CreatedAccountPageState();
}

class _CreatedAccountPageState extends State<CreatedAccountPage>{

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



}