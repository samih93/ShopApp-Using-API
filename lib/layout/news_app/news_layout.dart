import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/shared/network/remote/diohelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
            final response = await http.get(
                Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
            if (response.statusCode == 200) {
              // If the server did return a 200 OK response,
              // then parse the JSON.
              print(response.body.toString());
            } else {
              // If the server did not return a 200 OK response,
              // then throw an exception.
              throw Exception('Failed to load album');
            }
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
