//import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class BaseUser implements BaseModel {
  String uId;
  String notificationToken;
  String avatarURL;
  //Status status;
  String name;
  String email;
  bool emailVerified;
  String password;
  DateTime createAt;
  DateTime updateAt;

  BaseUser();

//  BaseUser.fromMap(DocumentSnapshot document) {
//    uId = document.data["uId"];
//    notificationToken = document.data["notificationToken"];
//    avatarURL = document.data["avatarURL"];
//    name = document.data["name"];
//    email = document.data["email"];
//    emailVerified = document.data["emailVerified"];
//    password = document.data["password"];
//    createAt = document.data["createAt"];
//    updateAt = document.data["updateAt"];
//  }

  BaseUser.fromMap(Map<String, dynamic>  map) {
    uId = map["uId"];
    notificationToken = map["notificationToken"];
    avatarURL = map["avatarURL"];
    name = map["name"];
    email = map["email"];
    emailVerified = map["emailVerified"];
    password = map["password"];
    createAt = map["createAt"];
    updateAt = map["updateAt"];
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map["uId"] = uId;
    map["notificationToken"] = notificationToken;
    map["avatarURL"] = avatarURL;
    map["name"] = name;
    map["email"] = email;
    map["emailVerified"] = emailVerified;
    map["password"] = password;
    map["createAt"] = createAt;
    map["updateAt"] = updateAt;
    return map;
  }

  toJson() {
    return {
      "uId": uId,
      "notificationToken": notificationToken,
      "avatarURL": avatarURL,
      "name": name,
      "email": email,
      "emailVerified": emailVerified,
      "password": password,
      "createAt": createAt,
      "updateAt": updateAt,
    };
  }

  @override
  String getCollection() {
    return "teste";
  }

  @override
  String getUid() {
    return uId;
  }

  @override
  void setUid(String uId) {
    this.uId = uId;
  }

}