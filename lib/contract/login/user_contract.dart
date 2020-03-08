import 'package:default_app_flutter/contract/login/base_progress_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';

abstract class UserContractView {
  onFailure(String error);
  onSuccess(BaseUser user);
}

abstract class UserContractPresenter extends UserContractRepository {

}

abstract class UserContractRepository {
  Future<BaseUser> currentUser();
  Future<void> signOut();
  Future<void> changePassword(String email, String password, String newPassword);
  Future<void> changeEmail(String email);
}