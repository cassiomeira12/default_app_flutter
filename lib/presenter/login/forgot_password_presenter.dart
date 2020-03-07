import 'package:default_app_flutter/contract/login/forgot_password_contract.dart';
import 'package:default_app_flutter/services/firebase/firebase_forgot_password_service.dart';

class ForgotPasswordPresenter extends ForgotPasswordContractPresenter {
  final ForgotPasswordContractView _view;

  ForgotPasswordPresenter(this._view);

  ForgotPasswordContractRepository repository = FirebaseForgotPasswordService();

  @override
  sendEmail(String email) {
    _view.showProgress();
    repository.sendEmail(email).then((result) {
      _view.hideProgress();
      _view.onSuccess();
    }).catchError((error) {
      _view.hideProgress();
      _view.onFailure(error.toString());
    });
  }

}