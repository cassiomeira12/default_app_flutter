import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/status.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../crud.dart';

class FirebaseUserService implements Crud<BaseUser>, UserContractRepository {
  CollectionReference _collection = Firestore.instance.collection("teste");

  @override
  Future<BaseUser> create(BaseUser item) async {
    String uId = _collection.document().documentID;

    //Atualizando informacoes ao criar novo usuario
    item.setUid(uId);
    //user.notificationToken = PreferenceUtils(activity).getTokenNotification()
    item.emailVerified = false;
    //user.createAt = DateTime();
    //user.updateAt = DateTime();
    //item.status = Status.ATIVO;
    item.password = null; //Nao adicionar a senha no BD

    return await _collection.document(uId).setData(item.toMap()).then((result) {
      return item;
    }).catchError((error) {
      print("Erro " + error.toString());
      return null;
    });
  }

  @override
  Future<BaseUser> delete(BaseUser item) {
    return null;
  }

  @override
  Future<BaseUser> read(BaseUser item) {
    return null;
  }

  @override
  Future<BaseUser> update(BaseUser item) {
    return null;
  }

  @override
  Future<BaseUser> createAccount(BaseUser user) async {
    return await create(user);
  }

  @override
  Future<void> changeEmail(String email) {
    return null;
  }

  @override
  Future<void> changePassword(String email, String password, String newPassword) {
    return null;
  }

  @override
  Future<BaseUser> currentUser() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    if (currentUser == null) {
      return null;
    } else {
      print(currentUser.email);
      BaseUser user = BaseUser();
      user.setUid(currentUser.uid);
      user.name = currentUser.displayName;
      user.email = currentUser.email;
      return user;
    }
  }

  @override
  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  Future<void> _createUser(BaseUser user) async {
    String uId = _collection.document().documentID;
    //Atualizando informacoes ao criar novo usuario
    user.setUid(uId);
    //user.notificationToken = PreferenceUtils(activity).getTokenNotification()
    user.emailVerified = false;
    //user.createAt = DateTime();
    //user.updateAt = DateTime();
    //user.status = Status.ATIVO;
    user.password = null; //Nao adicionar a senha no BD

    return _collection.document(uId).setData(user.toMap());
  }

}