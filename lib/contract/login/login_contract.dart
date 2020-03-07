import 'package:default_app_flutter/model/base_user.dart';

import 'base_progress_contract.dart';

abstract class LoginContractView extends BaseProgressContract {

}

abstract class LoginContractPresenter {

  signIn(String email, String password);
  //Future<BaseUser> signInWithGoogle();

}

abstract class LoginContractRepository {

  Future<BaseUser> signIn(String email, String password);
  //Future<BaseUser> signInWithGoogle();

}