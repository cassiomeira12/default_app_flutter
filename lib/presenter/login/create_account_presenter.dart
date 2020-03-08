import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_create_account_service.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:flutter/material.dart';

class CreateAccountPresenter extends CreateAccountContractPresenter {
  CreateAccountContractView _view;
  CreateAccountContractRepository repository;

  CreateAccountPresenter(@required CreateAccountContractView view) {
    this._view = view;
    this.repository = FirebaseCreateAccountService(this);
  }

  @override
  createAccount(BaseUser user) {
    _view.showProgress();
    repository.createAccount(user);

//    Future<BaseUser> result = repository.createAccount(user);
//    print("Presenter");
//    print(result);

//    repository.createAccount(user).then((BaseUser user) {
//      print("Success");
//      _view.hideProgress();
//      _view.onSuccess();
//    }).catchError((error) {
//      print("Error");
//      _view.hideProgress();
//      _view.onFailure(error.toString());
//    });
  }

  @override
  onFailure(String error) {
    _view.hideProgress();
    _view.onFailure(error.toString());
  }

  @override
  onSuccess(BaseUser user) {
    _view.hideProgress();
    _view.onSuccess();
  }

}