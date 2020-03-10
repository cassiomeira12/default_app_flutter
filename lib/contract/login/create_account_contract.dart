import 'package:default_app_flutter/model/base_user.dart';

import 'base_progress_contract.dart';

abstract class CreateAccountContractView extends BaseProgressContract {
  onFailure(String error);
  onSuccess();
}

abstract class CreateAccountContractPresenter {
  CreateAccountContractView view;
  CreateAccountContractPresenter(this.view);

  dispose() {
    this.view = null;
  }

  createAccount(BaseUser user);

  onFailure(String error);
  onSuccess(BaseUser user);
}

abstract class CreateAccountContractService {
  CreateAccountContractPresenter presenter;
  CreateAccountContractService(this.presenter);

  dispose() {
    this.presenter = null;
  }

  createAccount(BaseUser user);
}