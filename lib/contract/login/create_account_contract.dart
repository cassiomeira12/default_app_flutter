import 'package:default_app_flutter/model/base_user.dart';

import 'base_progress_contract.dart';

abstract class CreateAccountContractView extends BaseProgressContract {
  onFailure(String error);
  onSuccess();
}

abstract class CreateAccountContractPresenter {

  createAccount(BaseUser user);

}

abstract class CreateAccountContractRepository {

  Future<BaseUser> createAccount(BaseUser user);

}