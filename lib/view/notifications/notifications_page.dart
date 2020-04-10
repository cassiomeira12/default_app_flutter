import 'package:default_app_flutter/model/user_notification.dart';
import 'package:default_app_flutter/contract/user/user_contract.dart';
import 'package:default_app_flutter/model/base_user.dart';
import 'package:default_app_flutter/presenter/user/user_presenter.dart';
import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/notifications/notification_widget.dart';
import 'package:default_app_flutter/view/notifications/notifications_settings_page.dart';
import 'package:default_app_flutter/view/page_router.dart';
import 'package:default_app_flutter/view/widgets/light_button.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'notification_page.dart';

class NotificationsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> implements UserContractView {
  final _formKey = GlobalKey<FormState>();

  UserContractPresenter presenter;

  List<UserNotification> notificationsList;

  @override
  void initState() {
    super.initState();
    presenter = UserPresenter(this);
    listNotifications();
  }

  void listNotifications() async {
    List<UserNotification> list = await presenter.listUserNotifications();
    setState(() {
      notificationsList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(NOTIFICATIONS, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Center(
                child: Text(
                  "Configurar",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: () => PageRouter.push(context, NotificationsSettingsPage()),
            ),
          ),
        ],
      ),
      body: Center(
        child: notificationsList == null ?
        showCircularProgress()
          :
        notificationsList.isEmpty ?
        semNotificacoes()
            :
        CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                  notificationsList.map<Widget>((item) {
                    return NotificationWidget(
                      notification: item,
                    );
                  }).toList()
              ),
            ),
          ],
        ),
      ),

//      body: Container(
//        alignment: Alignment.center,
//        child: Container(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            children: <Widget>[
//              semNotificacoes(),
////              PrimaryButton(
////                text: "Not",
////                onPressed: () {
////                  PageRouter.push(context, NotificationPage());
////                },
////              ),
//            ],
//          ),
//        ),
//      ),
    );
  }

  @override
  onFailure(String error) {
    // TODO: implement onFailure
    return null;
  }

  @override
  onSuccess(BaseUser user) {
    // TODO: implement onSuccess
    return null;
  }

  Widget showCircularProgress() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  Widget semNotificacoes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 80,
          height: 80,
          child: Image.asset("assets/notification.png"),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 12, 0, 8),
          child: Center(
            child: Text(
              "Você ainda não tem notificações",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.body2,
            ),
          ),
        )
      ],
    );
  }

}