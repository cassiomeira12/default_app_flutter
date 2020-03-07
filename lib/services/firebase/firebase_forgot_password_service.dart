import 'package:default_app_flutter/contract/login/forgot_password_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseForgotPasswordService extends ForgotPasswordContractRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<void> sendEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

}