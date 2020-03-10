import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../crud.dart';

class FirebaseCreateAccountService extends CreateAccountContractService {
  FirebaseCreateAccountService(CreateAccountContractPresenter presenter) : super(presenter);

  @override
  createAccount(BaseUser user) async {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password).then((AuthResult result) async {
      Crud<BaseUser> crud = FirebaseUserService();
      BaseUser result = await crud.create(user);
      presenter.onSuccess(result);
    }).catchError((error) {
      presenter.onFailure(error.toString());
    });
  }

}