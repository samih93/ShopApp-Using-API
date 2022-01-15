import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/social_app/notifications/notification_settings_controller.dart';

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
                        .onchageLikesNotification(value);
                  },
                  value: notificationSettingsController
                      .isGetLikesNotification.value,
                ),
              ),
              ListTile(
                leading: Icon(Icons.comment),
                title: Text("Comments"),
                trailing: Switch(
                  onChanged: (bool value) {},
                  value: true,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Firend Request"),
                trailing: Switch(
                  onChanged: (bool value) {},
                  value: true,
                ),
              ),
              ListTile(
                leading: Icon(Icons.sms),
                title: Text("SMS"),
                trailing: Switch(
                  onChanged: (bool value) {},
                  value: true,
                ),
              ),
              ListTile(
                leading: Icon(Icons.post_add),
                title: Text("Firends Post"),
                trailing: Switch(
                  onChanged: (bool value) {},
                  value: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
