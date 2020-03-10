import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:flutter/widgets.dart';

class UserPresenter implements UserContractPresenter {
  final UserContractView _view;
  UserPresenter(@required this._view);

  UserContractService repository = FirebaseUserService();

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
    BaseUser user =  await repository.currentUser();
    print("Presenter $user");
    if (user == null) {
      _view.onFailure("");
    } else {
      _view.onSuccess(user);
    }
  }

  @override
  Future<void> signOut() {
    return repository.signOut();
  }

  @override
  isEmailVerified() {
    // TODO: implement isEmailVerified
    return null;
  }

  @override
  sendEmailVerification() {
    // TODO: implement sendEmailVerification
    return null;
  }

}