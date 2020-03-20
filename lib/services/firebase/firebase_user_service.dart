import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_app_flutter/contract/login/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../crud.dart';

class FirebaseUserService implements Crud<BaseUser>, UserContractService {
  CollectionReference _collection = Firestore.instance.collection("teste");

  @override
  Future<BaseUser> create(BaseUser item) async {
    String uId = _collection.document().documentID;

    //Atualizando informacoes ao criar novo usuario
    item.setUid(uId);
    //user.notificationToken = PreferenceUtils(activity).getTokenNotification()
    //user.createAt = DateTime();
    //user.updateAt = DateTime();
    //item.status = Status.ATIVO;
    item.password = null; //Nao adicionar a senha no BD

    return await _collection.document(uId).setData(item.toMap()).then((result) {
      return item;
    }).catchError((error) {
      print("Erro ${error.toString()}");
      return null;
    });
  }

  @override
  Future<List<BaseUser>> findBy(String field, value) async {
    return await _collection.where(field, isEqualTo: value).getDocuments().then((value) {
      var list = List<BaseUser>();
      value.documents.forEach((element) {
        list.add(BaseUser.fromMap(element.data));
      });
      return list;
    }).catchError((error) {
      return null;
    });
  }

  Future<BaseUser> findUserByEmail(String email) {
    return _collection
        .where("email", isEqualTo: email)
        .getDocuments()
        .then((value) {
      print("findUserByEmail");
      print(value.documentChanges.toString());
      print(value.documents.length);

      if (value.documents.length == 1) {//Usuario encontrado
        return BaseUser.fromMap(value.documents[0].data);
      } else if (value.documents.length == 0) {//Usuaro nao encontrado
        print("Usuário não encontrado");
        return null;
      } else {//Mais de 1 conta com mesmo email
        print("Mais de 1 usuário com mesmo email");
        return null;
      }

    }).catchError((error) {
      print(error.message);
      return null;
    });
  }

  @override
  Future<BaseUser> read(BaseUser item) {
    String uId = item.getUid();
    print("Read User $uId");
    return _collection.document(uId).get().then((result) {
      print("Documento exists ${result.exists}");
      return BaseUser.fromMap(result.data);
    }).catchError((error) {
      print("Erro ${error.toString()}");
      return null;
    });
  }

  @override
  Future<BaseUser> delete(BaseUser item) {
    return null;
  }

  @override
  Future<BaseUser> update(BaseUser item) {
    return _collection.document(item.getUid()).updateData(item.toMap()).then((value) {
      return item;
    }).catchError((error) {
      return null;
    });
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
      BaseUser user = await findUserByEmail(currentUser.email);
      if (user == null) {
        return null;
      }
      user.emailVerified = currentUser.isEmailVerified;
      return user;
    }
  }

  @override
  Future<void> signOut() async {
    //SingletonUser.instance.update(null);
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

  @override
  Future<bool> isEmailVerified() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    bool emailVerified = currentUser.isEmailVerified;
    BaseUser user = await findUserByEmail(currentUser.email);
    if (user != null) {
      user.emailVerified = emailVerified;
      _collection.document(user.getUid()).updateData(user.toMap());
    }
    return emailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    return currentUser.sendEmailVerification();
  }

}