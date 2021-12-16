import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class SportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
        init: Get.find<NewsLayoutController>(),
        builder: (newsLayoutController) => newsLayoutController.isloadingSports
            ? Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildArticleItem(newsLayoutController.sports[index]);
                },
                separatorBuilder: (context, index) => myDivider(),
                itemCount: newsLayoutController.sports.length));
  }
}
