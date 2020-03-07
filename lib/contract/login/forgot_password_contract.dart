import 'base_progress_contract.dart';

abstract class ForgotPasswordContractView extends BaseProgressContract {

}

abstract class ForgotPasswordContractPresenter {
  sendEmail(String email);
}

abstract class ForgotPasswordContractRepository {
  Future<void> sendEmail(String email);
}