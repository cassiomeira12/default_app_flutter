import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';

class CreateAccountPresenter implements CreateAccountContractPresenter {
  final CreateAccountContractView _view;

  CreateAccountPresenter(this._view);

  CreateAccountContractRepository repository = FirebaseUserService();

  @override
  createAccount(BaseUser user) {
    _view.showProgress();
    repository.createAccount(user).then((BaseUser user) {
      _view.hideProgress();
      _view.onSuccess();
    }).catchError((error) {
      _view.hideProgress();
      _view.onFailure(error.toString());
    });
  }

}