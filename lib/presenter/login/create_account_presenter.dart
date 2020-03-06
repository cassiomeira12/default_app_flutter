import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';

class CreateAccountPresenter implements CreateAccountContractPresenter {
  final CreateAccountContractView _view;

  CreateAccountPresenter(this._view);

  @override
  createAccount(BaseUser user) {
    _view.showProgress();
  }

}