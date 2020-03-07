import 'package:default_app_flutter/model/base_user.dart';

abstract class UserContractPresenter {

  Future<BaseUser> currentUser();

}