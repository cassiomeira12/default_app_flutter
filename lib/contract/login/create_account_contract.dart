import 'package:default_app_flutter/model/base_user.dart';

import 'login_contract.dart';

abstract class CreateAccountContractView extends ContractProgress {
  onFailure(String error);
  onSuccess();
}

abstract class CreateAccountContractPresenter {

  createAccount(BaseUser user);

}

abstract class CreateAccountContractRepository {

  createAccount(BaseUser user);

}