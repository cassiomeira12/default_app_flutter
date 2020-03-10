import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_create_account_service.dart';

class CreateAccountPresenter extends CreateAccountContractPresenter {
  CreateAccountContractService repository;

  CreateAccountPresenter(CreateAccountContractView view) : super(view) {
    this.repository = FirebaseCreateAccountService(this);
  }

  @override
  createAccount(BaseUser user) {
    view.showProgress();
    repository.createAccount(user);
  }

  @override
  onFailure(String error) {
    view.hideProgress();
    view.onFailure(error.toString());
  }

  @override
  onSuccess(BaseUser user) {
    view.hideProgress();
    view.onSuccess();
  }

}