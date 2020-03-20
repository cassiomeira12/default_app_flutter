import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:default_app_flutter/strings.dart';

class UserPresenter implements UserContractPresenter {
  final UserContractView _view;
  UserPresenter(this._view);

  UserContractService service = FirebaseUserService();

  @override
  Future<void> changeEmail(String email) {
    return null;
  }

  @override
  Future<void> changePassword(String email, String password, String newPassword) {
    return null;
  }

  @override
  Future<BaseUser> currentUser() async {
    BaseUser user =  await service.currentUser();
    if (user == null) {
      _view.onFailure("");
    } else {
      _view.onSuccess(user);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }

  @override
  Future<bool> isEmailVerified() {
    return service.isEmailVerified();
  }

  @override
  Future<void> sendEmailVerification() async {
    await service.sendEmailVerification().then((value) {
      _view.onSuccess(null);
    }).catchError((error) {
      _view.onFailure(ERROR_ENVIAR_EMAIL);
      print("Erro ao enviar email ${error.message}");
    });
  }

}