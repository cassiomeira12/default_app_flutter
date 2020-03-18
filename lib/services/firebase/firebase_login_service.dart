import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../crud.dart';

class FirebaseLoginService extends LoginContractService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseLoginService(LoginContractPresenter presenter) : super(presenter);
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  signIn(String email, String password) async {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((AuthResult result) async {
      var user = BaseUser();
      user.setUid(result.user.uid);

      Crud<BaseUser> crud = FirebaseUserService();
      BaseUser result2 = await crud.read(user);

      //print("Aqui " + result2.email);

      presenter.onSuccess(result2);
    }).catchError((error) {
      presenter.onFailure(error.toString());
    });
  }

  @override
  signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.accessToken,
      accessToken: googleSignInAuthentication.idToken,
    );
    //final AuthResult result = await _firebaseAuth.signInWithCredential(credential);

    return _firebaseAuth.signInWithCredential(credential).then((AuthResult result) {
      var user = BaseUser();
      user.name = result.user.displayName;
      user.email = result.user.email;

      return user;
    });
  }

}