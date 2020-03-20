import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../strings.dart';
import '../crud.dart';

class FirebaseLoginService extends LoginContractService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseLoginService(LoginContractPresenter presenter) : super(presenter);
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  signIn(String email, String password) async {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((AuthResult result) async {
      Crud<BaseUser> crud = FirebaseUserService();
      List<BaseUser> list =  await crud.findBy("email", email);

      if (list.length == 1) {
        BaseUser user = list[0];
        if (!user.emailVerified) { // Verificando se o email do usuario foi validado
          user.emailVerified = result.user.isEmailVerified; // Atualizando caso o email ja foi validado
          crud.update(user); // Atualizando a base de dados
        }
        presenter.onSuccess(user);
      } else if (list.length == 0) {
        _firebaseAuth.signOut();
        presenter.onFailure(USUARIO_NAO_ENCONTRADO);
      }

    }).catchError((error) {
      presenter.onFailure(error.toString());
    });
  }

  @override
  signInWithGoogle() async {
//    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      idToken: googleSignInAuthentication.accessToken,
//      accessToken: googleSignInAuthentication.idToken,
//    );
//    //final AuthResult result = await _firebaseAuth.signInWithCredential(credential);
//
//    return _firebaseAuth.signInWithCredential(credential).then((AuthResult result) {
//      var user = BaseUser();
//      user.name = result.user.displayName;
//      user.email = result.user.email;
//
//      return user;
//    });
  }

}