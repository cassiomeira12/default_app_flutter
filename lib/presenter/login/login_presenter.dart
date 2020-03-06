import 'package:default_app_flutter/contract/login/login_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_login_reposotory.dart';

class LoginPresenter extends LoginContractPresenter {
  final LoginContractView _view;

  LoginPresenter(this._view);

  LoginContractRepository repository = FirebaseLoginRepository();

  @override
  signIn(String email, String password) async {
    _view.showProgress();
    BaseUser nome = await repository.signIn(email, password);
    print(nome);
    _view.onFailure(nome.name);
  }

  @override
  Future<BaseUser> signInWithGoogle() async {
    _view.showProgress();
    //BaseUser nome = await repository.signInWithGoogle();
    //print(nome);
    //_view.onFailure(nome.name);
//    repository.signInWithGoogle()
//      .then((user) => _view.onSuccess())
//      .catchError((onError) {
//        _view.onFailure(onError.toString());
//    });
  }

}