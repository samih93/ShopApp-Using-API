import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/modules/social_app/social_login/social_login.dart';
import 'package:udemy_flutter/shared/network/local/cashhelper.dart';

final Color primaryColor = Colors.deepPurple.shade900;

final String taskTable = "tasks";

void signOut() {
  CashHelper.removeDatabykey(key: "token").then((value) {
    if (value) {
      Get.off(ShopLoginScreen());
      token = "";
    }
  });
}

void SocialsignOut() {
  CashHelper.removeDatabykey(key: "uId").then((value) {
    if (value) {
      Get.off(SocialLoginScreen());
      token = "";
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String? token = "";

String? uId = "";

//NOTE ----------Get Date Formated For Task -----------------------------
String getDateFormated(String date) {
  List<String> listdate = date.split("T");
  List<String> list1date = listdate[1].split(":");
  return list1date[0] + ":" + list1date[1] + "   " + listdate[0];
}

//NOTE : cover DateTime To Ago
String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);

  if (diff.inDays >= 1) {
    return '${diff.inDays}d';
  } else if (diff.inHours >= 1) {
    return '${diff.inHours}h';
  } else if (diff.inMinutes >= 1) {
    return '${diff.inMinutes}m';
  } else if (diff.inSeconds >= 1) {
    return '${diff.inSeconds}s';
  } else {
    return 'just now';
  }
}
// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// for search
// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca


// NOTE: style
/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

// ToDo: 
// ! important 
// NOTE:    
// FIXME:    
// WARNING: 



//NOTE: 
