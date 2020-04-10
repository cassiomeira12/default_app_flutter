import 'base_model.dart';

class Notification extends BaseModel<Notification> {
  static getCollection() => "notifications";

  String _uId;
  String title;
  String message;
  bool read;
  String avatarURL;
  String token;
  String topic;
  String type;

  Notification();

  @override
  String getUid() {
    return _uId;
  }

  @override
  setUid(String uId) {
    this._uId = uId;
  }

  Notification.fromMap(Map<dynamic, dynamic>  map) {
    _uId = map["uId"];
    title = map["title"];
    message = map["message"];
    read = map["read"] as bool;
    avatarURL = map["avatarURL"];
    token = map["token"];
    topic = map["topic"];
    type = map["type"];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map["uId"] = _uId;
    map["title"] = title;
    map["message"] = message;
    map["read"] = read;
    map["avatarURL"] = avatarURL;
    map["token"] = token;
    map["topic"] = topic;
    map["type"] = type;
    return map;
  }

  @override
  update(Notification item) {
    _uId = item.getUid();
    title = item.title;
    message = item.message;
    read = item.read;
    avatarURL = item.avatarURL;
    token = item.token;
    topic = item.topic;
    type = item.type;
  }

}