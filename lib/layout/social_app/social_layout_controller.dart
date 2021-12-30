import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/models/social_app/social_usermodel.dart';
import 'package:udemy_flutter/modules/social_app/chats/chat_screen.dart';
import 'package:udemy_flutter/modules/social_app/feeds/feeds_screen.dart';
import 'package:udemy_flutter/modules/social_app/new_post/new_post_screen.dart';
import 'package:udemy_flutter/modules/social_app/settings/setting_screen.dart';
import 'package:udemy_flutter/modules/social_app/users/users_screen.dart';
import 'package:udemy_flutter/shared/componets/constants.dart';

class SocialLayoutController extends GetxController {
  SocialLayoutController() {
    getUserData();
  }

// NOTE: -------------------Bottom Navigation------------------------
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chats"),
    BottomNavigationBarItem(icon: Icon(Icons.post_add_sharp), label: "Post"),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: "Users",
    ),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
  ];

  //NOTE: ---------------------------Screens----------------------------
  final screens = [
    SocialFeedsScreen(),
    SocialChatScreen(),
    NewPostScreen(),
    SocialUsersScreen(),
    SocialSettingScreen()
  ];

  //NOTE:  -------------------- Get User Data-------------------------
  SocialUserModel? _socialUserModel;
  SocialUserModel? get socialUserModel => _socialUserModel;

  void getUserData() {
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      _socialUserModel = SocialUserModel.fromJson(value.data()!);
      print("get user data :" + _socialUserModel!.email.toString());
    });
  }

  // NOTE: --------------------- On Change Index Of Screens ------------------

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void onchangeIndex(int index) {
    _currentIndex = index;
    update();
  }
}
