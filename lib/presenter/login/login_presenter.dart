import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_login_service.dart';

class LoginPresenter extends LoginContractPresenter {
  LoginContractService service;

  LoginPresenter(LoginContractView view) : super(view) {
    this.service = FirebaseLoginService(this);
  }

  @override
  signIn(String email, String password) {
    view.showProgress();
    service.signIn(email, password);
  }

  @override
  signInWithGoogle() {
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
    view.hideProgress();
    view.onFailure(error);
  }

  @override
  onSuccess(BaseUser user) {
    view.hideProgress();
    view.onSuccess(user);
  }

}