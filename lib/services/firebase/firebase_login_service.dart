//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLoginService {
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<String> signInWithGoogle() async {
//    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      idToken: googleSignInAuthentication.accessToken,
//      accessToken: googleSignInAuthentication.idToken,
//    );
//
//    final AuthResult result = await _firebaseAuth.signInWithCredential(credential);
//    final FirebaseUser user = result.user;
//    prints();
//    return user.uid;
  }

  @override
  Future<void> getCurrentUser() async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    return user;
  }

  @override
  Future<bool> isEmailVerified() async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    return user.isEmailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
//    FirebaseUser user = await _firebaseAuth.currentUser();
//    user.sendEmailVerification();
  }

  @override
  Future<String> signIn(String email, String password) async {
//    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//    FirebaseUser user = result.user;
//    prints();
//    return user.uid;
  }

  @override
  Future<void> signOut() {
    //return _firebaseAuth.signOut();
  }

  @override
  Future<String> signUp(String email, String password) async {
//    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//    FirebaseUser user = result.user;
//    prints();
//    return user.uid;
  }

  void prints() async {
    //FirebaseUser user = await getCurrentUser();
//    print("uid ${user.uid}");
//    print("displayName ${user.displayName}");
//    print("email ${user.email}");
//    print("isEmailVerified ${user.isEmailVerified}");
//    print("phoneNumber ${user.phoneNumber}");
//    print("photoUrl ${user.photoUrl}");
    //print("isAnonymous ${user.toString()}");
  }

}