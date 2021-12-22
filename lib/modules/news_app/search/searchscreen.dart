import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/layout/news_app/news_layoutController.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class NewsSearchScreen extends StatelessWidget {
  var textsearchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewsLayoutController>(
      init: Get.find<NewsLayoutController>(),
      builder: (newsLayoutController) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Container(
                height: 45,
                child: defaultTextFormField(
                    controller: textsearchcontroller,
                    inputtype: TextInputType.text,
                    prefixIcon: Icon(Icons.search),
                    onchange: (value) {
                      print(value);
                      newsLayoutController.getSearch(value.toString());
                    }),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return buildArticleItem(
                          newsLayoutController.search[index], context);
                    },
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: newsLayoutController.search.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
