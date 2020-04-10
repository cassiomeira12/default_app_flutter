import 'package:default_app_flutter/model/singleton/singleton_user.dart';
import 'package:default_app_flutter/model/user_notification.dart';
import 'package:default_app_flutter/view/notifications/notification_page.dart';
import 'package:default_app_flutter/view/page_router.dart';
import 'package:default_app_flutter/view/widgets/light_button.dart';
import 'package:default_app_flutter/view/widgets/primary_button.dart';
import 'package:default_app_flutter/view/widgets/secondary_button.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatefulWidget {
  final UserNotification notification;

  const NotificationWidget({this.notification});

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1,left: 0, right: 0, bottom: 0),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),),
          color: Color(0xFFE2FFF0),//Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //imageUser(SingletonUser.instance.avatarURL),
                  Expanded(child: titleWidget(),),
                  //buttonAction(),
                ],
              ),
              messageWidget(),
              dataWidget(),
            ],
          ),
          onPressed: () => PageRouter.push(context, NotificationPage(notification: widget.notification,)),
//          onPressed: () {
//
//          },
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        widget.notification.title,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.body2,
      ),
    );
  }

  Widget messageWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        widget.notification.message,
        //textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.body1,
      ),
    );
  }

  Widget dataWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Text(
        "${widget.notification.createdAt.day} de fev às ${widget.notification.createdAt.hour}:05",
        style: Theme.of(context).textTheme.display2,
        //textAlign: TextAlign.left,
      ),
    );
  }

  Widget buttonAction() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        child: RaisedButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          color: Theme.of(context).backgroundColor,
          child: Text("Button"),
          onPressed: () { },
        ),
      ),
    );
  }

  Widget imageUser(String url) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset("assets/marker_1.png"),
          Container(
            width: 40,
            height: 41,
            child: Image.asset("assets/user_default_img_white.png"),
          ),
          url == null ? Container() : imageNetworkURL(url),
        ],
      ),
    );
  }

  Widget imageNetworkURL(String url) {
    return Container(
      width: 37,
      height: 37,
      margin: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(url),
        ),
      ),
    );
  }


}

