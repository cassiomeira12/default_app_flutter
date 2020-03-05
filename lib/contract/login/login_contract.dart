
abstract class ContractProgress {
  showProgress();
  hideProgress();
}


abstract class LoginContractView extends ContractProgress {
  onFailure(String error);
  onSuccess();
}

abstract class LoginContractPresenter {

  signIn(String email, String password);
  //Future<BaseUser> signInWithGoogle();

}

abstract class LoginContractRepository {

  //Future<BaseUser> signIn(String email, String password);
  //Future<BaseUser> signInWithGoogle();

}