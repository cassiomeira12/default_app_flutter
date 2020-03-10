import 'package:default_app_flutter/model/base_user.dart';

import 'base_progress_contract.dart';

abstract class CreateAccountContractView extends BaseProgressContract {
  onFailure(String error);
  onSuccess();
}

abstract class CreateAccountContractPresenter {
  final CreateAccountContractView view;
  CreateAccountContractPresenter(this.view);

  createAccount(BaseUser user);

  onFailure(String error);
  onSuccess(BaseUser user);
}

abstract class CreateAccountContractService {
  final CreateAccountContractPresenter presenter;
  CreateAccountContractService(this.presenter);

  createAccount(BaseUser user);
}