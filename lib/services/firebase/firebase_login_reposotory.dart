import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLoginRepository extends LoginContractRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseLoginRepository(LoginContractPresenter presenter) : super(presenter);
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<BaseUser> signIn(String email, String password) async {
    _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((AuthResult result) {
      //var user = BaseUser();
      //user.name = result.user.displayName;
      //user.email = result.user.email;
      presenter.onSuccess(null);
    }).catchError((error) {
      presenter.onFailure(error.toString());
    });
  }

//  @override
//  Future<BaseUser> signInWithGoogle() async {
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
//  }

}