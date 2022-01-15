import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/social_app/social_layout_controller.dart';
import 'package:udemy_flutter/modules/social_app/new_post/new_post_screen.dart';
import 'package:udemy_flutter/modules/social_app/search/search_screen.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLayoutController>(
      init: SocialLayoutController(),
      builder: (socialLayoutController) => Scaffold(
        appBar: AppBar(
          title: Text(socialLayoutController
              .appbar_title[socialLayoutController.currentIndex]),
          actions: [
            IconButton(
                onPressed: () {
                  //socialLayoutController.pushNotification();
                },
                icon: Icon(Icons.notifications))
          ],
        ),
        body:
            socialLayoutController.screens[socialLayoutController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 30,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: defaultColor,
          onTap: (index) {
            //NOTE : if index equal 2 open NewPostScreen without change index
            if (index == 2)
              Get.to(NewPostScreen());
            else
              socialLayoutController.onchangeIndex(index);
          },
          currentIndex: socialLayoutController.currentIndex,
          items: socialLayoutController.bottomItems,
        ),
      ),
    );
  }
}
