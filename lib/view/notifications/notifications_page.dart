import 'package:default_app_flutter/strings.dart';
import 'package:default_app_flutter/view/page_router.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'notification_page.dart';

class NotificationsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(NOTIFICATIONS, style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              semNotificacoes(),
              PrimaryButton(
                text: "Not",
                onPressed: () {
                  PageRouter.push(context, NotificationPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget semNotificacoes() {
    return Column(
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