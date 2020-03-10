import 'package:default_app_flutter/model/base_user.dart';

import 'base_progress_contract.dart';

abstract class LoginContractView extends BaseProgressContract {

}

abstract class LoginContractPresenter {
  final LoginContractView view;
  LoginContractPresenter(this.view);

  signIn(String email, String password);
  signInWithGoogle();
  onFailure(String error);
  onSuccess(BaseUser user);

}

abstract class LoginContractService {
  final LoginContractPresenter presenter;
  LoginContractService(this.presenter);

  signIn(String email, String password);
  signInWithGoogle();

}