import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/modules/news_app/search/searchscreen.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
      builder: (newsLayoutController) => Scaffold(
        appBar: AppBar(
          title: Text("News"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(NewsSearchScreen());
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  newsLayoutController.onchangeThem();
                  print(newsLayoutController.isDarkMode);
                },
                icon: Icon(Icons.brightness_4_outlined)),
          ],
        ),
        body: newsLayoutController.screens[newsLayoutController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: defaultColor,
            currentIndex: newsLayoutController.currentIndex,
            onTap: (index) {
              newsLayoutController.onchangeIndex(index);
              if (index == 1) {
                newsLayoutController.getAllSports();
              }
              if (index == 2) {
                newsLayoutController.getAllScience();
              }
            },
            items: newsLayoutController.bottomItems),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            print(newsLayoutController.business.length);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
