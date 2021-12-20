import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
        init: Get.find<NewsLayoutController>(),
        builder: (newsLayoutController) =>
            newsLayoutController.isloadingBusiness
                ? Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  )
                : ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildArticleItem(
                          newsLayoutController.business[index], context);
                    },
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: newsLayoutController.business.length));
  }
}
