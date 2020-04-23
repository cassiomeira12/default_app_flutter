import 'package:default_app_flutter/contract/user/notification_contract.dart';
import 'package:default_app_flutter/model/user_notification.dart';
import 'package:default_app_flutter/services/firebase/firebase_notification_service.dart';

class NotificationPresenter extends NotificationContractPresenter {
  NotificationContractService service;

  NotificationPresenter(NotificationContractView view) : super(view) {
    service = FirebaseNotificationService();
  }

  @override
  Future<UserNotification> create(UserNotification item) {
    return service.create(item);
  }

  @override
  Future<UserNotification> read(UserNotification item) {
    return service.read(item);
  }

  @override
  Future<UserNotification> update(UserNotification item) {
    return service.update(item);
  }

  @override
  Future<UserNotification> delete(UserNotification item) {
    return service.delete(item);
  }

  @override
  Future<List<UserNotification>> findBy(String field, value) {
    return service.findBy(field, value);
  }

  @override
  Future<List<UserNotification>> list() async {
    await service.list().then((value) {
      view.listNotifications(value);
    }).catchError((error) {
      view.onFailure(error.message);
    });
  }

}