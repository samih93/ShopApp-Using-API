import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_flutter/modules/shop_app/search/search_controller.dart';
import 'package:udemy_flutter/shared/componets/componets.dart';

class ShopSearchScreen extends StatelessWidget {
  var textsearchController = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (searchController) => Scaffold(
        appBar: AppBar(
          title: defaultTextFormField(
              hinttext: "Search",
              border: InputBorder.none,
              controller: textsearchController,
              inputtype: TextInputType.text,
              onfieldsubmit: (value) {
                searchController.search(value.toString());
              },
              onchange: (value) {
                searchController.search(value.toString());
              }),
        ),
        body: searchController.isloadingsearch!
            ? Center(child: CircularProgressIndicator())
            : Form(
                key: _formkey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) => buildFavoriteItem(
                          searchController
                              .searchmodel!.data!.ListOfProduct[index],
                          issearch: true),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: searchController.searchmodel != null
                          ? searchController
                              .searchmodel!.data!.ListOfProduct.length
                          : 0),
                ),
              ),
      ),
    );
  }
}
