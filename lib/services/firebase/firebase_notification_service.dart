import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:default_app_flutter/contract/user/notification_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/model/user_notification.dart';
import 'package:default_app_flutter/strings.dart';

class FirebaseNotificationService extends NotificationContractService {
  CollectionReference _collection = Firestore.instance
    .collection(BaseUser.getCollection())
    .document(SingletonUser.instance.getUid())
    .collection(UserNotification.getCollection());

  @override
  Future<UserNotification> create(UserNotification item) async {
    String uId = _collection.document().documentID;

    item.setUid(uId);

    return await _collection.document(uId).setData(item.toMap()).then((result) {
      return item;
    }).catchError((error) {
      print("Erro ${error.toString()}");
      return null;
    });
  }

  @override
  Future<UserNotification> read(UserNotification item) {
    // TODO: implement read
    return null;
  }

  @override
  Future<UserNotification> update(UserNotification item) {
    return _collection.document(item.getUid()).updateData(item.toMap()).then((value) {
      return item;
    }).catchError((error) {
      print(error.message);
      return null;
    });
  }

  @override
  Future<UserNotification> delete(UserNotification item) {
    return _collection.document(item.getUid()).delete().timeout(Duration(seconds: 5)).then((value) {
      return item;
    }).catchError((error) {
      print(error.message);
      return item;
    });
  }

  @override
  Future<List<UserNotification>> findBy(String field, value) {
    // TODO: implement findBy
    return null;
  }

  @override
  Future<List<UserNotification>> list() async {
    List<UserNotification> list = List();

    var usersNotifications = await _collection.limit(20).getDocuments().timeout(Duration(seconds: 10)).then((value) {
      return value.documentChanges.map<UserNotification>((doc) => UserNotification.fromMap(doc.document.data)).toList();
    });
    list.addAll(usersNotifications);

    var geral = Firestore.instance.collection(UserNotification.getCollection());

    var notificationsDestinationUser = await geral.limit(20).where("destinationUser", isEqualTo: SingletonUser.instance.getUid()).getDocuments().then((value) {
      return value.documentChanges.map<UserNotification>((doc) => UserNotification.fromMap(doc.document.data)).toList();
    });
    list.addAll(notificationsDestinationUser);

    List<String> topics = ["ALL", PACKAGE_NAME];

    for (String topic in topics) {
      var notificationsTopic = await geral.limit(20).where("topic", isEqualTo: topic).getDocuments().then((value) {
        return value.documentChanges.map<UserNotification>((doc) => UserNotification.fromMap(doc.document.data)).toList();
      });
      list.addAll(notificationsTopic);
    }

    list.sort((a, b) {
      return b.createAt.compareTo(a.createAt);
    });

    return list;
  }

}