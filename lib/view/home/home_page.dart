import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(HOME, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            BackgroundCard(),
//            SingleChildScrollView(
//              child: ShapeRound(
//                  _showForm()
//              ),
//            ),
          ],
        ),
      ),
    );
  }

//  Widget _showForm() {
//    return new Container(
//      padding: EdgeInsets.all(12.0),
//      child: new Form(
//        key: _formKey,
//        child: Column(
//          children: <Widget>[
//            //textTitle(),
//            //emailInput(),
//            //textMensagem(),
//            //_isLoading ? showCircularProgress() : sendButton()
//          ],
//        ),
//      ),
//    );
//  }

}