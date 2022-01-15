import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/social_app/notifications/notification_settings_controller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class SocialNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationSettingsController>(
      init: NotificationSettingsController(),
      builder: (notificationSettingsController) => Scaffold(
        appBar: AppBar(
          title: Text("Notification Setting"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Likes"),
                trailing: Switch(
                  onChanged: (bool value) {
                    notificationSettingsController
                        .onchangeLikesNotification(value);
                    //NOTE : Likes this is announcement for likes event
                    value == true
                        ? FirebaseMessaging.instance.subscribeToTopic("Likes")
                        : FirebaseMessaging.instance
                            .unsubscribeFromTopic("Likes");
                  },
                  value: notificationSettingsController
                      .isGetLikesNotification.value,
                ),
              ),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text("Comments"),
                trailing: Switch(
                  onChanged: (bool value) {
                    notificationSettingsController
                        .onchangeCommentNotification(value);
                    value == true
                        ? FirebaseMessaging.instance
                            .subscribeToTopic("comments")
                        : FirebaseMessaging.instance
                            .unsubscribeFromTopic("comments");
                  },
                  value: notificationSettingsController
                      .isGetCommentsNotification.value,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Firend Request"),
                trailing: Switch(
                  onChanged: (bool value) {
                    notificationSettingsController
                        .onchangeFriendRequestNotification(value);
                    value == true
                        ? FirebaseMessaging.instance
                            .subscribeToTopic("friendrequest")
                        : FirebaseMessaging.instance
                            .unsubscribeFromTopic("friendrequest");
                  },
                  value: notificationSettingsController
                      .isGetFriendRequestNotification.value,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sms),
                title: Text("SMS"),
                trailing: Switch(
                  onChanged: (bool value) {
                    notificationSettingsController
                        .onchangeSMSNotification(value);
                    value == true
                        ? FirebaseMessaging.instance.subscribeToTopic("sms")
                        : FirebaseMessaging.instance
                            .unsubscribeFromTopic("sms");
                  },
                  value:
                      notificationSettingsController.isGetSMSNotification.value,
                ),
              ),
              ListTile(
                leading: Icon(Icons.post_add),
                title: Text("Firends Post"),
                trailing: Switch(
                  onChanged: (bool value) {
                    notificationSettingsController
                        .onchangeFriendPostNotification(value);
                    value == true
                        ? FirebaseMessaging.instance
                            .subscribeToTopic("friendpost")
                        : FirebaseMessaging.instance
                            .unsubscribeFromTopic("friendpost");
                  },
                  value: notificationSettingsController
                      .isGetFriendPostNotification.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
