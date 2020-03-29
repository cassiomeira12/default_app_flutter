import 'package:default_app_flutter/contract/user/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/services/crud.dart';
import 'package:default_app_flutter/services/firebase/firebase_user_service.dart';
import 'package:default_app_flutter/strings.dart';

class UserPresenter implements UserContractPresenter, Crud<BaseUser> {
  final UserContractView _view;
  UserPresenter(this._view);

  UserContractService service = FirebaseUserService();

  @override
  Future<BaseUser> create(BaseUser item) async {
    return await service.create(item).then((value) {
      _view.onSuccess(value);
      return value;
    }).catchError((error) {
      _view.onFailure(error.message);
      return null;
    });
  }

  @override
  Future<BaseUser> delete(BaseUser item) async {
    return await service.create(item).then((value) {
      _view.onSuccess(value);
      return value;
    }).catchError((error) {
      _view.onFailure(error.message);
      return null;
    });
  }

  @override
  Future<List<BaseUser>> findBy(String field, value) async {
    return await service.findBy(field, value).then((value) {
      return value;
    }).catchError((error) {
      _view.onFailure(error.message);
      return null;
    });
  }

  @override
  Future<BaseUser> read(BaseUser item) async {
    return await service.read(item).then((value) {
      _view.onSuccess(value);
      return value;
    }).catchError((error) {
      _view.onFailure(error.message);
      return null;
    });
  }

  @override
  Future<BaseUser> update(BaseUser item) async {
    return await service.update(item).then((value) {
      _view.onSuccess(value);
      return value;
    }).catchError((error) {
      _view.onFailure(error.message);
      return null;
    });
  }

  @override
  Future<void> changeEmail(String email) {
    return null;
  }

  @override
  Future<String> changePassword(String email, String password, String newPassword) async {
    await service.changePassword(email, password, newPassword).then((value) {
      _view.onSuccess(null);
    }).catchError((error) {
      _view.onFailure(error.message);
    });
  }

  @override
  Future<BaseUser> currentUser() async {
    BaseUser user =  await service.currentUser();
    if (user == null) {
      _view.onFailure("");
    } else {
      _view.onSuccess(user);
    }
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }

  @override
  Future<bool> isEmailVerified() {
    return service.isEmailVerified();
  }

  @override
  Future<void> sendEmailVerification() async {
    await service.sendEmailVerification().then((value) {
      _view.onSuccess(null);
    }).catchError((error) {
      _view.onFailure(ERROR_ENVIAR_EMAIL);
    });
  }

}