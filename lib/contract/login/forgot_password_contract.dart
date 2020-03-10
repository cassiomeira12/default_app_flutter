import 'base_progress_contract.dart';

abstract class ForgotPasswordContractView extends BaseProgressContract {

}

abstract class ForgotPasswordContractPresenter {
  final ForgotPasswordContractView view;
  ForgotPasswordContractPresenter(this.view);

  sendEmail(String email);
}

abstract class ForgotPasswordContractService {
  Future<void> sendEmail(String email);
}