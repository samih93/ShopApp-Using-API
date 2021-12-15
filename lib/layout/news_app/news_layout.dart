import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: NewsLayoutController(),
      builder: (newsLayoutController) => Scaffold(
        appBar: AppBar(
          title: Text("News"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        body: newsLayoutController.screens[newsLayoutController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 30,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            currentIndex: newsLayoutController.currentIndex,
            onTap: (index) {
              newsLayoutController.onchangeIndex(index);
            },
            items: newsLayoutController.bottomItems),
      ),
    );
  }
}
