import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_app_flutter/contract/login/create_account_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';

import '../crud.dart';

class FirebaseUserService extends CreateAccountContractRepository implements Crud<BaseUser> {
  CollectionReference _collection = Firestore.instance.collection("users");

  @override
  Future<BaseUser> create(BaseUser item) async {
    item.setUid(_collection.document().documentID);
    await _collection.document(item.getUid()).setData(item.toMap());
    return item;
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

}