import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_login_reposotory.dart';
import 'package:flutter/cupertino.dart';

class LoginPresenter extends LoginContractPresenter {
  LoginContractView _view = null;
  LoginContractRepository repository;

  LoginPresenter(@required LoginContractView view) {
    this._view = view;
    repository = FirebaseLoginRepository(this);
  }

  @override
  signIn(String email, String password) {
    _view.showProgress();
    repository.signIn(email, password);
  }

  @override
  Future<BaseUser> signInWithGoogle() async {
    //_view.showProgress();
    //BaseUser nome = await repository.signInWithGoogle();
    //print(nome);
    //_view.onFailure(nome.name);
//    repository.signInWithGoogle()
//      .then((user) => _view.onSuccess())
//      .catchError((onError) {
//        _view.onFailure(onError.toString());
//    });
  }

  @override
  onFailure(String error) {
    _view.hideProgress();
    _view.onFailure(error);
  }

  @override
  onSuccess(BaseUser user) {
    _view.hideProgress();
    _view.onSuccess();
  }

}