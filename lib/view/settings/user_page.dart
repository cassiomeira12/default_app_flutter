import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/login/phone_number_page.dart';
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

  String userName, userEmail, userPhoto;

  @override
  void initState() {
    super.initState();
    if (SingletonUser.instance != null) {
      userName = SingletonUser.instance.name;
      userEmail = SingletonUser.instance.email;
      userPhoto = SingletonUser.instance.avatarURL;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      padding: EdgeInsets.all(12),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            user(),
            txtChangePhoto(),
            nameUserInput(),
            emailUserInput(),
            changeTelefoneButton(),
            changePasswordButton(),
            salvarButton(),
          ],
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
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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

  Widget nameUserInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: userName,
          //icon: new Icon(Icons.email, color: Colors.grey,)
        ),
        //validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget emailUserInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: userEmail,
          //icon: new Icon(Icons.email, color: Colors.grey,)
        ),
        //validator: (value) => value.isEmpty ? EMAIL_INVALIDO : null,
        //onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget changeTelefoneButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: SecondaryButton(
        text: ALTERAR_TELEFONE,
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
    );
  }

  Widget changePasswordButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
      child: SecondaryButton(
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

  Widget salvarButton() {
    return Padding(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 12.0),
        child: PrimaryButton(
            text: SALVAR,
            onPressed: changeDataUser
        )
    );
  }

  void changeDataUser() {

  }

}