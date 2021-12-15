import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper.dart';
import 'package:http/http.dart' as http;

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            DioHelper.getData(url: 'v2/top-headlines', query: {
              'country': 'eg',
              'category': 'business',
              'apiKey': '12290ceb1bf34821a6a71f937bb2d815'
            }).then((value) {
              // _business = value.data;
              print("from new controller" + value.data.toString());
            }).catchError((error) {
              print(error.toString());
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
