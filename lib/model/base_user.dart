import 'package:default_app_flutter/model/status.dart';

import 'base_model.dart';
import 'phone_number.dart';

class BaseUser implements BaseModel<BaseUser> {
  static getCollection() => "users";

  String _uId;
  NotificationToken notificationToken;
  String avatarURL;
  Status status;
  String name;
  String email;
  bool emailVerified;
  String password;
  DateTime createAt;
  DateTime updateAt;
  PhoneNumber phoneNumber;

  BaseUser();

  update(BaseUser user) {
    _uId = user.getUid();
    notificationToken = user.notificationToken;
    avatarURL = user.avatarURL;
    status = user.status;
    name = user.name;
    email = user.email;
    emailVerified = user.emailVerified;
    password = user.password;
    createAt = user.createAt;
    updateAt = user.updateAt;
    phoneNumber = user.phoneNumber;
  }

  BaseUser.fromMap(Map<dynamic, dynamic>  map) {
    _uId = map["uId"];
    notificationToken = map["notificationToken"] == null ? null : NotificationToken.fromMap(map["notificationToken"]);
    avatarURL = map["avatarURL"];
    name = map["name"];
    email = map["email"];
    emailVerified = map["emailVerified"];
    password = map["password"];
    createAt = map["createAt"];
    updateAt = map["updateAt"];
    phoneNumber = map["phoneNumber"] == null ? null : PhoneNumber.fromMap(map["phoneNumber"]);
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map["uId"] = _uId;
    map["notificationToken"] = notificationToken == null ? null : notificationToken.toMap();
    map["avatarURL"] = avatarURL;
    map["name"] = name;
    map["email"] = email;
    map["emailVerified"] = emailVerified;
    map["password"] = password;
    map["createAt"] = createAt;
    map["updateAt"] = updateAt;
    map["phoneNumber"] = phoneNumber == null ? null : phoneNumber.toMap();
    return map;
  }

  @override
  String getUid() {
    return _uId;
  }

  @override
  void setUid(String uId) {
    this._uId = uId;
  }

}

class NotificationToken {
  String token;
  bool active;

  NotificationToken(this.token) {
    active = true;
  }

  NotificationToken.fromMap(Map<dynamic, dynamic> map) {
    token = map["token"];
    active = map["active"] as bool;
  }

  toMap() {
    var map = new Map<String, dynamic>();
    map["token"] = token;
    map["active"] = active;
    return map;
  }
}