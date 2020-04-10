import 'dart:io';

import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/user_notification.dart';
import 'package:default_app_flutter/services/crud.dart';

abstract class UserContractView {
  onFailure(String error);
  onSuccess(BaseUser user);
}

abstract class UserContractPresenter extends UserContractService {

}

abstract class UserContractService extends Crud<BaseUser> {
  Future<BaseUser> currentUser();
  Future<void> signOut();
  Future<void> changePassword(String email, String password, String newPassword);
  Future<bool> changeName(String name);
  Future<String> changeUserPhoto(File image);
  Future<bool> isEmailVerified();
  Future<void> sendEmailVerification();
  Future<List<UserNotification>> listUserNotifications();
}