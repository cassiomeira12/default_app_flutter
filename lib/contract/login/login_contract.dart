import 'package:default_app_flutter/model/base_user.dart';

import 'base_progress_contract.dart';

abstract class LoginContractView extends BaseProgressContract {

}

abstract class LoginContractPresenter {
  LoginContractView view;
  LoginContractPresenter(this.view);

  dispose() {
    this.view = null;
  }

  signIn(String email, String password);
  signInWithGoogle();
  onFailure(String error);
  onSuccess(BaseUser user);
}

abstract class LoginContractService {
  LoginContractPresenter presenter;
  LoginContractService(this.presenter);

  dispose() {
    this.presenter = null;
  }

  signIn(String email, String password);
  signInWithGoogle();
}