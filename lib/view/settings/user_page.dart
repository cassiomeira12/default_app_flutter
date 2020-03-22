import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/settings/phone_number_page.dart';
import 'package:default_app_flutter/view/widgets/background_card.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:default_app_flutter/view/widgets/secondary_button.dart';
import 'package:default_app_flutter/view/widgets/shape_round.dart';
import 'package:flutter/material.dart';

import 'change_password_page.dart';

class UserPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _UserState();
}

class _UserState extends State<UserPage> {
  final _formKey = new GlobalKey<FormState>();

  String userName, userEmail, userPhoneNumber , userPhoto;

  @override
  void initState() {
    super.initState();
    if (SingletonUser.instance != null) {
      userName = SingletonUser.instance.name;
      userEmail = SingletonUser.instance.email;
      userPhoneNumber = SingletonUser.instance.phoneNumber == null ? NUMERO_CELULAR : SingletonUser.instance.phoneNumber.toString();
      userPhoto = SingletonUser.instance.avatarURL;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(PERFIL, style: TextStyle(color: Colors.white),),
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
    return  Container(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            user(),
            txtChangePhoto(),
            nameUser(),
            emailUser(),
            phoneNumberUser(),
            changePasswordButton(),
          ],
        ),
      ),
    );
  }

  Widget perfilButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.0),
      child: SizedBox(
        //width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            //side: BorderSide(color: Colors.black12),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(userPhoneNumber, style: TextStyle(fontSize: 18.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
              ),
            ],
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }

  Widget user() {
    return Container(
      width: 180,
      //padding: EdgeInsets.fromLTRB(70.0, 0.0, 70.0, 0.0),
      //color: Colors.red,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          imgUser(),
          Align(
            alignment: Alignment.bottomRight,
            child: RawMaterialButton(
              child: Icon(Icons.camera_alt, color: Colors.white,),
              shape: CircleBorder(),
              elevation: 2.0,
              fillColor: Theme.of(context).primaryColorDark,
              padding: const EdgeInsets.all(10.0),
              onPressed: () { },
            ),
          ),
        ],
      ),
    );
  }

  Widget imgUser() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      child: Center(
        child: Hero(
          tag: 'hero',
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: ClipOval(
              child: loadImage(),
            ),
          ),
        ),
      ),
    );
  }

  Widget loadImage() {
    return (userPhoto == null || userPhoto.isEmpty) ?
    CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 80,
      child: Image.asset("assets/user_default_img_white.png"),
    )
        :
    Image.network(userPhoto,fit: BoxFit.cover, width: 150,
      loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ?
            loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }

  Widget txtChangePhoto() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      child: Center(
        child: Text(
          TROCAR_FOTO,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget nameUser() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.0),
      child: SizedBox(
        //width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            //side: BorderSide(color: Colors.black12),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(userName, style: TextStyle(fontSize: 16.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
              ),
            ],
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }

  Widget emailUser() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.0),
      child: SizedBox(
        //width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            //side: BorderSide(color: Colors.black12),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(userEmail, style: TextStyle(fontSize: 16.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
              ),
            ],
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }

  Widget phoneNumberUser() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.0),
      child: SizedBox(
        //width: double.infinity,
        height: 55,
        child: RaisedButton(
          elevation: 0.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            //side: BorderSide(color: Colors.black12),
          ),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(userPhoneNumber, style: TextStyle(fontSize: 16.0, color: Colors.black45),),
              ),
              Container(
                child: Icon(Icons.chevron_right, color: Colors.black45,),
              ),
            ],
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) {
                    return PhoneNumberPage();
                  }
              ),
            );
          },
        ),
      ),
    );
  }

  Widget changePasswordButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(12, 16.0, 12, 0.0),
      child: PrimaryButton(
        text: ALTERAR_SENHA,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) {
                  return ChangePasswordPage();
                }
            ),
          );
        },
      ),
    );
  }

}