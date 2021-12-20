import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
        init: Get.find<NewsLayoutController>(),
        builder: (newsLayoutController) => newsLayoutController.isloadingScience
            ? Scaffold(
                body: Center(child: CircularProgressIndicator()),
              )
            : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildArticleItem(
                      newsLayoutController.science[index], context);
                },
                separatorBuilder: (context, index) => myDivider(),
                itemCount: newsLayoutController.science.length));
  }
}
